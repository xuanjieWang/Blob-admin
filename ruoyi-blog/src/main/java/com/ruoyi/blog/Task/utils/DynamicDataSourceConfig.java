//package com.ruoyi.blog.Task.utils;
//
//import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceBuilder;
//import org.springframework.boot.context.properties.ConfigurationProperties;
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.context.annotation.Primary;
//
//import javax.sql.DataSource;
//import java.util.HashMap;
//import java.util.Map;
//
///**
// * @author 波波老师(weixin ： javabobo0513)
// * @desc 动态数据源配置类
// */
//@Configuration
//public class DynamicDataSourceConfig {
//
//    @Bean
//    @ConfigurationProperties("spring.datasource.druid.master")
//    public DataSource firstDataSource() {
//        return DruidDataSourceBuilder.create().build();
//    }
//
//    @Bean
//    @ConfigurationProperties("spring.datasource.druid.linux")
//    public DataSource secondDataSource() {
//        return DruidDataSourceBuilder.create().build();
//    }
//
//    @Bean
//    @Primary
//    public DynamicDataSource dataSource(DataSource firstDataSource, DataSource secondDataSource) {
//        Map<Object, Object> targetDataSources = new HashMap<>();
//        targetDataSources.put("master", firstDataSource);
//        targetDataSources.put("linux", secondDataSource);
//        return new DynamicDataSource(firstDataSource, targetDataSources);
//    }
//}
