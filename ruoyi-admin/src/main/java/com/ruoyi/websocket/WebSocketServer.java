package com.ruoyi.websocket;

import com.ruoyi.framework.websocket.SemaphoreUtils;
import com.ruoyi.framework.websocket.WebSocketUsers;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Semaphore;

/**
 * websocket 消息处理
 *
 * @author ruoyi
 */

//交给Spring来管理
@Component
//建立连接的端点
@ServerEndpoint("/websocket")
public class WebSocketServer {
    /**
     * WebSocketServer 日志控制器
     */
    private static final Logger LOGGER = LoggerFactory.getLogger(WebSocketServer.class);
    public static int socketMaxOnlineCount = 100;
    /**
     * concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
     */
    public static ConcurrentHashMap<String, WebSocketServer> webSocketSet = new ConcurrentHashMap<String, WebSocketServer>();
    private static Semaphore socketSemaphore = new Semaphore(socketMaxOnlineCount);
    /**
     * concurrent包的线程安全hashMap,用来存放每一个session里的参数信息
     */
    private static ConcurrentHashMap<String, String> hashMap = new ConcurrentHashMap<>();
    private Session session;

    /**
     * 给指定的人发送消息
     *
     * @param message
     */
    public static void sendToMessageByALLUser(String message) {

        if (!webSocketSet.isEmpty()) {
            webSocketSet.entrySet().stream().forEach(item -> {
                WebSocketServer socketServer = item.getValue();
                try {
                    socketServer.sendMessage(message);
                } catch (IOException e) {
                }
            });
        }
    }

    public static ConcurrentHashMap<String, String> getHashMap() {
        return hashMap;
    }

    /**
     * 连接建立成功调用的方法
     */
    @OnOpen
    public void onOpen(Session session) throws Exception {
        boolean semaphoreFlag = false;
        // 尝试获取信号量
        semaphoreFlag = SemaphoreUtils.tryAcquire(socketSemaphore);
        if (!semaphoreFlag) {
            LOGGER.error("\n 当前在线人数超过限制数- {}", socketMaxOnlineCount);
            WebSocketUsers.sendMessageToUserByText(session, "忙碌中,请稍后再试...");
            session.close();
        } else {
            WebSocketUsers.put(session.getId(), session);

            this.session = session;
            webSocketSet.put(session.getId(), this);
            LOGGER.info("\n 建立连接 - {}", session);
            LOGGER.info("\n 当前人数 - {}", WebSocketUsers.getUsers().size());
        }
    }

    /**
     * 连接关闭时处理
     */
    @OnClose
    public void onClose(Session session) {
        LOGGER.info("\n 关闭连接 - {}", session);
        // 移除用户
        WebSocketUsers.remove(session.getId());
        webSocketSet.remove(session.getId());
        // 获取到信号量则需释放
        SemaphoreUtils.release(socketSemaphore);
    }

    /**
     * 抛出异常时处理
     */
    @OnError
    public void onError(Session session, Throwable exception) throws Exception {
        if (session.isOpen()) {
            // 关闭连接
            session.close();
        }
        String sessionId = session.getId();
        LOGGER.info("\n 连接异常 - {}", sessionId);
        LOGGER.info("\n 异常信息 - {}", exception);
        // 移出用户
        WebSocketUsers.remove(sessionId);
        webSocketSet.remove(sessionId);
        // 获取到信号量则需释放
        SemaphoreUtils.release(socketSemaphore);
    }

    /**
     * 服务器接收到客户端消息时调用的方法
     */
    @OnMessage
    public void onMessage(String message, Session session) throws Exception {
    }

    public void sendMessage(String message) throws IOException {
        synchronized (session) {
            getSession().getBasicRemote().sendText(message);
        }
    }

    public Session getSession() {
        return session;
    }
}
