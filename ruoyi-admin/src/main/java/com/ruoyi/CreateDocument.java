package com.ruoyi;

import cn.smallbun.screw.core.Configuration;
import cn.smallbun.screw.core.engine.EngineConfig;
import cn.smallbun.screw.core.engine.EngineFileType;
import cn.smallbun.screw.core.engine.EngineTemplateType;
import cn.smallbun.screw.core.execute.DocumentationExecute;
import cn.smallbun.screw.core.process.ProcessConfig;
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import javax.sql.DataSource;
import java.util.ArrayList;

public class CreateDocument {
    public static void main(String[] args) {
        //数据源 这里的配置就跟我们使用Springboot是一样的,如果是PostgreSQL也可以通过currentSchema参数来控制需要生成的schema
        HikariConfig hikariConfig = new HikariConfig();
        hikariConfig.setDriverClassName("com.mysql.jdbc.Driver");
        hikariConfig.setJdbcUrl("jdbc:mysql://localhost:3306/blog?allowMultiQueries=true&useUnicode=true&characterEncoding=UTF-8");
        hikariConfig.setUsername("root");
        hikariConfig.setPassword("root");
        //设置可以获取tables remarks信息
        hikariConfig.addDataSourceProperty("useInformationSchema", "true");
        hikariConfig.setMinimumIdle(2);
        hikariConfig.setMaximumPoolSize(5);
        DataSource dataSource = new HikariDataSource(hikariConfig);
        //生成配置 最后会生成一个文件,文件的形式根据这边的配置而来
        EngineConfig engineConfig = EngineConfig.builder()
                //生成文件路径 我
                .fileOutputDir(System.getProperty("user.dir"))
                //打开目录
                .openOutputDir(true)
                //文件类型 还可以选择HTML或者WORD
                .fileType(EngineFileType.WORD)
                //生成模板实现
                .produceType(EngineTemplateType.freemarker)
                //自定义文件名称
                .fileName("博客后端数据表").build();
        // 生成表配置,可以自由控制想要生成的数据表,我这边仅生成3张表用作示例
        ProcessConfig processConfig = ProcessConfig.builder()
                //指定生成逻辑、当存在指定表、指定表前缀、指定表后缀时，将生成指定表，其余表不生成、并跳过忽略表配置
                //根据名称指定表生成
                .designatedTableName(new ArrayList<String>() {{
                    add("t_heap");
                }})
                //根据表前缀生成
                .designatedTablePrefix(new ArrayList<>())
                //根据表后缀生成
                .designatedTableSuffix(new ArrayList<>())
                //忽略表名
                .ignoreTableName(new ArrayList<>())
                //忽略表前缀
                .ignoreTablePrefix(new ArrayList<>())
                //忽略表后缀
                .ignoreTableSuffix(new ArrayList<>()).build();
        //配置
        Configuration config = Configuration.builder()
                //版本
                .version("1.0.0")
                //描述
                .description("EMS后端数据库文档")
                //数据源
                .dataSource(dataSource)
                //生成配置
                .engineConfig(engineConfig)
                //生成配置
                .produceConfig(processConfig)
                .build();
        //执行生成
        new DocumentationExecute(config).execute();
    }
}
