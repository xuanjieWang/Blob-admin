//package com.ruoyi.blog.Task.utils;
//
//import lombok.extern.slf4j.Slf4j;
//import org.aspectj.lang.ProceedingJoinPoint;
//import org.aspectj.lang.annotation.Around;
//import org.aspectj.lang.annotation.Aspect;
//import org.aspectj.lang.annotation.Pointcut;
//import org.aspectj.lang.reflect.MethodSignature;
//import org.springframework.core.Ordered;
//import org.springframework.stereotype.Component;
//
//import java.lang.reflect.Method;
//
///**
// * 切面处理类，处理多数据源相关功能
// */
//@Slf4j
//@Aspect
//@Component
//public class DataSourceAspect implements Ordered {
//
//    //定义切入点
//    @Pointcut("@annotation(com.ruoyi.blog.Task.utils.DataSource)")
//    public void pointCut() {
//    }
//
//    //环绕通知
//    @Around("pointCut()")
//    public Object around(ProceedingJoinPoint point) throws Throwable {
//        MethodSignature signature = (MethodSignature) point.getSignature();
//        Method method = signature.getMethod();
//        DataSource ds = method.getAnnotation(DataSource.class);
//        //开始设置数据源
//        DynamicDataSource.setDataSource("linux");
//
////        if (ds == null) {
////            //设置默认数据源
////            DynamicDataSource.setDataSource("db1");
////            log.info("set datasource is " + ds.name());
////        } else {
////            DynamicDataSource.setDataSource(ds.name());
////            log.info("set datasource is " + ds.name());
////        }
//        try {
//            return point.proceed();
//        } finally {
//            DynamicDataSource.clearDataSource();
//            log.info("clean datasource");
//        }
//    }
//
//    @Override
//    public int getOrder() {
//        return 1;
//    }
//}
