//package com.ruoyi.blog.Task.utils;
//
//import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;
//
//import javax.sql.DataSource;
//import java.util.Map;
//
///**
// * @desc 动态数据源
// */
//public class DynamicDataSource extends AbstractRoutingDataSource {
//    private static final ThreadLocal<String> contextHolder = new ThreadLocal<>();
//
//    public DynamicDataSource(DataSource defaultTargetDataSource, Map<Object, Object> targetDataSources) {
//        super.setDefaultTargetDataSource(defaultTargetDataSource);
//        super.setTargetDataSources(targetDataSources);
//        super.afterPropertiesSet();
//    }
//
//    public static String getDataSource() {
//        return contextHolder.get();
//    }
//
//    public static void setDataSource(String dataSource) {
//        contextHolder.set(dataSource);
//    }
//
//    public static void clearDataSource() {
//        contextHolder.remove();
//    }
//
//    @Override
//    protected Object determineCurrentLookupKey() {
//        return getDataSource();
//    }
//
//}
