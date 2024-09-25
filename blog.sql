/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80401
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 80401
 File Encoding         : 65001

 Date: 31/07/2024 16:24:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for a_blog
-- ----------------------------
DROP TABLE IF EXISTS `a_blog`;
CREATE TABLE `a_blog`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `common_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `video_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_blog
-- ----------------------------

-- ----------------------------
-- Table structure for a_comment
-- ----------------------------
DROP TABLE IF EXISTS `a_comment`;
CREATE TABLE `a_comment`  (
  `id` bigint(0) NOT NULL,
  `blog_id` bigint(0) NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id_delete` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_id` bigint(0) NULL DEFAULT NULL,
  `video_id` int(0) NULL DEFAULT NULL,
  `like_count` int(0) NULL DEFAULT NULL,
  `root_comment_id` int(0) NULL DEFAULT NULL,
  `to_comment_id` int(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of a_comment
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 't_heap', 'BMU设备信息数据表', NULL, NULL, 'THeap', 'crud', 'com.ruoyi.system', 'system', 'heap', 'BMU设备信息数据', 'ruoyi', '0', '/', NULL, 'admin', '2023-12-18 16:25:18', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(0) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'heap_id', '堆ID，EMSU 设备ID', 'bigint unsigned', 'String', 'heapId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2023-12-18 16:25:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (2, 1, 'location', '堆设备位置', 'varchar(255)', 'String', 'location', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-12-18 16:25:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (3, 1, 'heap_status', '设备状态（0：启用；1：停用；2：在线；3：离线；4：其他）', 'varchar(1)', 'String', 'heapStatus', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 3, 'admin', '2023-12-18 16:25:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (4, 1, 'port', '端口号', 'int', 'Long', 'port', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-12-18 16:25:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (5, 1, 'slave_address', '设备地址位置', 'varchar(5)', 'String', 'slaveAddress', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-12-18 16:25:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (6, 1, 'cluster_count', '电池簇数（电池组数）', 'int', 'Long', 'clusterCount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-12-18 16:25:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (7, 1, 'battery_type', '电池类型\r\n', 'double', 'Long', 'batteryType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 7, 'admin', '2023-12-18 16:25:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (8, 1, 'battery_range', '电池量程', 'int', 'Long', 'batteryRange', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-12-18 16:25:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, 1, 'battery_count', '电池数量', 'int', 'Long', 'batteryCount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-12-18 16:25:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, 1, 'alarm_open', '告警开关 \"0\" 关闭 1 开启', 'varchar(2)', 'String', 'alarmOpen', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-12-18 16:25:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2023-12-18 16:25:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2023-12-18 16:25:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, 1, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2023-12-18 16:25:18', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, 1, 'battery_capacity', '电池容量', 'int', 'Long', 'batteryCapacity', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2023-12-18 16:25:18', '', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(0) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(0) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(0) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(0) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(0) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(0) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(0) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(0) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(0) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(0) NOT NULL COMMENT '开始时间',
  `end_time` bigint(0) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(0) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-08-30 06:46:57', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-08-30 06:46:57', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-08-30 06:46:57', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2023-08-30 06:46:57', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-08-30 06:46:57', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-08-30 06:46:57', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-08-30 06:46:56', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-08-30 06:46:56', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-08-30 06:46:56', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-08-30 06:46:56', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-08-30 06:46:56', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-08-30 06:46:56', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-08-30 06:46:56', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-08-30 06:46:56', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-08-30 06:46:56', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-08-30 06:46:56', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '在线', '1', 'the_heap_net_status', NULL, 'success', 'N', '0', 'admin', '2023-09-19 04:18:53', 'admin', '2023-09-19 04:42:15', '在线');
INSERT INTO `sys_dict_data` VALUES (101, 2, '离线', '0', 'the_heap_net_status', NULL, 'danger', 'N', '0', 'admin', '2023-09-19 04:19:18', 'admin', '2023-09-19 04:42:26', '离线');
INSERT INTO `sys_dict_data` VALUES (102, 1, '1.2', '0', 'the_heap_battery_type', NULL, 'default', 'N', '0', 'admin', '2023-10-07 22:06:53', 'admin', '2023-10-18 15:57:40', NULL);
INSERT INTO `sys_dict_data` VALUES (103, 2, '2', '1', 'the_heap_battery_type', NULL, 'default', 'N', '0', 'admin', '2023-10-07 22:07:02', 'admin', '2023-10-18 15:57:49', NULL);
INSERT INTO `sys_dict_data` VALUES (104, 3, '4', '2', 'the_heap_battery_type', NULL, 'default', 'N', '0', 'admin', '2023-10-07 22:07:09', 'admin', '2023-10-18 15:57:53', NULL);
INSERT INTO `sys_dict_data` VALUES (105, 4, '6', '3', 'the_heap_battery_type', NULL, 'default', 'N', '0', 'admin', '2023-10-07 22:07:13', 'admin', '2023-10-18 15:57:56', NULL);
INSERT INTO `sys_dict_data` VALUES (106, 5, '12', '4', 'the_heap_battery_type', NULL, 'default', 'N', '0', 'admin', '2023-10-07 22:07:16', 'admin', '2023-10-18 15:58:01', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-08-30 06:46:57', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '设备在线状态', 'the_heap_net_status', '0', 'admin', '2023-09-19 04:17:39', '', NULL, '设备在线状态');
INSERT INTO `sys_dict_type` VALUES (101, '电池组电池类型', 'the_heap_battery_type', '0', 'admin', '2023-10-07 22:06:01', '', NULL, '电池组电池类型');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-08-30 06:46:57', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-08-30 06:46:57', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-08-30 06:46:57', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1180 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-08-30 06:47:31');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-08-30 06:47:37');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-08-30 06:47:37');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-08-30 06:47:45');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-08-30 06:47:45');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-08-30 06:48:15');
INSERT INTO `sys_logininfor` VALUES (106, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-12 13:52:52');
INSERT INTO `sys_logininfor` VALUES (107, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-12 13:53:04');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 13:53:24');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 15:20:16');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-12 16:56:46');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-13 00:28:20');
INSERT INTO `sys_logininfor` VALUES (112, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-13 02:03:14');
INSERT INTO `sys_logininfor` VALUES (113, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-13 02:03:15');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-13 02:03:18');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-13 03:40:49');
INSERT INTO `sys_logininfor` VALUES (116, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-16 01:36:20');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-16 01:36:22');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-16 04:40:52');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-16 05:27:39');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-16 09:59:32');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-16 15:01:55');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-16 17:56:04');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-17 16:12:12');
INSERT INTO `sys_logininfor` VALUES (124, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-17 17:57:13');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-17 17:57:15');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-17 18:34:29');
INSERT INTO `sys_logininfor` VALUES (127, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-17 19:43:19');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-17 19:43:25');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-17 23:21:11');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-17 23:51:52');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-18 00:59:56');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-18 05:52:35');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-18 05:52:41');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-18 09:30:01');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-18 09:40:14');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-18 10:52:43');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-18 11:52:59');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-18 15:49:59');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-18 18:51:58');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-18 20:55:25');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-19 01:14:32');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-19 01:35:12');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-19 02:31:44');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-19 02:37:42');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-19 03:57:20');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-19 09:08:01');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-19 11:09:28');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-19 12:10:23');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-19 13:18:11');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-19 15:14:07');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-19 17:32:16');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-19 18:34:33');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-20 00:22:41');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-20 01:49:21');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-20 06:26:12');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-20 09:00:51');
INSERT INTO `sys_logininfor` VALUES (157, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-20 10:48:21');
INSERT INTO `sys_logininfor` VALUES (158, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-09-20 10:48:21');
INSERT INTO `sys_logininfor` VALUES (159, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-20 10:48:36');
INSERT INTO `sys_logininfor` VALUES (160, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 08:59:33');
INSERT INTO `sys_logininfor` VALUES (161, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 09:00:02');
INSERT INTO `sys_logininfor` VALUES (162, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 09:08:32');
INSERT INTO `sys_logininfor` VALUES (163, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 09:29:53');
INSERT INTO `sys_logininfor` VALUES (164, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 09:31:33');
INSERT INTO `sys_logininfor` VALUES (165, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 09:52:42');
INSERT INTO `sys_logininfor` VALUES (166, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 11:50:54');
INSERT INTO `sys_logininfor` VALUES (167, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 12:56:57');
INSERT INTO `sys_logininfor` VALUES (168, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 13:03:24');
INSERT INTO `sys_logininfor` VALUES (169, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 14:51:34');
INSERT INTO `sys_logininfor` VALUES (170, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 15:22:00');
INSERT INTO `sys_logininfor` VALUES (171, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-24 15:49:53');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 15:50:00');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-24 15:56:39');
INSERT INTO `sys_logininfor` VALUES (174, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 15:56:46');
INSERT INTO `sys_logininfor` VALUES (175, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 17:57:29');
INSERT INTO `sys_logininfor` VALUES (176, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 17:58:50');
INSERT INTO `sys_logininfor` VALUES (177, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 18:02:38');
INSERT INTO `sys_logininfor` VALUES (178, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 18:14:38');
INSERT INTO `sys_logininfor` VALUES (179, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 18:15:12');
INSERT INTO `sys_logininfor` VALUES (180, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 18:15:33');
INSERT INTO `sys_logininfor` VALUES (181, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 18:17:22');
INSERT INTO `sys_logininfor` VALUES (182, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 18:24:53');
INSERT INTO `sys_logininfor` VALUES (183, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 18:25:46');
INSERT INTO `sys_logininfor` VALUES (184, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 19:16:49');
INSERT INTO `sys_logininfor` VALUES (185, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 20:24:46');
INSERT INTO `sys_logininfor` VALUES (186, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 20:32:35');
INSERT INTO `sys_logininfor` VALUES (187, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 20:41:26');
INSERT INTO `sys_logininfor` VALUES (188, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-24 21:48:19');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 21:48:21');
INSERT INTO `sys_logininfor` VALUES (190, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-24 22:05:49');
INSERT INTO `sys_logininfor` VALUES (191, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 22:05:57');
INSERT INTO `sys_logininfor` VALUES (192, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 22:09:13');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 23:12:07');
INSERT INTO `sys_logininfor` VALUES (194, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-24 23:16:08');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-25 01:16:24');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-25 02:43:35');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-25 06:26:15');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-25 07:54:24');
INSERT INTO `sys_logininfor` VALUES (199, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-25 07:58:18');
INSERT INTO `sys_logininfor` VALUES (200, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-25 08:31:22');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-25 08:54:54');
INSERT INTO `sys_logininfor` VALUES (202, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-25 10:05:56');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-25 13:02:46');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-25 14:22:20');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-25 16:19:13');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-25 18:31:01');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-25 20:04:19');
INSERT INTO `sys_logininfor` VALUES (208, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-25 21:40:10');
INSERT INTO `sys_logininfor` VALUES (209, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-25 23:30:51');
INSERT INTO `sys_logininfor` VALUES (210, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 02:31:45');
INSERT INTO `sys_logininfor` VALUES (211, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 02:31:58');
INSERT INTO `sys_logininfor` VALUES (212, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 03:01:02');
INSERT INTO `sys_logininfor` VALUES (213, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-09-26 03:01:14');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 03:01:54');
INSERT INTO `sys_logininfor` VALUES (215, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-09-26 03:13:51');
INSERT INTO `sys_logininfor` VALUES (216, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-09-26 03:13:51');
INSERT INTO `sys_logininfor` VALUES (217, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 03:13:55');
INSERT INTO `sys_logininfor` VALUES (218, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 03:15:18');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 03:15:31');
INSERT INTO `sys_logininfor` VALUES (220, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 03:16:52');
INSERT INTO `sys_logininfor` VALUES (221, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 03:27:07');
INSERT INTO `sys_logininfor` VALUES (222, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 03:48:42');
INSERT INTO `sys_logininfor` VALUES (223, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-26 15:09:37');
INSERT INTO `sys_logininfor` VALUES (224, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-27 03:48:26');
INSERT INTO `sys_logininfor` VALUES (225, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-27 03:50:33');
INSERT INTO `sys_logininfor` VALUES (226, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-09-27 03:54:07');
INSERT INTO `sys_logininfor` VALUES (227, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-06 09:15:19');
INSERT INTO `sys_logininfor` VALUES (228, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-06 09:55:28');
INSERT INTO `sys_logininfor` VALUES (229, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-06 10:15:06');
INSERT INTO `sys_logininfor` VALUES (230, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-06 12:49:04');
INSERT INTO `sys_logininfor` VALUES (231, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-06 16:21:21');
INSERT INTO `sys_logininfor` VALUES (232, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-06 18:00:07');
INSERT INTO `sys_logininfor` VALUES (233, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-06 18:49:47');
INSERT INTO `sys_logininfor` VALUES (234, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-06 19:30:05');
INSERT INTO `sys_logininfor` VALUES (235, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-06 21:42:06');
INSERT INTO `sys_logininfor` VALUES (236, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-07 03:27:26');
INSERT INTO `sys_logininfor` VALUES (237, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-07 04:53:59');
INSERT INTO `sys_logininfor` VALUES (238, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-07 05:11:58');
INSERT INTO `sys_logininfor` VALUES (239, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-07 05:54:59');
INSERT INTO `sys_logininfor` VALUES (240, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-07 06:32:07');
INSERT INTO `sys_logininfor` VALUES (241, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-07 07:50:14');
INSERT INTO `sys_logininfor` VALUES (242, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-07 10:08:53');
INSERT INTO `sys_logininfor` VALUES (243, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-07 10:08:57');
INSERT INTO `sys_logininfor` VALUES (244, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-07 11:27:55');
INSERT INTO `sys_logininfor` VALUES (245, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-07 13:25:33');
INSERT INTO `sys_logininfor` VALUES (246, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-07 14:40:28');
INSERT INTO `sys_logininfor` VALUES (247, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-07 14:43:01');
INSERT INTO `sys_logininfor` VALUES (248, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-07 15:12:15');
INSERT INTO `sys_logininfor` VALUES (249, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-07 15:27:42');
INSERT INTO `sys_logininfor` VALUES (250, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-07 17:43:18');
INSERT INTO `sys_logininfor` VALUES (251, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-07 18:58:25');
INSERT INTO `sys_logininfor` VALUES (252, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-07 20:24:30');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-07 22:04:01');
INSERT INTO `sys_logininfor` VALUES (254, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-07 23:53:22');
INSERT INTO `sys_logininfor` VALUES (255, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-08 03:01:21');
INSERT INTO `sys_logininfor` VALUES (256, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-08 03:45:53');
INSERT INTO `sys_logininfor` VALUES (257, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-08 04:13:45');
INSERT INTO `sys_logininfor` VALUES (258, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-08 06:41:35');
INSERT INTO `sys_logininfor` VALUES (259, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-08 06:47:21');
INSERT INTO `sys_logininfor` VALUES (260, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-08 07:49:27');
INSERT INTO `sys_logininfor` VALUES (261, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-08 07:50:00');
INSERT INTO `sys_logininfor` VALUES (262, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-08 08:54:48');
INSERT INTO `sys_logininfor` VALUES (263, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-08 10:29:25');
INSERT INTO `sys_logininfor` VALUES (264, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-08 10:50:14');
INSERT INTO `sys_logininfor` VALUES (265, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-08 10:50:19');
INSERT INTO `sys_logininfor` VALUES (266, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-10 16:15:41');
INSERT INTO `sys_logininfor` VALUES (267, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-10 16:23:31');
INSERT INTO `sys_logininfor` VALUES (268, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-10-10 16:25:18');
INSERT INTO `sys_logininfor` VALUES (269, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-10 16:25:18');
INSERT INTO `sys_logininfor` VALUES (270, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-10 16:25:22');
INSERT INTO `sys_logininfor` VALUES (271, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-10 16:28:55');
INSERT INTO `sys_logininfor` VALUES (272, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-10 16:47:46');
INSERT INTO `sys_logininfor` VALUES (273, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-10 17:07:00');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-10 17:07:07');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-10 17:22:31');
INSERT INTO `sys_logininfor` VALUES (276, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-10 17:44:20');
INSERT INTO `sys_logininfor` VALUES (277, 'root', '61.242.133.76', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-10 21:54:25');
INSERT INTO `sys_logininfor` VALUES (278, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-11 08:31:16');
INSERT INTO `sys_logininfor` VALUES (279, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-11 09:20:46');
INSERT INTO `sys_logininfor` VALUES (280, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-11 14:30:04');
INSERT INTO `sys_logininfor` VALUES (281, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-11 14:33:27');
INSERT INTO `sys_logininfor` VALUES (282, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-11 15:01:29');
INSERT INTO `sys_logininfor` VALUES (283, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-11 17:38:35');
INSERT INTO `sys_logininfor` VALUES (284, 'root', '61.242.132.47', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-11 22:17:14');
INSERT INTO `sys_logininfor` VALUES (285, 'root', '61.242.132.47', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-11 22:51:22');
INSERT INTO `sys_logininfor` VALUES (286, 'root', '61.242.132.47', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-11 23:15:16');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '61.242.132.47', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-11 23:15:22');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '61.242.132.47', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-11 23:34:03');
INSERT INTO `sys_logininfor` VALUES (289, 'root', '61.242.132.47', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-11 23:40:20');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-12 09:16:47');
INSERT INTO `sys_logininfor` VALUES (291, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-10-12 10:45:03');
INSERT INTO `sys_logininfor` VALUES (292, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-12 10:45:03');
INSERT INTO `sys_logininfor` VALUES (293, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-10-12 10:47:18');
INSERT INTO `sys_logininfor` VALUES (294, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-12 10:47:18');
INSERT INTO `sys_logininfor` VALUES (295, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-12 10:48:07');
INSERT INTO `sys_logininfor` VALUES (296, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-12 10:54:21');
INSERT INTO `sys_logininfor` VALUES (297, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-12 10:55:02');
INSERT INTO `sys_logininfor` VALUES (298, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-12 10:55:21');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-12 10:55:27');
INSERT INTO `sys_logininfor` VALUES (300, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-12 10:56:07');
INSERT INTO `sys_logininfor` VALUES (301, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-12 11:06:33');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-12 11:07:02');
INSERT INTO `sys_logininfor` VALUES (303, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-12 11:08:11');
INSERT INTO `sys_logininfor` VALUES (304, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-12 11:08:57');
INSERT INTO `sys_logininfor` VALUES (305, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-10-12 11:10:50');
INSERT INTO `sys_logininfor` VALUES (306, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-12 11:10:50');
INSERT INTO `sys_logininfor` VALUES (307, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-10-12 11:10:51');
INSERT INTO `sys_logininfor` VALUES (308, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-12 11:10:51');
INSERT INTO `sys_logininfor` VALUES (309, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-12 11:10:56');
INSERT INTO `sys_logininfor` VALUES (310, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-12 11:19:42');
INSERT INTO `sys_logininfor` VALUES (311, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-12 11:20:04');
INSERT INTO `sys_logininfor` VALUES (312, 'root', '103.172.41.204', 'XX XX', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-12 12:46:05');
INSERT INTO `sys_logininfor` VALUES (313, 'root', '103.172.41.204', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-12 12:46:09');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-12 15:28:21');
INSERT INTO `sys_logininfor` VALUES (315, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-12 15:41:46');
INSERT INTO `sys_logininfor` VALUES (316, 'root', '61.242.132.47', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-12 21:56:14');
INSERT INTO `sys_logininfor` VALUES (317, 'root', '61.242.132.47', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-12 22:57:50');
INSERT INTO `sys_logininfor` VALUES (318, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-13 09:15:40');
INSERT INTO `sys_logininfor` VALUES (319, 'root', '115.201.135.55', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-13 09:34:22');
INSERT INTO `sys_logininfor` VALUES (320, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-13 13:59:31');
INSERT INTO `sys_logininfor` VALUES (321, 'admin', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-13 14:56:24');
INSERT INTO `sys_logininfor` VALUES (322, 'root', '171.114.82.154', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-13 17:30:34');
INSERT INTO `sys_logininfor` VALUES (323, 'root', '117.153.55.157', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-13 21:15:38');
INSERT INTO `sys_logininfor` VALUES (324, 'root', '61.242.133.116', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-15 20:52:11');
INSERT INTO `sys_logininfor` VALUES (325, 'root', '61.242.133.116', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-15 22:23:48');
INSERT INTO `sys_logininfor` VALUES (326, 'root', '171.114.82.5', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-16 08:46:56');
INSERT INTO `sys_logininfor` VALUES (327, 'root', '171.114.82.5', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-16 08:56:15');
INSERT INTO `sys_logininfor` VALUES (328, 'root', '171.114.82.5', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-16 11:35:03');
INSERT INTO `sys_logininfor` VALUES (329, 'root', '171.114.82.5', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-16 12:28:05');
INSERT INTO `sys_logininfor` VALUES (330, 'root', '171.114.82.5', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-16 14:50:19');
INSERT INTO `sys_logininfor` VALUES (331, 'root', '61.242.133.111', 'XX XX', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-16 22:35:53');
INSERT INTO `sys_logininfor` VALUES (332, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 16:10:22');
INSERT INTO `sys_logininfor` VALUES (333, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 17:30:25');
INSERT INTO `sys_logininfor` VALUES (334, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 17:30:44');
INSERT INTO `sys_logininfor` VALUES (335, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-17 17:30:56');
INSERT INTO `sys_logininfor` VALUES (336, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 17:31:01');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-17 21:50:29');
INSERT INTO `sys_logininfor` VALUES (338, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 14:24:06');
INSERT INTO `sys_logininfor` VALUES (339, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-18 14:24:10');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 14:24:17');
INSERT INTO `sys_logininfor` VALUES (341, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 14:31:40');
INSERT INTO `sys_logininfor` VALUES (342, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 15:00:10');
INSERT INTO `sys_logininfor` VALUES (343, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-18 15:44:10');
INSERT INTO `sys_logininfor` VALUES (344, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 15:45:11');
INSERT INTO `sys_logininfor` VALUES (345, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-10-18 15:56:57');
INSERT INTO `sys_logininfor` VALUES (346, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 15:57:04');
INSERT INTO `sys_logininfor` VALUES (347, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-18 16:37:39');
INSERT INTO `sys_logininfor` VALUES (348, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-20 16:43:15');
INSERT INTO `sys_logininfor` VALUES (349, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-26 10:33:29');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 08:39:01');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:02');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:27');
INSERT INTO `sys_logininfor` VALUES (353, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:28');
INSERT INTO `sys_logininfor` VALUES (354, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:30');
INSERT INTO `sys_logininfor` VALUES (355, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:34');
INSERT INTO `sys_logininfor` VALUES (356, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:34');
INSERT INTO `sys_logininfor` VALUES (357, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:44');
INSERT INTO `sys_logininfor` VALUES (358, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:51');
INSERT INTO `sys_logininfor` VALUES (359, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:51');
INSERT INTO `sys_logininfor` VALUES (360, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:52');
INSERT INTO `sys_logininfor` VALUES (361, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:52');
INSERT INTO `sys_logininfor` VALUES (362, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:53');
INSERT INTO `sys_logininfor` VALUES (363, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:53');
INSERT INTO `sys_logininfor` VALUES (364, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:53');
INSERT INTO `sys_logininfor` VALUES (365, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:53');
INSERT INTO `sys_logininfor` VALUES (366, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:53');
INSERT INTO `sys_logininfor` VALUES (367, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:54');
INSERT INTO `sys_logininfor` VALUES (368, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:54');
INSERT INTO `sys_logininfor` VALUES (369, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:54');
INSERT INTO `sys_logininfor` VALUES (370, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:06:54');
INSERT INTO `sys_logininfor` VALUES (371, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:07:02');
INSERT INTO `sys_logininfor` VALUES (372, 'admin11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：admin11 不存在', '2023-10-30 16:08:17');
INSERT INTO `sys_logininfor` VALUES (373, 'admin11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：admin11 不存在', '2023-10-30 16:08:19');
INSERT INTO `sys_logininfor` VALUES (374, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:08:23');
INSERT INTO `sys_logininfor` VALUES (375, 'admin3', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：admin3 不存在', '2023-10-30 16:14:36');
INSERT INTO `sys_logininfor` VALUES (376, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:14:40');
INSERT INTO `sys_logininfor` VALUES (377, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:17:16');
INSERT INTO `sys_logininfor` VALUES (378, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:17:17');
INSERT INTO `sys_logininfor` VALUES (379, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:17:17');
INSERT INTO `sys_logininfor` VALUES (380, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:17:17');
INSERT INTO `sys_logininfor` VALUES (381, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:17:17');
INSERT INTO `sys_logininfor` VALUES (382, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:17:17');
INSERT INTO `sys_logininfor` VALUES (383, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:17:18');
INSERT INTO `sys_logininfor` VALUES (384, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:17:18');
INSERT INTO `sys_logininfor` VALUES (385, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:17:18');
INSERT INTO `sys_logininfor` VALUES (386, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:17:19');
INSERT INTO `sys_logininfor` VALUES (387, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-10-30 16:17:20');
INSERT INTO `sys_logininfor` VALUES (388, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-30 16:17:20');
INSERT INTO `sys_logininfor` VALUES (389, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-10-30 16:17:20');
INSERT INTO `sys_logininfor` VALUES (390, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-30 16:17:20');
INSERT INTO `sys_logininfor` VALUES (391, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-30 16:17:20');
INSERT INTO `sys_logininfor` VALUES (392, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误3次', '2023-10-30 16:17:20');
INSERT INTO `sys_logininfor` VALUES (393, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-30 16:17:20');
INSERT INTO `sys_logininfor` VALUES (394, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误4次', '2023-10-30 16:17:20');
INSERT INTO `sys_logininfor` VALUES (395, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次', '2023-10-30 16:17:21');
INSERT INTO `sys_logininfor` VALUES (396, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-10-30 16:17:21');
INSERT INTO `sys_logininfor` VALUES (397, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-10-30 16:17:21');
INSERT INTO `sys_logininfor` VALUES (398, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-10-30 16:17:21');
INSERT INTO `sys_logininfor` VALUES (399, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-10-30 16:17:29');
INSERT INTO `sys_logininfor` VALUES (400, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-10-30 16:17:29');
INSERT INTO `sys_logininfor` VALUES (401, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-10-30 16:17:30');
INSERT INTO `sys_logininfor` VALUES (402, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-10-30 16:17:30');
INSERT INTO `sys_logininfor` VALUES (403, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-10-30 16:17:31');
INSERT INTO `sys_logininfor` VALUES (404, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-10-30 16:17:31');
INSERT INTO `sys_logininfor` VALUES (405, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-10-30 16:17:31');
INSERT INTO `sys_logininfor` VALUES (406, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-10-30 16:17:31');
INSERT INTO `sys_logininfor` VALUES (407, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-10-30 16:17:31');
INSERT INTO `sys_logininfor` VALUES (408, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-10-30 16:17:31');
INSERT INTO `sys_logininfor` VALUES (409, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:17:38');
INSERT INTO `sys_logininfor` VALUES (410, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:17:40');
INSERT INTO `sys_logininfor` VALUES (411, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:17:56');
INSERT INTO `sys_logininfor` VALUES (412, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:22:11');
INSERT INTO `sys_logininfor` VALUES (413, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:22:16');
INSERT INTO `sys_logininfor` VALUES (414, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:22:23');
INSERT INTO `sys_logininfor` VALUES (415, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 16:23:31');
INSERT INTO `sys_logininfor` VALUES (416, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 17:01:27');
INSERT INTO `sys_logininfor` VALUES (417, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 17:06:46');
INSERT INTO `sys_logininfor` VALUES (418, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 17:06:49');
INSERT INTO `sys_logininfor` VALUES (419, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 17:11:08');
INSERT INTO `sys_logininfor` VALUES (420, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 17:15:26');
INSERT INTO `sys_logininfor` VALUES (421, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 17:15:42');
INSERT INTO `sys_logininfor` VALUES (422, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 17:16:11');
INSERT INTO `sys_logininfor` VALUES (423, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 17:16:35');
INSERT INTO `sys_logininfor` VALUES (424, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 17:16:54');
INSERT INTO `sys_logininfor` VALUES (425, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 17:16:57');
INSERT INTO `sys_logininfor` VALUES (426, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 17:16:59');
INSERT INTO `sys_logininfor` VALUES (427, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 17:28:52');
INSERT INTO `sys_logininfor` VALUES (428, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 17:35:31');
INSERT INTO `sys_logininfor` VALUES (429, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-30 17:40:09');
INSERT INTO `sys_logininfor` VALUES (430, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-31 08:39:39');
INSERT INTO `sys_logininfor` VALUES (431, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-31 08:39:43');
INSERT INTO `sys_logininfor` VALUES (432, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-10-31 08:39:47');
INSERT INTO `sys_logininfor` VALUES (433, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 17:17:03');
INSERT INTO `sys_logininfor` VALUES (434, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 17:35:50');
INSERT INTO `sys_logininfor` VALUES (435, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 17:36:24');
INSERT INTO `sys_logininfor` VALUES (436, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 17:37:34');
INSERT INTO `sys_logininfor` VALUES (437, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 22:53:17');
INSERT INTO `sys_logininfor` VALUES (438, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 22:53:18');
INSERT INTO `sys_logininfor` VALUES (439, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:04:52');
INSERT INTO `sys_logininfor` VALUES (440, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:04:54');
INSERT INTO `sys_logininfor` VALUES (441, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:04:56');
INSERT INTO `sys_logininfor` VALUES (442, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:04:59');
INSERT INTO `sys_logininfor` VALUES (443, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:09:02');
INSERT INTO `sys_logininfor` VALUES (444, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:16:00');
INSERT INTO `sys_logininfor` VALUES (445, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:37');
INSERT INTO `sys_logininfor` VALUES (446, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:39');
INSERT INTO `sys_logininfor` VALUES (447, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:40');
INSERT INTO `sys_logininfor` VALUES (448, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:40');
INSERT INTO `sys_logininfor` VALUES (449, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:40');
INSERT INTO `sys_logininfor` VALUES (450, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:42');
INSERT INTO `sys_logininfor` VALUES (451, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:42');
INSERT INTO `sys_logininfor` VALUES (452, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:42');
INSERT INTO `sys_logininfor` VALUES (453, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:43');
INSERT INTO `sys_logininfor` VALUES (454, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:43');
INSERT INTO `sys_logininfor` VALUES (455, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:48');
INSERT INTO `sys_logininfor` VALUES (456, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:49');
INSERT INTO `sys_logininfor` VALUES (457, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:49');
INSERT INTO `sys_logininfor` VALUES (458, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:49');
INSERT INTO `sys_logininfor` VALUES (459, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:49');
INSERT INTO `sys_logininfor` VALUES (460, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:50');
INSERT INTO `sys_logininfor` VALUES (461, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:51');
INSERT INTO `sys_logininfor` VALUES (462, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:51');
INSERT INTO `sys_logininfor` VALUES (463, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:51');
INSERT INTO `sys_logininfor` VALUES (464, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:52');
INSERT INTO `sys_logininfor` VALUES (465, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:54');
INSERT INTO `sys_logininfor` VALUES (466, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:55');
INSERT INTO `sys_logininfor` VALUES (467, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:55');
INSERT INTO `sys_logininfor` VALUES (468, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:55');
INSERT INTO `sys_logininfor` VALUES (469, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:56');
INSERT INTO `sys_logininfor` VALUES (470, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:40:56');
INSERT INTO `sys_logininfor` VALUES (471, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:41:26');
INSERT INTO `sys_logininfor` VALUES (472, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:41:27');
INSERT INTO `sys_logininfor` VALUES (473, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:41:27');
INSERT INTO `sys_logininfor` VALUES (474, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:41:27');
INSERT INTO `sys_logininfor` VALUES (475, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-01 23:46:58');
INSERT INTO `sys_logininfor` VALUES (476, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 09:05:07');
INSERT INTO `sys_logininfor` VALUES (477, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 09:05:28');
INSERT INTO `sys_logininfor` VALUES (478, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 09:05:29');
INSERT INTO `sys_logininfor` VALUES (479, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 09:07:17');
INSERT INTO `sys_logininfor` VALUES (480, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 09:08:10');
INSERT INTO `sys_logininfor` VALUES (481, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 09:16:14');
INSERT INTO `sys_logininfor` VALUES (482, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 09:23:30');
INSERT INTO `sys_logininfor` VALUES (483, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 09:26:45');
INSERT INTO `sys_logininfor` VALUES (484, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 09:38:08');
INSERT INTO `sys_logininfor` VALUES (485, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-02 11:19:15');
INSERT INTO `sys_logininfor` VALUES (486, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 14:05:53');
INSERT INTO `sys_logininfor` VALUES (487, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 14:42:56');
INSERT INTO `sys_logininfor` VALUES (488, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 15:07:17');
INSERT INTO `sys_logininfor` VALUES (489, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 15:09:56');
INSERT INTO `sys_logininfor` VALUES (490, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-03 15:40:27');
INSERT INTO `sys_logininfor` VALUES (491, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-06 08:56:49');
INSERT INTO `sys_logininfor` VALUES (492, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-06 09:59:37');
INSERT INTO `sys_logininfor` VALUES (493, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-06 11:06:48');
INSERT INTO `sys_logininfor` VALUES (494, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-06 14:46:01');
INSERT INTO `sys_logininfor` VALUES (495, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-06 15:13:09');
INSERT INTO `sys_logininfor` VALUES (496, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-06 15:20:45');
INSERT INTO `sys_logininfor` VALUES (497, NULL, '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '* 必须填写', '2023-11-06 15:30:51');
INSERT INTO `sys_logininfor` VALUES (498, NULL, '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '* 必须填写', '2023-11-06 15:30:53');
INSERT INTO `sys_logininfor` VALUES (499, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-06 15:31:01');
INSERT INTO `sys_logininfor` VALUES (500, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-11-06 15:31:01');
INSERT INTO `sys_logininfor` VALUES (501, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-06 15:31:09');
INSERT INTO `sys_logininfor` VALUES (502, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-11-06 15:31:09');
INSERT INTO `sys_logininfor` VALUES (503, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-06 15:31:14');
INSERT INTO `sys_logininfor` VALUES (504, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-06 15:31:56');
INSERT INTO `sys_logininfor` VALUES (505, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-06 17:07:25');
INSERT INTO `sys_logininfor` VALUES (506, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-07 08:49:45');
INSERT INTO `sys_logininfor` VALUES (507, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-07 08:57:36');
INSERT INTO `sys_logininfor` VALUES (508, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-07 09:41:36');
INSERT INTO `sys_logininfor` VALUES (509, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-07 09:42:30');
INSERT INTO `sys_logininfor` VALUES (510, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-07 09:50:18');
INSERT INTO `sys_logininfor` VALUES (511, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-07 09:52:45');
INSERT INTO `sys_logininfor` VALUES (512, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-07 14:39:26');
INSERT INTO `sys_logininfor` VALUES (513, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-07 21:38:59');
INSERT INTO `sys_logininfor` VALUES (514, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-07 21:46:46');
INSERT INTO `sys_logininfor` VALUES (515, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-07 21:49:43');
INSERT INTO `sys_logininfor` VALUES (516, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-07 21:53:27');
INSERT INTO `sys_logininfor` VALUES (517, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-07 22:00:06');
INSERT INTO `sys_logininfor` VALUES (518, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-07 22:01:00');
INSERT INTO `sys_logininfor` VALUES (519, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-08 08:42:43');
INSERT INTO `sys_logininfor` VALUES (520, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-08 08:58:18');
INSERT INTO `sys_logininfor` VALUES (521, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-08 09:55:53');
INSERT INTO `sys_logininfor` VALUES (522, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-08 11:04:43');
INSERT INTO `sys_logininfor` VALUES (523, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-08 14:38:49');
INSERT INTO `sys_logininfor` VALUES (524, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-09 10:53:29');
INSERT INTO `sys_logininfor` VALUES (525, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-09 10:53:55');
INSERT INTO `sys_logininfor` VALUES (526, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-09 10:54:07');
INSERT INTO `sys_logininfor` VALUES (527, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-09 10:54:15');
INSERT INTO `sys_logininfor` VALUES (528, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-09 10:55:07');
INSERT INTO `sys_logininfor` VALUES (529, NULL, '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '* 必须填写', '2023-11-09 11:16:32');
INSERT INTO `sys_logininfor` VALUES (530, NULL, '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '* 必须填写', '2023-11-09 11:16:33');
INSERT INTO `sys_logininfor` VALUES (531, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:20:39');
INSERT INTO `sys_logininfor` VALUES (532, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-11-09 11:20:39');
INSERT INTO `sys_logininfor` VALUES (533, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-09 11:20:53');
INSERT INTO `sys_logininfor` VALUES (534, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-09 11:21:22');
INSERT INTO `sys_logininfor` VALUES (535, 'admin11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：admin11 不存在', '2023-11-09 11:23:48');
INSERT INTO `sys_logininfor` VALUES (536, 'admin11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：admin11 不存在', '2023-11-09 11:23:49');
INSERT INTO `sys_logininfor` VALUES (537, 'admin11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：admin11 不存在', '2023-11-09 11:23:49');
INSERT INTO `sys_logininfor` VALUES (538, 'admin11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：admin11 不存在', '2023-11-09 11:23:50');
INSERT INTO `sys_logininfor` VALUES (539, 'admin11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：admin11 不存在', '2023-11-09 11:23:50');
INSERT INTO `sys_logininfor` VALUES (540, 'admin11', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：admin11 不存在', '2023-11-09 11:23:50');
INSERT INTO `sys_logininfor` VALUES (541, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:23:56');
INSERT INTO `sys_logininfor` VALUES (542, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-11-09 11:23:56');
INSERT INTO `sys_logininfor` VALUES (543, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:23:56');
INSERT INTO `sys_logininfor` VALUES (544, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-11-09 11:23:56');
INSERT INTO `sys_logininfor` VALUES (545, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:23:57');
INSERT INTO `sys_logininfor` VALUES (546, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误3次', '2023-11-09 11:23:57');
INSERT INTO `sys_logininfor` VALUES (547, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误4次', '2023-11-09 11:23:57');
INSERT INTO `sys_logininfor` VALUES (548, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:23:57');
INSERT INTO `sys_logininfor` VALUES (549, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次', '2023-11-09 11:23:57');
INSERT INTO `sys_logininfor` VALUES (550, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:23:57');
INSERT INTO `sys_logininfor` VALUES (551, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误6次', '2023-11-09 11:23:57');
INSERT INTO `sys_logininfor` VALUES (552, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:23:57');
INSERT INTO `sys_logininfor` VALUES (553, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:24:00');
INSERT INTO `sys_logininfor` VALUES (554, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误7次', '2023-11-09 11:24:00');
INSERT INTO `sys_logininfor` VALUES (555, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误8次', '2023-11-09 11:24:00');
INSERT INTO `sys_logininfor` VALUES (556, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:24:00');
INSERT INTO `sys_logininfor` VALUES (557, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:24:01');
INSERT INTO `sys_logininfor` VALUES (558, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误9次', '2023-11-09 11:24:01');
INSERT INTO `sys_logininfor` VALUES (559, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误10次', '2023-11-09 11:24:01');
INSERT INTO `sys_logininfor` VALUES (560, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:24:01');
INSERT INTO `sys_logininfor` VALUES (561, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误11次', '2023-11-09 11:24:01');
INSERT INTO `sys_logininfor` VALUES (562, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:24:01');
INSERT INTO `sys_logininfor` VALUES (563, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:24:04');
INSERT INTO `sys_logininfor` VALUES (564, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误12次', '2023-11-09 11:24:04');
INSERT INTO `sys_logininfor` VALUES (565, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:24:04');
INSERT INTO `sys_logininfor` VALUES (566, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误13次', '2023-11-09 11:24:04');
INSERT INTO `sys_logininfor` VALUES (567, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:24:04');
INSERT INTO `sys_logininfor` VALUES (568, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误14次', '2023-11-09 11:24:04');
INSERT INTO `sys_logininfor` VALUES (569, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误15次', '2023-11-09 11:24:04');
INSERT INTO `sys_logininfor` VALUES (570, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:24:04');
INSERT INTO `sys_logininfor` VALUES (571, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:32:08');
INSERT INTO `sys_logininfor` VALUES (572, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:32:08');
INSERT INTO `sys_logininfor` VALUES (573, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:32:08');
INSERT INTO `sys_logininfor` VALUES (574, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:32:08');
INSERT INTO `sys_logininfor` VALUES (575, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:32:08');
INSERT INTO `sys_logininfor` VALUES (576, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:32:09');
INSERT INTO `sys_logininfor` VALUES (577, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:32:10');
INSERT INTO `sys_logininfor` VALUES (578, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:32:15');
INSERT INTO `sys_logininfor` VALUES (579, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:32:16');
INSERT INTO `sys_logininfor` VALUES (580, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:32:16');
INSERT INTO `sys_logininfor` VALUES (581, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-09 11:32:17');
INSERT INTO `sys_logininfor` VALUES (582, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-09 11:34:19');
INSERT INTO `sys_logininfor` VALUES (583, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-13 08:58:37');
INSERT INTO `sys_logininfor` VALUES (584, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-13 09:01:11');
INSERT INTO `sys_logininfor` VALUES (585, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-13 09:09:04');
INSERT INTO `sys_logininfor` VALUES (586, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-13 14:03:05');
INSERT INTO `sys_logininfor` VALUES (587, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-13 14:04:08');
INSERT INTO `sys_logininfor` VALUES (588, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-13 14:04:08');
INSERT INTO `sys_logininfor` VALUES (589, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-13 14:04:09');
INSERT INTO `sys_logininfor` VALUES (590, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-13 14:04:09');
INSERT INTO `sys_logininfor` VALUES (591, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-13 14:04:09');
INSERT INTO `sys_logininfor` VALUES (592, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-13 14:04:09');
INSERT INTO `sys_logininfor` VALUES (593, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-13 14:04:10');
INSERT INTO `sys_logininfor` VALUES (594, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-13 14:04:10');
INSERT INTO `sys_logininfor` VALUES (595, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-13 14:04:10');
INSERT INTO `sys_logininfor` VALUES (596, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-13 14:04:10');
INSERT INTO `sys_logininfor` VALUES (597, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-13 14:04:11');
INSERT INTO `sys_logininfor` VALUES (598, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-16 09:52:15');
INSERT INTO `sys_logininfor` VALUES (599, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-16 09:52:16');
INSERT INTO `sys_logininfor` VALUES (600, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-16 09:52:20');
INSERT INTO `sys_logininfor` VALUES (601, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-16 09:52:22');
INSERT INTO `sys_logininfor` VALUES (602, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-16 09:52:23');
INSERT INTO `sys_logininfor` VALUES (603, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-16 09:52:27');
INSERT INTO `sys_logininfor` VALUES (604, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-16 10:51:40');
INSERT INTO `sys_logininfor` VALUES (605, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-16 13:58:51');
INSERT INTO `sys_logininfor` VALUES (606, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-16 15:56:37');
INSERT INTO `sys_logininfor` VALUES (607, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-16 16:43:37');
INSERT INTO `sys_logininfor` VALUES (608, 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：test 不存在', '2023-11-16 16:43:47');
INSERT INTO `sys_logininfor` VALUES (609, 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：test 不存在', '2023-11-16 16:43:47');
INSERT INTO `sys_logininfor` VALUES (610, 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：test 不存在', '2023-11-16 16:43:48');
INSERT INTO `sys_logininfor` VALUES (611, 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：test 不存在', '2023-11-16 16:43:48');
INSERT INTO `sys_logininfor` VALUES (612, 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：test 不存在', '2023-11-16 16:43:49');
INSERT INTO `sys_logininfor` VALUES (613, 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：test 不存在', '2023-11-16 16:43:50');
INSERT INTO `sys_logininfor` VALUES (614, 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：test 不存在', '2023-11-16 16:43:51');
INSERT INTO `sys_logininfor` VALUES (615, 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：test 不存在', '2023-11-16 16:43:51');
INSERT INTO `sys_logininfor` VALUES (616, 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：test 不存在', '2023-11-16 16:43:51');
INSERT INTO `sys_logininfor` VALUES (617, 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：test 不存在', '2023-11-16 16:43:52');
INSERT INTO `sys_logininfor` VALUES (618, 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：test 不存在', '2023-11-16 16:43:53');
INSERT INTO `sys_logininfor` VALUES (619, 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：test 不存在', '2023-11-16 16:43:53');
INSERT INTO `sys_logininfor` VALUES (620, 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：test 不存在', '2023-11-16 16:43:54');
INSERT INTO `sys_logininfor` VALUES (621, 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：test 不存在', '2023-11-16 16:43:54');
INSERT INTO `sys_logininfor` VALUES (622, 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：test 不存在', '2023-11-16 16:43:56');
INSERT INTO `sys_logininfor` VALUES (623, 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：test 不存在', '2023-11-16 16:43:56');
INSERT INTO `sys_logininfor` VALUES (624, 'test', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：test 不存在', '2023-11-16 16:43:56');
INSERT INTO `sys_logininfor` VALUES (625, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-16 16:44:01');
INSERT INTO `sys_logininfor` VALUES (626, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-16 16:44:02');
INSERT INTO `sys_logininfor` VALUES (627, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-16 16:44:02');
INSERT INTO `sys_logininfor` VALUES (628, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-16 16:44:03');
INSERT INTO `sys_logininfor` VALUES (629, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-16 16:44:04');
INSERT INTO `sys_logininfor` VALUES (630, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-16 16:44:04');
INSERT INTO `sys_logininfor` VALUES (631, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-16 16:44:04');
INSERT INTO `sys_logininfor` VALUES (632, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-16 16:44:06');
INSERT INTO `sys_logininfor` VALUES (633, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-16 16:44:06');
INSERT INTO `sys_logininfor` VALUES (634, 'root', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-16 16:44:07');
INSERT INTO `sys_logininfor` VALUES (635, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-16 16:44:12');
INSERT INTO `sys_logininfor` VALUES (636, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-16 16:44:12');
INSERT INTO `sys_logininfor` VALUES (637, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-16 16:44:12');
INSERT INTO `sys_logininfor` VALUES (638, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-16 16:44:12');
INSERT INTO `sys_logininfor` VALUES (639, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-11-16 16:44:12');
INSERT INTO `sys_logininfor` VALUES (640, 'admin1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：admin1 不存在', '2023-11-16 16:44:16');
INSERT INTO `sys_logininfor` VALUES (641, 'admin1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：admin1 不存在', '2023-11-16 16:44:16');
INSERT INTO `sys_logininfor` VALUES (642, 'admin1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：admin1 不存在', '2023-11-16 16:44:17');
INSERT INTO `sys_logininfor` VALUES (643, 'admin1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：admin1 不存在', '2023-11-16 16:44:18');
INSERT INTO `sys_logininfor` VALUES (644, 'admin1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：admin1 不存在', '2023-11-16 16:44:18');
INSERT INTO `sys_logininfor` VALUES (645, 'admin1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：admin1 不存在', '2023-11-16 16:44:18');
INSERT INTO `sys_logininfor` VALUES (646, 'admin1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：admin1 不存在', '2023-11-16 16:44:18');
INSERT INTO `sys_logininfor` VALUES (647, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-16 16:44:24');
INSERT INTO `sys_logininfor` VALUES (648, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-17 09:33:34');
INSERT INTO `sys_logininfor` VALUES (649, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-17 10:28:53');
INSERT INTO `sys_logininfor` VALUES (650, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-17 11:06:36');
INSERT INTO `sys_logininfor` VALUES (651, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-17 13:48:54');
INSERT INTO `sys_logininfor` VALUES (652, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-17 14:24:26');
INSERT INTO `sys_logininfor` VALUES (653, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-17 14:26:10');
INSERT INTO `sys_logininfor` VALUES (654, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-17 14:29:00');
INSERT INTO `sys_logininfor` VALUES (655, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-17 14:35:33');
INSERT INTO `sys_logininfor` VALUES (656, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-17 16:41:30');
INSERT INTO `sys_logininfor` VALUES (657, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-20 08:44:52');
INSERT INTO `sys_logininfor` VALUES (658, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-20 09:34:08');
INSERT INTO `sys_logininfor` VALUES (659, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-20 09:46:35');
INSERT INTO `sys_logininfor` VALUES (660, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-20 12:28:08');
INSERT INTO `sys_logininfor` VALUES (661, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-20 13:47:19');
INSERT INTO `sys_logininfor` VALUES (662, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-20 16:01:06');
INSERT INTO `sys_logininfor` VALUES (663, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-20 16:49:37');
INSERT INTO `sys_logininfor` VALUES (664, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-20 17:34:48');
INSERT INTO `sys_logininfor` VALUES (665, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-21 09:09:16');
INSERT INTO `sys_logininfor` VALUES (666, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-21 14:43:22');
INSERT INTO `sys_logininfor` VALUES (667, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-21 14:50:43');
INSERT INTO `sys_logininfor` VALUES (668, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-22 08:58:52');
INSERT INTO `sys_logininfor` VALUES (669, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-22 10:59:42');
INSERT INTO `sys_logininfor` VALUES (670, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-22 12:13:44');
INSERT INTO `sys_logininfor` VALUES (671, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-22 13:39:30');
INSERT INTO `sys_logininfor` VALUES (672, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-22 13:42:24');
INSERT INTO `sys_logininfor` VALUES (673, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-22 14:23:01');
INSERT INTO `sys_logininfor` VALUES (674, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-22 15:40:18');
INSERT INTO `sys_logininfor` VALUES (675, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-22 15:53:01');
INSERT INTO `sys_logininfor` VALUES (676, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-22 16:01:20');
INSERT INTO `sys_logininfor` VALUES (677, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-22 16:03:24');
INSERT INTO `sys_logininfor` VALUES (678, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-22 16:14:07');
INSERT INTO `sys_logininfor` VALUES (679, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-22 17:42:48');
INSERT INTO `sys_logininfor` VALUES (680, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-22 22:41:33');
INSERT INTO `sys_logininfor` VALUES (681, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-23 09:26:32');
INSERT INTO `sys_logininfor` VALUES (682, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-23 10:15:51');
INSERT INTO `sys_logininfor` VALUES (683, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-23 11:42:03');
INSERT INTO `sys_logininfor` VALUES (684, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-23 13:46:29');
INSERT INTO `sys_logininfor` VALUES (685, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:51:50');
INSERT INTO `sys_logininfor` VALUES (686, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:51:51');
INSERT INTO `sys_logininfor` VALUES (687, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:51:52');
INSERT INTO `sys_logininfor` VALUES (688, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:51:54');
INSERT INTO `sys_logininfor` VALUES (689, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:51:55');
INSERT INTO `sys_logininfor` VALUES (690, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:51:55');
INSERT INTO `sys_logininfor` VALUES (691, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:51:55');
INSERT INTO `sys_logininfor` VALUES (692, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:51:56');
INSERT INTO `sys_logininfor` VALUES (693, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:51:56');
INSERT INTO `sys_logininfor` VALUES (694, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:51:56');
INSERT INTO `sys_logininfor` VALUES (695, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:51:56');
INSERT INTO `sys_logininfor` VALUES (696, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:51:58');
INSERT INTO `sys_logininfor` VALUES (697, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:51:58');
INSERT INTO `sys_logininfor` VALUES (698, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:55:48');
INSERT INTO `sys_logininfor` VALUES (699, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:55:52');
INSERT INTO `sys_logininfor` VALUES (700, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:55:54');
INSERT INTO `sys_logininfor` VALUES (701, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:55:57');
INSERT INTO `sys_logininfor` VALUES (702, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:55:59');
INSERT INTO `sys_logininfor` VALUES (703, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:56:00');
INSERT INTO `sys_logininfor` VALUES (704, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:56:00');
INSERT INTO `sys_logininfor` VALUES (705, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:56:00');
INSERT INTO `sys_logininfor` VALUES (706, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:56:00');
INSERT INTO `sys_logininfor` VALUES (707, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:56:25');
INSERT INTO `sys_logininfor` VALUES (708, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:56:26');
INSERT INTO `sys_logininfor` VALUES (709, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:56:30');
INSERT INTO `sys_logininfor` VALUES (710, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:56:31');
INSERT INTO `sys_logininfor` VALUES (711, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 10:57:08');
INSERT INTO `sys_logininfor` VALUES (712, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 13:55:28');
INSERT INTO `sys_logininfor` VALUES (713, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 15:21:18');
INSERT INTO `sys_logininfor` VALUES (714, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 16:11:48');
INSERT INTO `sys_logininfor` VALUES (715, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-24 16:16:00');
INSERT INTO `sys_logininfor` VALUES (716, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-25 12:27:10');
INSERT INTO `sys_logininfor` VALUES (717, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-25 12:50:33');
INSERT INTO `sys_logininfor` VALUES (718, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-25 14:01:42');
INSERT INTO `sys_logininfor` VALUES (719, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-25 14:45:04');
INSERT INTO `sys_logininfor` VALUES (720, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-26 22:08:19');
INSERT INTO `sys_logininfor` VALUES (721, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-27 10:55:32');
INSERT INTO `sys_logininfor` VALUES (722, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-27 10:55:50');
INSERT INTO `sys_logininfor` VALUES (723, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-27 13:54:24');
INSERT INTO `sys_logininfor` VALUES (724, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-28 09:03:58');
INSERT INTO `sys_logininfor` VALUES (725, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-28 09:11:21');
INSERT INTO `sys_logininfor` VALUES (726, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-28 13:46:09');
INSERT INTO `sys_logininfor` VALUES (727, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-28 23:42:24');
INSERT INTO `sys_logininfor` VALUES (728, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-28 23:42:24');
INSERT INTO `sys_logininfor` VALUES (729, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-29 08:43:55');
INSERT INTO `sys_logininfor` VALUES (730, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-29 14:56:57');
INSERT INTO `sys_logininfor` VALUES (731, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-29 15:48:43');
INSERT INTO `sys_logininfor` VALUES (732, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-29 21:10:13');
INSERT INTO `sys_logininfor` VALUES (733, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 08:44:37');
INSERT INTO `sys_logininfor` VALUES (734, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 10:02:57');
INSERT INTO `sys_logininfor` VALUES (735, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 10:23:37');
INSERT INTO `sys_logininfor` VALUES (736, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 13:52:27');
INSERT INTO `sys_logininfor` VALUES (737, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 13:55:32');
INSERT INTO `sys_logininfor` VALUES (738, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 15:15:44');
INSERT INTO `sys_logininfor` VALUES (739, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 15:41:00');
INSERT INTO `sys_logininfor` VALUES (740, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 15:41:07');
INSERT INTO `sys_logininfor` VALUES (741, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 15:41:10');
INSERT INTO `sys_logininfor` VALUES (742, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 15:42:09');
INSERT INTO `sys_logininfor` VALUES (743, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 15:42:13');
INSERT INTO `sys_logininfor` VALUES (744, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 15:42:20');
INSERT INTO `sys_logininfor` VALUES (745, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 15:54:23');
INSERT INTO `sys_logininfor` VALUES (746, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 17:37:58');
INSERT INTO `sys_logininfor` VALUES (747, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 17:38:01');
INSERT INTO `sys_logininfor` VALUES (748, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 17:38:02');
INSERT INTO `sys_logininfor` VALUES (749, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 17:38:03');
INSERT INTO `sys_logininfor` VALUES (750, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 17:38:03');
INSERT INTO `sys_logininfor` VALUES (751, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 17:38:03');
INSERT INTO `sys_logininfor` VALUES (752, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 17:38:05');
INSERT INTO `sys_logininfor` VALUES (753, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 17:38:05');
INSERT INTO `sys_logininfor` VALUES (754, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 17:38:05');
INSERT INTO `sys_logininfor` VALUES (755, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 17:38:06');
INSERT INTO `sys_logininfor` VALUES (756, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 17:38:06');
INSERT INTO `sys_logininfor` VALUES (757, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 17:38:06');
INSERT INTO `sys_logininfor` VALUES (758, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 17:39:36');
INSERT INTO `sys_logininfor` VALUES (759, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 22:47:57');
INSERT INTO `sys_logininfor` VALUES (760, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 22:47:57');
INSERT INTO `sys_logininfor` VALUES (761, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 22:47:57');
INSERT INTO `sys_logininfor` VALUES (762, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 22:47:58');
INSERT INTO `sys_logininfor` VALUES (763, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 22:47:58');
INSERT INTO `sys_logininfor` VALUES (764, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 22:48:03');
INSERT INTO `sys_logininfor` VALUES (765, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 22:48:03');
INSERT INTO `sys_logininfor` VALUES (766, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 22:48:04');
INSERT INTO `sys_logininfor` VALUES (767, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 22:48:04');
INSERT INTO `sys_logininfor` VALUES (768, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 22:48:04');
INSERT INTO `sys_logininfor` VALUES (769, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 22:48:04');
INSERT INTO `sys_logininfor` VALUES (770, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 22:48:04');
INSERT INTO `sys_logininfor` VALUES (771, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 22:48:04');
INSERT INTO `sys_logininfor` VALUES (772, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 22:55:08');
INSERT INTO `sys_logininfor` VALUES (773, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 22:55:09');
INSERT INTO `sys_logininfor` VALUES (774, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-11-30 22:55:57');
INSERT INTO `sys_logininfor` VALUES (775, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-01 00:00:37');
INSERT INTO `sys_logininfor` VALUES (776, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-01 08:44:59');
INSERT INTO `sys_logininfor` VALUES (777, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-01 08:49:42');
INSERT INTO `sys_logininfor` VALUES (778, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-01 13:53:13');
INSERT INTO `sys_logininfor` VALUES (779, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-01 14:20:24');
INSERT INTO `sys_logininfor` VALUES (780, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-04 09:05:37');
INSERT INTO `sys_logininfor` VALUES (781, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-05 11:07:19');
INSERT INTO `sys_logininfor` VALUES (782, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-05 11:07:19');
INSERT INTO `sys_logininfor` VALUES (783, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-05 11:07:20');
INSERT INTO `sys_logininfor` VALUES (784, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-05 13:41:46');
INSERT INTO `sys_logininfor` VALUES (785, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-05 14:48:59');
INSERT INTO `sys_logininfor` VALUES (786, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-05 22:55:32');
INSERT INTO `sys_logininfor` VALUES (787, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-07 08:49:23');
INSERT INTO `sys_logininfor` VALUES (788, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-07 09:18:07');
INSERT INTO `sys_logininfor` VALUES (789, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-07 14:28:29');
INSERT INTO `sys_logininfor` VALUES (790, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-07 14:28:42');
INSERT INTO `sys_logininfor` VALUES (791, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-07 14:31:45');
INSERT INTO `sys_logininfor` VALUES (792, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-07 14:33:00');
INSERT INTO `sys_logininfor` VALUES (793, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-07 14:33:05');
INSERT INTO `sys_logininfor` VALUES (794, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-07 14:33:08');
INSERT INTO `sys_logininfor` VALUES (795, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-07 14:36:44');
INSERT INTO `sys_logininfor` VALUES (796, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-12-07 14:36:48');
INSERT INTO `sys_logininfor` VALUES (797, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-11 09:03:54');
INSERT INTO `sys_logininfor` VALUES (798, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-11 15:31:54');
INSERT INTO `sys_logininfor` VALUES (799, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-11 15:33:00');
INSERT INTO `sys_logininfor` VALUES (800, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-11 15:33:47');
INSERT INTO `sys_logininfor` VALUES (801, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-12 09:11:13');
INSERT INTO `sys_logininfor` VALUES (802, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-12 09:11:14');
INSERT INTO `sys_logininfor` VALUES (803, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-12 09:21:24');
INSERT INTO `sys_logininfor` VALUES (804, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-12 09:50:06');
INSERT INTO `sys_logininfor` VALUES (805, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-12 10:56:46');
INSERT INTO `sys_logininfor` VALUES (806, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-12 13:41:48');
INSERT INTO `sys_logininfor` VALUES (807, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-12 16:34:03');
INSERT INTO `sys_logininfor` VALUES (808, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-12 17:46:43');
INSERT INTO `sys_logininfor` VALUES (809, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-12 20:00:42');
INSERT INTO `sys_logininfor` VALUES (810, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-12 22:31:45');
INSERT INTO `sys_logininfor` VALUES (811, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-13 08:51:28');
INSERT INTO `sys_logininfor` VALUES (812, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-13 12:29:06');
INSERT INTO `sys_logininfor` VALUES (813, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-13 14:06:47');
INSERT INTO `sys_logininfor` VALUES (814, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 09:12:43');
INSERT INTO `sys_logininfor` VALUES (815, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 14:46:52');
INSERT INTO `sys_logininfor` VALUES (816, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 15:17:04');
INSERT INTO `sys_logininfor` VALUES (817, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 15:18:30');
INSERT INTO `sys_logininfor` VALUES (818, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 15:25:15');
INSERT INTO `sys_logininfor` VALUES (819, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 15:25:20');
INSERT INTO `sys_logininfor` VALUES (820, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 15:28:41');
INSERT INTO `sys_logininfor` VALUES (821, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 15:29:20');
INSERT INTO `sys_logininfor` VALUES (822, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 15:31:15');
INSERT INTO `sys_logininfor` VALUES (823, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 15:31:49');
INSERT INTO `sys_logininfor` VALUES (824, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 16:00:56');
INSERT INTO `sys_logininfor` VALUES (825, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 16:01:02');
INSERT INTO `sys_logininfor` VALUES (826, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 16:01:33');
INSERT INTO `sys_logininfor` VALUES (827, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 16:21:16');
INSERT INTO `sys_logininfor` VALUES (828, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 16:21:20');
INSERT INTO `sys_logininfor` VALUES (829, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 16:38:16');
INSERT INTO `sys_logininfor` VALUES (830, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 16:57:46');
INSERT INTO `sys_logininfor` VALUES (831, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 17:16:26');
INSERT INTO `sys_logininfor` VALUES (832, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 17:21:01');
INSERT INTO `sys_logininfor` VALUES (833, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 17:31:30');
INSERT INTO `sys_logininfor` VALUES (834, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-14 17:31:38');
INSERT INTO `sys_logininfor` VALUES (835, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-15 09:15:53');
INSERT INTO `sys_logininfor` VALUES (836, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-15 10:39:11');
INSERT INTO `sys_logininfor` VALUES (837, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-15 11:05:57');
INSERT INTO `sys_logininfor` VALUES (838, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-15 12:57:44');
INSERT INTO `sys_logininfor` VALUES (839, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-15 13:46:09');
INSERT INTO `sys_logininfor` VALUES (840, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-15 15:09:11');
INSERT INTO `sys_logininfor` VALUES (841, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-15 17:13:47');
INSERT INTO `sys_logininfor` VALUES (842, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-18 10:03:18');
INSERT INTO `sys_logininfor` VALUES (843, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-18 10:03:29');
INSERT INTO `sys_logininfor` VALUES (844, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-18 10:25:30');
INSERT INTO `sys_logininfor` VALUES (845, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-18 11:17:37');
INSERT INTO `sys_logininfor` VALUES (846, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-18 16:24:11');
INSERT INTO `sys_logininfor` VALUES (847, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-18 22:05:22');
INSERT INTO `sys_logininfor` VALUES (848, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 09:00:21');
INSERT INTO `sys_logininfor` VALUES (849, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 09:01:44');
INSERT INTO `sys_logininfor` VALUES (850, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 09:02:41');
INSERT INTO `sys_logininfor` VALUES (851, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 10:09:28');
INSERT INTO `sys_logininfor` VALUES (852, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 10:10:46');
INSERT INTO `sys_logininfor` VALUES (853, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 10:26:35');
INSERT INTO `sys_logininfor` VALUES (854, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 10:26:42');
INSERT INTO `sys_logininfor` VALUES (855, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 10:26:44');
INSERT INTO `sys_logininfor` VALUES (856, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 10:26:57');
INSERT INTO `sys_logininfor` VALUES (857, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 10:26:59');
INSERT INTO `sys_logininfor` VALUES (858, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 10:27:21');
INSERT INTO `sys_logininfor` VALUES (859, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 10:27:22');
INSERT INTO `sys_logininfor` VALUES (860, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 10:27:26');
INSERT INTO `sys_logininfor` VALUES (861, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 10:27:28');
INSERT INTO `sys_logininfor` VALUES (862, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 10:41:29');
INSERT INTO `sys_logininfor` VALUES (863, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 10:41:32');
INSERT INTO `sys_logininfor` VALUES (864, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 11:12:10');
INSERT INTO `sys_logininfor` VALUES (865, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 11:12:12');
INSERT INTO `sys_logininfor` VALUES (866, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 11:12:40');
INSERT INTO `sys_logininfor` VALUES (867, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 11:12:50');
INSERT INTO `sys_logininfor` VALUES (868, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 11:13:11');
INSERT INTO `sys_logininfor` VALUES (869, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 11:13:14');
INSERT INTO `sys_logininfor` VALUES (870, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 11:13:36');
INSERT INTO `sys_logininfor` VALUES (871, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 11:13:41');
INSERT INTO `sys_logininfor` VALUES (872, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 11:13:46');
INSERT INTO `sys_logininfor` VALUES (873, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 11:13:50');
INSERT INTO `sys_logininfor` VALUES (874, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 11:13:55');
INSERT INTO `sys_logininfor` VALUES (875, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 11:13:58');
INSERT INTO `sys_logininfor` VALUES (876, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 11:14:01');
INSERT INTO `sys_logininfor` VALUES (877, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 11:14:28');
INSERT INTO `sys_logininfor` VALUES (878, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 11:14:30');
INSERT INTO `sys_logininfor` VALUES (879, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 14:46:42');
INSERT INTO `sys_logininfor` VALUES (880, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 15:29:16');
INSERT INTO `sys_logininfor` VALUES (881, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 15:30:40');
INSERT INTO `sys_logininfor` VALUES (882, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 15:30:44');
INSERT INTO `sys_logininfor` VALUES (883, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 15:30:47');
INSERT INTO `sys_logininfor` VALUES (884, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 15:30:49');
INSERT INTO `sys_logininfor` VALUES (885, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 15:30:54');
INSERT INTO `sys_logininfor` VALUES (886, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 15:30:56');
INSERT INTO `sys_logininfor` VALUES (887, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 15:31:12');
INSERT INTO `sys_logininfor` VALUES (888, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 17:07:04');
INSERT INTO `sys_logininfor` VALUES (889, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 17:07:10');
INSERT INTO `sys_logininfor` VALUES (890, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 17:07:12');
INSERT INTO `sys_logininfor` VALUES (891, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 17:07:15');
INSERT INTO `sys_logininfor` VALUES (892, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 17:07:41');
INSERT INTO `sys_logininfor` VALUES (893, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 17:07:43');
INSERT INTO `sys_logininfor` VALUES (894, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 17:07:46');
INSERT INTO `sys_logininfor` VALUES (895, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 17:07:48');
INSERT INTO `sys_logininfor` VALUES (896, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 17:07:51');
INSERT INTO `sys_logininfor` VALUES (897, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 17:07:52');
INSERT INTO `sys_logininfor` VALUES (898, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-19 17:08:14');
INSERT INTO `sys_logininfor` VALUES (899, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-19 17:08:18');
INSERT INTO `sys_logininfor` VALUES (900, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 08:53:53');
INSERT INTO `sys_logininfor` VALUES (901, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-20 08:54:02');
INSERT INTO `sys_logininfor` VALUES (902, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 08:54:05');
INSERT INTO `sys_logininfor` VALUES (903, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-20 08:54:07');
INSERT INTO `sys_logininfor` VALUES (904, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 08:54:09');
INSERT INTO `sys_logininfor` VALUES (905, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-20 08:54:11');
INSERT INTO `sys_logininfor` VALUES (906, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 08:54:16');
INSERT INTO `sys_logininfor` VALUES (907, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-20 08:54:18');
INSERT INTO `sys_logininfor` VALUES (908, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 08:54:21');
INSERT INTO `sys_logininfor` VALUES (909, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 09:09:09');
INSERT INTO `sys_logininfor` VALUES (910, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 10:39:11');
INSERT INTO `sys_logininfor` VALUES (911, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 11:07:47');
INSERT INTO `sys_logininfor` VALUES (912, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 13:55:31');
INSERT INTO `sys_logininfor` VALUES (913, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 14:38:51');
INSERT INTO `sys_logininfor` VALUES (914, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 14:55:03');
INSERT INTO `sys_logininfor` VALUES (915, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 16:09:50');
INSERT INTO `sys_logininfor` VALUES (916, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 16:10:51');
INSERT INTO `sys_logininfor` VALUES (917, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 16:22:22');
INSERT INTO `sys_logininfor` VALUES (918, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 16:28:32');
INSERT INTO `sys_logininfor` VALUES (919, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-20 16:29:20');
INSERT INTO `sys_logininfor` VALUES (920, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 16:32:26');
INSERT INTO `sys_logininfor` VALUES (921, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-20 16:32:31');
INSERT INTO `sys_logininfor` VALUES (922, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 16:32:39');
INSERT INTO `sys_logininfor` VALUES (923, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-20 17:23:43');
INSERT INTO `sys_logininfor` VALUES (924, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 17:23:46');
INSERT INTO `sys_logininfor` VALUES (925, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-20 17:23:54');
INSERT INTO `sys_logininfor` VALUES (926, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 17:24:01');
INSERT INTO `sys_logininfor` VALUES (927, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-20 17:24:35');
INSERT INTO `sys_logininfor` VALUES (928, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-22 10:06:36');
INSERT INTO `sys_logininfor` VALUES (929, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-22 10:11:16');
INSERT INTO `sys_logininfor` VALUES (930, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-22 10:11:18');
INSERT INTO `sys_logininfor` VALUES (931, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-22 10:59:07');
INSERT INTO `sys_logininfor` VALUES (932, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-22 14:19:03');
INSERT INTO `sys_logininfor` VALUES (933, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-22 14:19:12');
INSERT INTO `sys_logininfor` VALUES (934, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-22 14:19:21');
INSERT INTO `sys_logininfor` VALUES (935, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2023-12-22 14:19:28');
INSERT INTO `sys_logininfor` VALUES (936, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2023-12-22 14:19:30');
INSERT INTO `sys_logininfor` VALUES (937, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2023-12-22 14:19:30');
INSERT INTO `sys_logininfor` VALUES (938, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2023-12-22 14:19:31');
INSERT INTO `sys_logininfor` VALUES (939, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2023-12-22 14:19:31');
INSERT INTO `sys_logininfor` VALUES (940, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2023-12-22 14:19:32');
INSERT INTO `sys_logininfor` VALUES (941, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2023-12-22 14:19:32');
INSERT INTO `sys_logininfor` VALUES (942, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2023-12-22 14:19:33');
INSERT INTO `sys_logininfor` VALUES (943, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2023-12-22 14:19:33');
INSERT INTO `sys_logininfor` VALUES (944, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-22 14:19:40');
INSERT INTO `sys_logininfor` VALUES (945, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-22 14:20:06');
INSERT INTO `sys_logininfor` VALUES (946, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-22 14:20:08');
INSERT INTO `sys_logininfor` VALUES (947, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-22 14:21:27');
INSERT INTO `sys_logininfor` VALUES (948, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2023-12-22 14:21:33');
INSERT INTO `sys_logininfor` VALUES (949, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2023-12-22 14:21:35');
INSERT INTO `sys_logininfor` VALUES (950, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2023-12-22 14:21:35');
INSERT INTO `sys_logininfor` VALUES (951, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2023-12-22 14:21:36');
INSERT INTO `sys_logininfor` VALUES (952, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2023-12-22 14:21:37');
INSERT INTO `sys_logininfor` VALUES (953, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2023-12-22 14:21:37');
INSERT INTO `sys_logininfor` VALUES (954, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-22 14:21:41');
INSERT INTO `sys_logininfor` VALUES (955, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-22 14:22:17');
INSERT INTO `sys_logininfor` VALUES (956, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-22 14:22:19');
INSERT INTO `sys_logininfor` VALUES (957, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-22 14:45:00');
INSERT INTO `sys_logininfor` VALUES (958, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-22 14:45:09');
INSERT INTO `sys_logininfor` VALUES (959, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-22 14:48:42');
INSERT INTO `sys_logininfor` VALUES (960, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-22 14:48:47');
INSERT INTO `sys_logininfor` VALUES (961, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-22 14:48:58');
INSERT INTO `sys_logininfor` VALUES (962, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-22 14:49:02');
INSERT INTO `sys_logininfor` VALUES (963, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-22 15:01:56');
INSERT INTO `sys_logininfor` VALUES (964, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-22 15:01:58');
INSERT INTO `sys_logininfor` VALUES (965, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-22 15:04:28');
INSERT INTO `sys_logininfor` VALUES (966, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-22 16:44:21');
INSERT INTO `sys_logininfor` VALUES (967, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-25 15:52:02');
INSERT INTO `sys_logininfor` VALUES (968, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-25 15:53:58');
INSERT INTO `sys_logininfor` VALUES (969, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 09:51:27');
INSERT INTO `sys_logininfor` VALUES (970, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 09:53:20');
INSERT INTO `sys_logininfor` VALUES (971, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 10:04:18');
INSERT INTO `sys_logininfor` VALUES (972, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 10:06:42');
INSERT INTO `sys_logininfor` VALUES (973, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 10:08:29');
INSERT INTO `sys_logininfor` VALUES (974, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 10:29:24');
INSERT INTO `sys_logininfor` VALUES (975, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 10:30:05');
INSERT INTO `sys_logininfor` VALUES (976, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 11:14:08');
INSERT INTO `sys_logininfor` VALUES (977, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-26 11:28:13');
INSERT INTO `sys_logininfor` VALUES (978, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 11:28:27');
INSERT INTO `sys_logininfor` VALUES (979, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-26 11:29:28');
INSERT INTO `sys_logininfor` VALUES (980, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 11:29:31');
INSERT INTO `sys_logininfor` VALUES (981, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-26 11:29:45');
INSERT INTO `sys_logininfor` VALUES (982, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 11:29:56');
INSERT INTO `sys_logininfor` VALUES (983, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 13:50:09');
INSERT INTO `sys_logininfor` VALUES (984, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 14:49:34');
INSERT INTO `sys_logininfor` VALUES (985, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2023-12-26 14:50:40');
INSERT INTO `sys_logininfor` VALUES (986, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 14:50:44');
INSERT INTO `sys_logininfor` VALUES (987, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-26 15:25:15');
INSERT INTO `sys_logininfor` VALUES (988, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 11:50:44');
INSERT INTO `sys_logininfor` VALUES (989, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:31:30');
INSERT INTO `sys_logininfor` VALUES (990, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:31:31');
INSERT INTO `sys_logininfor` VALUES (991, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:31:33');
INSERT INTO `sys_logininfor` VALUES (992, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:31:35');
INSERT INTO `sys_logininfor` VALUES (993, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:31:35');
INSERT INTO `sys_logininfor` VALUES (994, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:31:35');
INSERT INTO `sys_logininfor` VALUES (995, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:31:36');
INSERT INTO `sys_logininfor` VALUES (996, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:31:38');
INSERT INTO `sys_logininfor` VALUES (997, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:31:39');
INSERT INTO `sys_logininfor` VALUES (998, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:31:39');
INSERT INTO `sys_logininfor` VALUES (999, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:31:57');
INSERT INTO `sys_logininfor` VALUES (1000, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:31:57');
INSERT INTO `sys_logininfor` VALUES (1001, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:31:57');
INSERT INTO `sys_logininfor` VALUES (1002, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:31:58');
INSERT INTO `sys_logininfor` VALUES (1003, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:31:58');
INSERT INTO `sys_logininfor` VALUES (1004, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:31:58');
INSERT INTO `sys_logininfor` VALUES (1005, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:32:19');
INSERT INTO `sys_logininfor` VALUES (1006, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:32:19');
INSERT INTO `sys_logininfor` VALUES (1007, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:32:20');
INSERT INTO `sys_logininfor` VALUES (1008, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:32:20');
INSERT INTO `sys_logininfor` VALUES (1009, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:32:20');
INSERT INTO `sys_logininfor` VALUES (1010, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:32:21');
INSERT INTO `sys_logininfor` VALUES (1011, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:32:21');
INSERT INTO `sys_logininfor` VALUES (1012, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2023-12-28 12:32:21');
INSERT INTO `sys_logininfor` VALUES (1013, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 12:32:30');
INSERT INTO `sys_logininfor` VALUES (1014, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 14:40:09');
INSERT INTO `sys_logininfor` VALUES (1015, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 14:52:05');
INSERT INTO `sys_logininfor` VALUES (1016, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 14:56:41');
INSERT INTO `sys_logininfor` VALUES (1017, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 14:57:07');
INSERT INTO `sys_logininfor` VALUES (1018, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 14:57:31');
INSERT INTO `sys_logininfor` VALUES (1019, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 15:16:52');
INSERT INTO `sys_logininfor` VALUES (1020, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 15:47:55');
INSERT INTO `sys_logininfor` VALUES (1021, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 15:55:18');
INSERT INTO `sys_logininfor` VALUES (1022, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 15:58:52');
INSERT INTO `sys_logininfor` VALUES (1023, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 15:58:53');
INSERT INTO `sys_logininfor` VALUES (1024, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 16:20:34');
INSERT INTO `sys_logininfor` VALUES (1025, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 16:23:30');
INSERT INTO `sys_logininfor` VALUES (1026, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 16:24:55');
INSERT INTO `sys_logininfor` VALUES (1027, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2023-12-28 16:41:47');
INSERT INTO `sys_logininfor` VALUES (1028, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-03 17:32:07');
INSERT INTO `sys_logininfor` VALUES (1029, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-03 17:32:08');
INSERT INTO `sys_logininfor` VALUES (1030, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-03 17:32:09');
INSERT INTO `sys_logininfor` VALUES (1031, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-03 17:32:15');
INSERT INTO `sys_logininfor` VALUES (1032, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-07 20:55:55');
INSERT INTO `sys_logininfor` VALUES (1033, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-08 08:55:35');
INSERT INTO `sys_logininfor` VALUES (1034, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-08 08:55:39');
INSERT INTO `sys_logininfor` VALUES (1035, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-08 08:55:40');
INSERT INTO `sys_logininfor` VALUES (1036, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 08:55:43');
INSERT INTO `sys_logininfor` VALUES (1037, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 09:39:29');
INSERT INTO `sys_logininfor` VALUES (1038, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 09:53:20');
INSERT INTO `sys_logininfor` VALUES (1039, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 10:24:22');
INSERT INTO `sys_logininfor` VALUES (1040, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 11:27:07');
INSERT INTO `sys_logininfor` VALUES (1041, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 15:11:15');
INSERT INTO `sys_logininfor` VALUES (1042, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 15:38:20');
INSERT INTO `sys_logininfor` VALUES (1043, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-08 16:10:16');
INSERT INTO `sys_logininfor` VALUES (1044, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 16:10:25');
INSERT INTO `sys_logininfor` VALUES (1045, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 16:11:30');
INSERT INTO `sys_logininfor` VALUES (1046, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-08 16:55:27');
INSERT INTO `sys_logininfor` VALUES (1047, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 16:55:33');
INSERT INTO `sys_logininfor` VALUES (1048, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-08 16:56:47');
INSERT INTO `sys_logininfor` VALUES (1049, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2024-01-08 16:56:58');
INSERT INTO `sys_logininfor` VALUES (1050, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2024-01-08 16:56:59');
INSERT INTO `sys_logininfor` VALUES (1051, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2024-01-08 16:57:03');
INSERT INTO `sys_logininfor` VALUES (1052, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2024-01-08 16:57:03');
INSERT INTO `sys_logininfor` VALUES (1053, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2024-01-08 16:57:04');
INSERT INTO `sys_logininfor` VALUES (1054, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2024-01-08 16:57:04');
INSERT INTO `sys_logininfor` VALUES (1055, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2024-01-08 16:57:04');
INSERT INTO `sys_logininfor` VALUES (1056, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2024-01-08 16:57:04');
INSERT INTO `sys_logininfor` VALUES (1057, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2024-01-08 16:57:05');
INSERT INTO `sys_logininfor` VALUES (1058, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2024-01-08 16:57:05');
INSERT INTO `sys_logininfor` VALUES (1059, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy 不存在', '2024-01-08 16:57:05');
INSERT INTO `sys_logininfor` VALUES (1060, 'czy11', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy11 不存在', '2024-01-08 16:57:32');
INSERT INTO `sys_logininfor` VALUES (1061, 'czy11', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy11 不存在', '2024-01-08 16:57:33');
INSERT INTO `sys_logininfor` VALUES (1062, 'czy11', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy11 不存在', '2024-01-08 16:57:33');
INSERT INTO `sys_logininfor` VALUES (1063, 'czy11', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：czy11 不存在', '2024-01-08 16:57:33');
INSERT INTO `sys_logininfor` VALUES (1064, 'gcs1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：gcs1 不存在', '2024-01-08 16:57:38');
INSERT INTO `sys_logininfor` VALUES (1065, 'gcs1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：gcs1 不存在', '2024-01-08 16:57:39');
INSERT INTO `sys_logininfor` VALUES (1066, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-08 16:57:42');
INSERT INTO `sys_logininfor` VALUES (1067, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-08 16:58:35');
INSERT INTO `sys_logininfor` VALUES (1068, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-08 16:58:36');
INSERT INTO `sys_logininfor` VALUES (1069, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-08 16:58:36');
INSERT INTO `sys_logininfor` VALUES (1070, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-08 16:58:39');
INSERT INTO `sys_logininfor` VALUES (1071, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-08 16:58:40');
INSERT INTO `sys_logininfor` VALUES (1072, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-08 16:58:40');
INSERT INTO `sys_logininfor` VALUES (1073, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-08 16:58:40');
INSERT INTO `sys_logininfor` VALUES (1074, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-08 16:58:41');
INSERT INTO `sys_logininfor` VALUES (1075, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-08 16:58:41');
INSERT INTO `sys_logininfor` VALUES (1076, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-08 16:58:41');
INSERT INTO `sys_logininfor` VALUES (1077, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-08 16:58:41');
INSERT INTO `sys_logininfor` VALUES (1078, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-08 17:01:24');
INSERT INTO `sys_logininfor` VALUES (1079, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-08 17:01:25');
INSERT INTO `sys_logininfor` VALUES (1080, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-08 17:01:26');
INSERT INTO `sys_logininfor` VALUES (1081, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-08 17:01:26');
INSERT INTO `sys_logininfor` VALUES (1082, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-08 17:01:26');
INSERT INTO `sys_logininfor` VALUES (1083, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 17:01:30');
INSERT INTO `sys_logininfor` VALUES (1084, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-08 17:01:34');
INSERT INTO `sys_logininfor` VALUES (1085, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 17:01:47');
INSERT INTO `sys_logininfor` VALUES (1086, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-08 17:01:49');
INSERT INTO `sys_logininfor` VALUES (1087, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 17:02:22');
INSERT INTO `sys_logininfor` VALUES (1088, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-08 17:02:24');
INSERT INTO `sys_logininfor` VALUES (1089, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 17:02:33');
INSERT INTO `sys_logininfor` VALUES (1090, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-08 17:02:35');
INSERT INTO `sys_logininfor` VALUES (1091, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 17:02:40');
INSERT INTO `sys_logininfor` VALUES (1092, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-08 17:02:53');
INSERT INTO `sys_logininfor` VALUES (1093, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 17:02:57');
INSERT INTO `sys_logininfor` VALUES (1094, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-08 17:03:15');
INSERT INTO `sys_logininfor` VALUES (1095, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 17:03:18');
INSERT INTO `sys_logininfor` VALUES (1096, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-08 17:13:24');
INSERT INTO `sys_logininfor` VALUES (1097, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-08 17:13:34');
INSERT INTO `sys_logininfor` VALUES (1098, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-09 09:37:00');
INSERT INTO `sys_logininfor` VALUES (1099, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-09 09:48:10');
INSERT INTO `sys_logininfor` VALUES (1100, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-09 09:48:49');
INSERT INTO `sys_logininfor` VALUES (1101, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-09 09:48:52');
INSERT INTO `sys_logininfor` VALUES (1102, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-09 09:48:53');
INSERT INTO `sys_logininfor` VALUES (1103, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-09 09:48:54');
INSERT INTO `sys_logininfor` VALUES (1104, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-09 09:48:58');
INSERT INTO `sys_logininfor` VALUES (1105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-09 10:04:48');
INSERT INTO `sys_logininfor` VALUES (1106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-09 13:54:47');
INSERT INTO `sys_logininfor` VALUES (1107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-09 13:57:28');
INSERT INTO `sys_logininfor` VALUES (1108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-11 10:06:36');
INSERT INTO `sys_logininfor` VALUES (1109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-12 10:26:07');
INSERT INTO `sys_logininfor` VALUES (1110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-12 10:43:53');
INSERT INTO `sys_logininfor` VALUES (1111, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-12 10:44:00');
INSERT INTO `sys_logininfor` VALUES (1112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-12 14:10:03');
INSERT INTO `sys_logininfor` VALUES (1113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-12 14:58:10');
INSERT INTO `sys_logininfor` VALUES (1114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-12 14:58:12');
INSERT INTO `sys_logininfor` VALUES (1115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-12 15:29:56');
INSERT INTO `sys_logininfor` VALUES (1116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-15 09:24:38');
INSERT INTO `sys_logininfor` VALUES (1117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-15 09:25:04');
INSERT INTO `sys_logininfor` VALUES (1118, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-15 09:25:07');
INSERT INTO `sys_logininfor` VALUES (1119, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-15 09:38:40');
INSERT INTO `sys_logininfor` VALUES (1120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-15 09:38:43');
INSERT INTO `sys_logininfor` VALUES (1121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-15 09:39:45');
INSERT INTO `sys_logininfor` VALUES (1122, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-15 09:39:48');
INSERT INTO `sys_logininfor` VALUES (1123, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-15 10:04:09');
INSERT INTO `sys_logininfor` VALUES (1124, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 10:04:14');
INSERT INTO `sys_logininfor` VALUES (1125, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 10:04:16');
INSERT INTO `sys_logininfor` VALUES (1126, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 10:04:16');
INSERT INTO `sys_logininfor` VALUES (1127, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-15 10:04:22');
INSERT INTO `sys_logininfor` VALUES (1128, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-15 10:05:00');
INSERT INTO `sys_logininfor` VALUES (1129, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-15 10:05:03');
INSERT INTO `sys_logininfor` VALUES (1130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-15 10:06:19');
INSERT INTO `sys_logininfor` VALUES (1131, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-15 10:06:22');
INSERT INTO `sys_logininfor` VALUES (1132, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-15 10:06:23');
INSERT INTO `sys_logininfor` VALUES (1133, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-15 10:06:23');
INSERT INTO `sys_logininfor` VALUES (1134, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-15 10:06:24');
INSERT INTO `sys_logininfor` VALUES (1135, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-15 10:06:24');
INSERT INTO `sys_logininfor` VALUES (1136, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-15 10:06:25');
INSERT INTO `sys_logininfor` VALUES (1137, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-15 10:06:30');
INSERT INTO `sys_logininfor` VALUES (1138, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-15 10:06:30');
INSERT INTO `sys_logininfor` VALUES (1139, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-15 10:06:41');
INSERT INTO `sys_logininfor` VALUES (1140, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-15 10:06:44');
INSERT INTO `sys_logininfor` VALUES (1141, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-15 10:06:49');
INSERT INTO `sys_logininfor` VALUES (1142, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-15 10:07:41');
INSERT INTO `sys_logininfor` VALUES (1143, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-15 10:08:07');
INSERT INTO `sys_logininfor` VALUES (1144, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-15 10:08:08');
INSERT INTO `sys_logininfor` VALUES (1145, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-15 10:08:09');
INSERT INTO `sys_logininfor` VALUES (1146, 'root', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：root 不存在', '2024-01-15 10:08:09');
INSERT INTO `sys_logininfor` VALUES (1147, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 10:08:12');
INSERT INTO `sys_logininfor` VALUES (1148, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 10:08:12');
INSERT INTO `sys_logininfor` VALUES (1149, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 10:08:12');
INSERT INTO `sys_logininfor` VALUES (1150, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 10:10:09');
INSERT INTO `sys_logininfor` VALUES (1151, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 10:10:11');
INSERT INTO `sys_logininfor` VALUES (1152, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-15 10:35:06');
INSERT INTO `sys_logininfor` VALUES (1153, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-15 10:41:36');
INSERT INTO `sys_logininfor` VALUES (1154, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-15 10:41:52');
INSERT INTO `sys_logininfor` VALUES (1155, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-15 11:20:24');
INSERT INTO `sys_logininfor` VALUES (1156, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 11:20:39');
INSERT INTO `sys_logininfor` VALUES (1157, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 11:20:41');
INSERT INTO `sys_logininfor` VALUES (1158, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 11:21:41');
INSERT INTO `sys_logininfor` VALUES (1159, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 11:21:43');
INSERT INTO `sys_logininfor` VALUES (1160, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 11:21:44');
INSERT INTO `sys_logininfor` VALUES (1161, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 12:16:57');
INSERT INTO `sys_logininfor` VALUES (1162, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 12:17:00');
INSERT INTO `sys_logininfor` VALUES (1163, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 12:17:01');
INSERT INTO `sys_logininfor` VALUES (1164, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 12:17:24');
INSERT INTO `sys_logininfor` VALUES (1165, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 12:17:29');
INSERT INTO `sys_logininfor` VALUES (1166, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-15 12:18:31');
INSERT INTO `sys_logininfor` VALUES (1167, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-15 12:26:21');
INSERT INTO `sys_logininfor` VALUES (1168, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-15 12:26:29');
INSERT INTO `sys_logininfor` VALUES (1169, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-15 12:26:33');
INSERT INTO `sys_logininfor` VALUES (1170, 'czy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-15 12:26:36');
INSERT INTO `sys_logininfor` VALUES (1171, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 12:26:40');
INSERT INTO `sys_logininfor` VALUES (1172, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 12:26:41');
INSERT INTO `sys_logininfor` VALUES (1173, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 12:26:42');
INSERT INTO `sys_logininfor` VALUES (1174, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 12:26:42');
INSERT INTO `sys_logininfor` VALUES (1175, 'csy', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '登录用户：csy 不存在', '2024-01-15 12:26:42');
INSERT INTO `sys_logininfor` VALUES (1176, 'gcs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-15 12:26:45');
INSERT INTO `sys_logininfor` VALUES (1177, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-17 08:49:53');
INSERT INTO `sys_logininfor` VALUES (1178, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-17 09:52:54');
INSERT INTO `sys_logininfor` VALUES (1179, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-18 17:26:30');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2016 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 100, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-08-30 06:46:56', 'admin', '2023-12-20 09:22:24', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 200, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-08-30 06:46:56', 'admin', '2023-12-20 09:22:35', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 1000, 'tool', NULL, '', 1, 0, 'M', '0', '1', '', 'tool', 'admin', '2023-08-30 06:46:56', 'admin', '2023-12-20 09:22:10', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-08-30 06:46:56', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-08-30 06:46:56', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-08-30 06:46:56', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '1', '1', 'system:dept:list', 'tree', 'admin', '2023-08-30 06:46:56', 'admin', '2024-01-08 17:03:50', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '1', '1', 'system:post:list', 'post', 'admin', '2023-08-30 06:46:56', 'admin', '2024-01-08 17:03:58', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '1', '0', 'system:dict:list', 'dict', 'admin', '2023-08-30 06:46:56', 'admin', '2024-01-08 17:04:03', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '1', '1', 'system:config:list', 'edit', 'admin', '2023-08-30 06:46:56', 'admin', '2024-01-08 16:27:09', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '1', 'system:notice:list', 'message', 'admin', '2023-08-30 06:46:56', 'admin', '2023-12-19 14:56:04', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 0, 50, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-08-30 06:46:56', 'admin', '2023-12-20 11:13:03', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'system/monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-08-30 06:46:56', 'admin', '2023-12-20 15:11:54', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'system/monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-08-30 06:46:56', 'gcs', '2024-01-15 10:03:34', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '1', 'monitor:druid:list', 'druid', 'admin', '2023-08-30 06:46:56', 'admin', '2023-12-19 14:57:24', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '1', 'monitor:server:list', 'server', 'admin', '2023-08-30 06:46:56', 'admin', '2023-12-19 14:57:26', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '1', 'monitor:cache:list', 'redis', 'admin', '2023-08-30 06:46:56', 'admin', '2023-12-19 14:57:29', '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '1', 'monitor:cache:list', 'redis-list', 'admin', '2023-08-30 06:46:56', 'admin', '2023-12-19 14:57:32', '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-08-30 06:46:56', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-08-30 06:46:56', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-08-30 06:46:56', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 2, 'operlog', 'system/monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-08-30 06:46:56', 'gcs', '2024-01-15 10:00:02', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 1, 'logininfor', 'system/monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-08-30 06:46:56', 'gcs', '2024-01-15 09:59:56', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-08-30 06:46:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '设备告警', 0, 10, 'alarm', 'alarm/index', NULL, 1, 1, 'C', '0', '0', '', 'bug', 'admin', '2023-09-12 15:29:31', 'admin', '2023-12-20 09:43:55', '');
INSERT INTO `sys_menu` VALUES (2001, '参数设置', 0, 30, 'parameter', 'parameter/index', NULL, 1, 1, 'C', '0', '0', '', 'system', 'admin', '2023-09-12 16:58:20', 'admin', '2023-12-20 09:21:49', '');
INSERT INTO `sys_menu` VALUES (2002, '系统总览', 0, 0, 'heapInfo', 'heapInfo', NULL, 1, 1, 'C', '1', '0', '', 'chart', 'admin', '2023-09-12 16:59:39', 'admin', '2023-12-20 09:19:24', '');
INSERT INTO `sys_menu` VALUES (2006, '设备管理', 0, 35, 'equipment', 'equipment/index', NULL, 1, 1, 'C', '0', '0', '', 'tool', 'admin', '2023-09-12 17:40:10', 'admin', '2023-12-20 16:47:20', '');
INSERT INTO `sys_menu` VALUES (2007, '单体电池', 0, 5, 'cell', 'cell/index', NULL, 1, 0, 'C', '0', '0', '', 'tree-table', 'admin', '2023-09-16 11:39:30', 'admin', '2023-12-20 09:19:31', '');
INSERT INTO `sys_menu` VALUES (2008, '控制策略', 0, 15, 'controlStrategy', 'controlStrategy/index', NULL, 1, 1, 'C', '0', '0', '', 'system', 'admin', '2023-12-20 09:13:31', 'admin', '2023-12-20 09:19:54', '');
INSERT INTO `sys_menu` VALUES (2009, '历史曲线', 0, 20, 'historyCurve', 'historyCurve/index', NULL, 1, 1, 'C', '0', '0', '', 'chart', 'admin', '2023-12-20 09:14:19', 'admin', '2023-12-20 09:20:03', '');
INSERT INTO `sys_menu` VALUES (2010, '环境监测', 0, 25, 'environmental', 'environmental/index', NULL, 1, 1, 'C', '0', '0', NULL, 'monitor', 'admin', '2023-12-20 09:21:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '修改设备参数', 2006, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'heap:heap:update', '#', 'admin', '2023-12-20 16:48:20', 'admin', '2024-01-09 09:46:23', '');
INSERT INTO `sys_menu` VALUES (2014, '修改告警参数', 2001, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'parameter:parameter:update', '#', 'admin', '2023-12-20 16:55:23', 'admin', '2024-01-09 10:28:52', '');
INSERT INTO `sys_menu` VALUES (2015, '查询设备参数', 2006, 0, '', NULL, NULL, 1, 0, 'F', '0', '0', 'heap:heap:query', '#', 'admin', '2024-01-09 09:46:17', 'admin', '2024-01-09 09:46:54', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-08-30 06:46:57', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-08-30 06:46:57', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(0) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7051 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (6199, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-01 17:37:44', 12);
INSERT INTO `sys_oper_log` VALUES (6200, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-01 22:53:31', 10);
INSERT INTO `sys_oper_log` VALUES (6201, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-01 22:54:20', 0);
INSERT INTO `sys_oper_log` VALUES (6202, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-01 22:55:10', 0);
INSERT INTO `sys_oper_log` VALUES (6203, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-01 22:55:47', 0);
INSERT INTO `sys_oper_log` VALUES (6204, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-01 22:57:44', 0);
INSERT INTO `sys_oper_log` VALUES (6205, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-01 23:09:18', 0);
INSERT INTO `sys_oper_log` VALUES (6206, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-01 23:15:26', 0);
INSERT INTO `sys_oper_log` VALUES (6207, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-01 23:49:12', 0);
INSERT INTO `sys_oper_log` VALUES (6208, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-01 23:49:13', 0);
INSERT INTO `sys_oper_log` VALUES (6209, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 00:07:16', 0);
INSERT INTO `sys_oper_log` VALUES (6210, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 00:07:26', 0);
INSERT INTO `sys_oper_log` VALUES (6211, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 09:08:13', 13);
INSERT INTO `sys_oper_log` VALUES (6212, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 09:23:15', 11);
INSERT INTO `sys_oper_log` VALUES (6213, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 09:23:16', 0);
INSERT INTO `sys_oper_log` VALUES (6214, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 09:37:34', 0);
INSERT INTO `sys_oper_log` VALUES (6215, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 09:38:13', 0);
INSERT INTO `sys_oper_log` VALUES (6216, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 09:40:02', 0);
INSERT INTO `sys_oper_log` VALUES (6217, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 09:42:00', 0);
INSERT INTO `sys_oper_log` VALUES (6218, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 09:42:28', 1);
INSERT INTO `sys_oper_log` VALUES (6219, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 09:43:23', 0);
INSERT INTO `sys_oper_log` VALUES (6220, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 09:43:47', 0);
INSERT INTO `sys_oper_log` VALUES (6221, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 11:19:19', 11);
INSERT INTO `sys_oper_log` VALUES (6222, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 11:28:34', 0);
INSERT INTO `sys_oper_log` VALUES (6223, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 11:31:11', 0);
INSERT INTO `sys_oper_log` VALUES (6224, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 11:31:15', 0);
INSERT INTO `sys_oper_log` VALUES (6225, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 11:35:31', 0);
INSERT INTO `sys_oper_log` VALUES (6226, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 11:40:50', 0);
INSERT INTO `sys_oper_log` VALUES (6227, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 12:22:07', 19);
INSERT INTO `sys_oper_log` VALUES (6228, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 12:27:08', 1);
INSERT INTO `sys_oper_log` VALUES (6229, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 13:53:14', 0);
INSERT INTO `sys_oper_log` VALUES (6230, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 14:05:11', 10);
INSERT INTO `sys_oper_log` VALUES (6231, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 14:05:14', 0);
INSERT INTO `sys_oper_log` VALUES (6232, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 14:05:49', 1);
INSERT INTO `sys_oper_log` VALUES (6233, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 14:06:20', 0);
INSERT INTO `sys_oper_log` VALUES (6234, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 14:07:37', 0);
INSERT INTO `sys_oper_log` VALUES (6235, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 14:13:20', 0);
INSERT INTO `sys_oper_log` VALUES (6236, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 14:13:28', 0);
INSERT INTO `sys_oper_log` VALUES (6237, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 14:14:17', 0);
INSERT INTO `sys_oper_log` VALUES (6238, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 14:14:20', 0);
INSERT INTO `sys_oper_log` VALUES (6239, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 14:16:06', 0);
INSERT INTO `sys_oper_log` VALUES (6240, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 14:22:40', 18);
INSERT INTO `sys_oper_log` VALUES (6241, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 14:24:25', 12);
INSERT INTO `sys_oper_log` VALUES (6242, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 14:50:15', 15);
INSERT INTO `sys_oper_log` VALUES (6243, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-02 14:50:24', 0);
INSERT INTO `sys_oper_log` VALUES (6244, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-03 14:06:03', 13);
INSERT INTO `sys_oper_log` VALUES (6245, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-03 14:08:01', 0);
INSERT INTO `sys_oper_log` VALUES (6246, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-03 14:10:41', 1);
INSERT INTO `sys_oper_log` VALUES (6247, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-03 14:10:47', 0);
INSERT INTO `sys_oper_log` VALUES (6248, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-03 14:11:01', 0);
INSERT INTO `sys_oper_log` VALUES (6249, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-03 14:12:24', 0);
INSERT INTO `sys_oper_log` VALUES (6250, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-03 14:13:14', 0);
INSERT INTO `sys_oper_log` VALUES (6251, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-03 14:13:18', 0);
INSERT INTO `sys_oper_log` VALUES (6252, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-03 14:43:07', 0);
INSERT INTO `sys_oper_log` VALUES (6253, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-03 15:41:42', 0);
INSERT INTO `sys_oper_log` VALUES (6254, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-03 15:53:25', 0);
INSERT INTO `sys_oper_log` VALUES (6255, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-06 09:30:30', 9);
INSERT INTO `sys_oper_log` VALUES (6256, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-06 10:16:24', 0);
INSERT INTO `sys_oper_log` VALUES (6257, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-06 10:40:16', 0);
INSERT INTO `sys_oper_log` VALUES (6258, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-06 15:20:53', 11);
INSERT INTO `sys_oper_log` VALUES (6259, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-06 15:31:21', 0);
INSERT INTO `sys_oper_log` VALUES (6260, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-07 08:49:50', 12);
INSERT INTO `sys_oper_log` VALUES (6261, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-07 15:40:56', 10);
INSERT INTO `sys_oper_log` VALUES (6262, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-07 16:34:12', 0);
INSERT INTO `sys_oper_log` VALUES (6263, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-07 17:15:11', 16);
INSERT INTO `sys_oper_log` VALUES (6264, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-07 17:17:19', 0);
INSERT INTO `sys_oper_log` VALUES (6265, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-07 17:31:05', 17);
INSERT INTO `sys_oper_log` VALUES (6266, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-08 08:42:48', 12);
INSERT INTO `sys_oper_log` VALUES (6267, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-08 08:58:22', 1);
INSERT INTO `sys_oper_log` VALUES (6268, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-08 09:01:39', 0);
INSERT INTO `sys_oper_log` VALUES (6269, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-08 11:07:01', 14);
INSERT INTO `sys_oper_log` VALUES (6270, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-08 11:07:02', 0);
INSERT INTO `sys_oper_log` VALUES (6271, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-08 11:38:40', 1);
INSERT INTO `sys_oper_log` VALUES (6272, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-08 13:45:46', 0);
INSERT INTO `sys_oper_log` VALUES (6273, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-08 13:48:05', 0);
INSERT INTO `sys_oper_log` VALUES (6274, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-08 13:48:08', 0);
INSERT INTO `sys_oper_log` VALUES (6275, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-08 13:51:35', 16);
INSERT INTO `sys_oper_log` VALUES (6276, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-08 14:45:47', 9);
INSERT INTO `sys_oper_log` VALUES (6277, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-08 14:45:50', 0);
INSERT INTO `sys_oper_log` VALUES (6278, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-08 14:45:53', 0);
INSERT INTO `sys_oper_log` VALUES (6279, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-08 14:46:12', 0);
INSERT INTO `sys_oper_log` VALUES (6280, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-08 14:47:01', 0);
INSERT INTO `sys_oper_log` VALUES (6281, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-08 14:47:11', 0);
INSERT INTO `sys_oper_log` VALUES (6282, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-08 14:47:54', 1);
INSERT INTO `sys_oper_log` VALUES (6283, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-08 15:14:36', 1);
INSERT INTO `sys_oper_log` VALUES (6284, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-09 10:55:18', 22);
INSERT INTO `sys_oper_log` VALUES (6285, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-13 09:01:17', 13);
INSERT INTO `sys_oper_log` VALUES (6286, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-13 09:54:37', 1);
INSERT INTO `sys_oper_log` VALUES (6287, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-13 10:11:40', 0);
INSERT INTO `sys_oper_log` VALUES (6288, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 10:29:35', 9);
INSERT INTO `sys_oper_log` VALUES (6289, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 10:51:48', 11);
INSERT INTO `sys_oper_log` VALUES (6290, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 13:58:58', 11);
INSERT INTO `sys_oper_log` VALUES (6291, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 13:59:11', 0);
INSERT INTO `sys_oper_log` VALUES (6292, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 13:59:59', 0);
INSERT INTO `sys_oper_log` VALUES (6293, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 14:03:05', 0);
INSERT INTO `sys_oper_log` VALUES (6294, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 14:21:04', 0);
INSERT INTO `sys_oper_log` VALUES (6295, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 16:23:31', 0);
INSERT INTO `sys_oper_log` VALUES (6296, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 16:41:37', 1);
INSERT INTO `sys_oper_log` VALUES (6297, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 16:41:44', 0);
INSERT INTO `sys_oper_log` VALUES (6298, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 16:41:45', 0);
INSERT INTO `sys_oper_log` VALUES (6299, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 16:41:45', 0);
INSERT INTO `sys_oper_log` VALUES (6300, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 16:41:47', 0);
INSERT INTO `sys_oper_log` VALUES (6301, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 16:41:48', 1);
INSERT INTO `sys_oper_log` VALUES (6302, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 16:42:02', 0);
INSERT INTO `sys_oper_log` VALUES (6303, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 16:42:30', 1);
INSERT INTO `sys_oper_log` VALUES (6304, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'root', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 16:42:42', 0);
INSERT INTO `sys_oper_log` VALUES (6305, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 16:44:32', 0);
INSERT INTO `sys_oper_log` VALUES (6306, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 16:44:39', 0);
INSERT INTO `sys_oper_log` VALUES (6307, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 17:07:22', 0);
INSERT INTO `sys_oper_log` VALUES (6308, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 17:07:40', 0);
INSERT INTO `sys_oper_log` VALUES (6309, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 17:07:44', 0);
INSERT INTO `sys_oper_log` VALUES (6310, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 17:07:59', 1);
INSERT INTO `sys_oper_log` VALUES (6311, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 17:08:08', 0);
INSERT INTO `sys_oper_log` VALUES (6312, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 17:08:09', 0);
INSERT INTO `sys_oper_log` VALUES (6313, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-16 17:08:10', 0);
INSERT INTO `sys_oper_log` VALUES (6314, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 09:40:20', 15);
INSERT INTO `sys_oper_log` VALUES (6315, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 09:41:54', 0);
INSERT INTO `sys_oper_log` VALUES (6316, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 09:43:55', 0);
INSERT INTO `sys_oper_log` VALUES (6317, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 09:47:14', 0);
INSERT INTO `sys_oper_log` VALUES (6318, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 09:47:36', 0);
INSERT INTO `sys_oper_log` VALUES (6319, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 09:47:37', 0);
INSERT INTO `sys_oper_log` VALUES (6320, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 09:48:30', 1);
INSERT INTO `sys_oper_log` VALUES (6321, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 09:48:31', 0);
INSERT INTO `sys_oper_log` VALUES (6322, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 09:50:01', 0);
INSERT INTO `sys_oper_log` VALUES (6323, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 09:51:25', 0);
INSERT INTO `sys_oper_log` VALUES (6324, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 09:51:26', 0);
INSERT INTO `sys_oper_log` VALUES (6325, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 09:52:20', 0);
INSERT INTO `sys_oper_log` VALUES (6326, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 09:52:30', 0);
INSERT INTO `sys_oper_log` VALUES (6327, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 09:58:48', 0);
INSERT INTO `sys_oper_log` VALUES (6328, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 10:02:35', 0);
INSERT INTO `sys_oper_log` VALUES (6329, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 10:02:43', 1);
INSERT INTO `sys_oper_log` VALUES (6330, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 10:27:25', 1);
INSERT INTO `sys_oper_log` VALUES (6331, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 10:28:19', 0);
INSERT INTO `sys_oper_log` VALUES (6332, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 10:28:23', 0);
INSERT INTO `sys_oper_log` VALUES (6333, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 10:28:37', 0);
INSERT INTO `sys_oper_log` VALUES (6334, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 10:28:39', 0);
INSERT INTO `sys_oper_log` VALUES (6335, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 10:28:50', 0);
INSERT INTO `sys_oper_log` VALUES (6336, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 10:28:57', 0);
INSERT INTO `sys_oper_log` VALUES (6337, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 10:29:57', 0);
INSERT INTO `sys_oper_log` VALUES (6338, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 10:29:57', 0);
INSERT INTO `sys_oper_log` VALUES (6339, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 10:30:15', 0);
INSERT INTO `sys_oper_log` VALUES (6340, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 10:30:49', 0);
INSERT INTO `sys_oper_log` VALUES (6341, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 10:30:52', 0);
INSERT INTO `sys_oper_log` VALUES (6342, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:12:53', 0);
INSERT INTO `sys_oper_log` VALUES (6343, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:12:54', 0);
INSERT INTO `sys_oper_log` VALUES (6344, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:14:25', 0);
INSERT INTO `sys_oper_log` VALUES (6345, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:15:12', 0);
INSERT INTO `sys_oper_log` VALUES (6346, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:15:12', 0);
INSERT INTO `sys_oper_log` VALUES (6347, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:15:16', 0);
INSERT INTO `sys_oper_log` VALUES (6348, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:15:39', 0);
INSERT INTO `sys_oper_log` VALUES (6349, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:15:39', 0);
INSERT INTO `sys_oper_log` VALUES (6350, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:15:42', 0);
INSERT INTO `sys_oper_log` VALUES (6351, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:15:42', 0);
INSERT INTO `sys_oper_log` VALUES (6352, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:15:44', 0);
INSERT INTO `sys_oper_log` VALUES (6353, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:16:21', 0);
INSERT INTO `sys_oper_log` VALUES (6354, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:16:21', 0);
INSERT INTO `sys_oper_log` VALUES (6355, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:17:08', 0);
INSERT INTO `sys_oper_log` VALUES (6356, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:17:08', 0);
INSERT INTO `sys_oper_log` VALUES (6357, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:17:10', 1);
INSERT INTO `sys_oper_log` VALUES (6358, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:17:10', 0);
INSERT INTO `sys_oper_log` VALUES (6359, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:17:28', 1);
INSERT INTO `sys_oper_log` VALUES (6360, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:17:28', 0);
INSERT INTO `sys_oper_log` VALUES (6361, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:19:18', 0);
INSERT INTO `sys_oper_log` VALUES (6362, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:19:18', 0);
INSERT INTO `sys_oper_log` VALUES (6363, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:19:37', 0);
INSERT INTO `sys_oper_log` VALUES (6364, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:19:37', 0);
INSERT INTO `sys_oper_log` VALUES (6365, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:19:45', 0);
INSERT INTO `sys_oper_log` VALUES (6366, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:19:45', 1);
INSERT INTO `sys_oper_log` VALUES (6367, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:20:01', 0);
INSERT INTO `sys_oper_log` VALUES (6368, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:20:01', 0);
INSERT INTO `sys_oper_log` VALUES (6369, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:20:29', 0);
INSERT INTO `sys_oper_log` VALUES (6370, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:20:29', 0);
INSERT INTO `sys_oper_log` VALUES (6371, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:20:49', 0);
INSERT INTO `sys_oper_log` VALUES (6372, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:20:52', 0);
INSERT INTO `sys_oper_log` VALUES (6373, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:21:13', 0);
INSERT INTO `sys_oper_log` VALUES (6374, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:21:29', 0);
INSERT INTO `sys_oper_log` VALUES (6375, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:21:54', 0);
INSERT INTO `sys_oper_log` VALUES (6376, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:21:57', 0);
INSERT INTO `sys_oper_log` VALUES (6377, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:23:24', 0);
INSERT INTO `sys_oper_log` VALUES (6378, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:23:26', 0);
INSERT INTO `sys_oper_log` VALUES (6379, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:25:04', 0);
INSERT INTO `sys_oper_log` VALUES (6380, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:25:25', 0);
INSERT INTO `sys_oper_log` VALUES (6381, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:25:52', 0);
INSERT INTO `sys_oper_log` VALUES (6382, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:32:12', 0);
INSERT INTO `sys_oper_log` VALUES (6383, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:32:12', 0);
INSERT INTO `sys_oper_log` VALUES (6384, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:32:27', 0);
INSERT INTO `sys_oper_log` VALUES (6385, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:32:48', 1);
INSERT INTO `sys_oper_log` VALUES (6386, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:32:48', 0);
INSERT INTO `sys_oper_log` VALUES (6387, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:33:09', 0);
INSERT INTO `sys_oper_log` VALUES (6388, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:33:09', 0);
INSERT INTO `sys_oper_log` VALUES (6389, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:33:46', 0);
INSERT INTO `sys_oper_log` VALUES (6390, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:33:46', 0);
INSERT INTO `sys_oper_log` VALUES (6391, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:33:52', 0);
INSERT INTO `sys_oper_log` VALUES (6392, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:33:52', 0);
INSERT INTO `sys_oper_log` VALUES (6393, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:34:00', 0);
INSERT INTO `sys_oper_log` VALUES (6394, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:34:00', 0);
INSERT INTO `sys_oper_log` VALUES (6395, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:34:15', 0);
INSERT INTO `sys_oper_log` VALUES (6396, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:34:15', 0);
INSERT INTO `sys_oper_log` VALUES (6397, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:36:48', 0);
INSERT INTO `sys_oper_log` VALUES (6398, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:36:49', 0);
INSERT INTO `sys_oper_log` VALUES (6399, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:37:00', 0);
INSERT INTO `sys_oper_log` VALUES (6400, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:37:13', 0);
INSERT INTO `sys_oper_log` VALUES (6401, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:37:17', 0);
INSERT INTO `sys_oper_log` VALUES (6402, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:37:19', 0);
INSERT INTO `sys_oper_log` VALUES (6403, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:37:20', 1);
INSERT INTO `sys_oper_log` VALUES (6404, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:37:24', 0);
INSERT INTO `sys_oper_log` VALUES (6405, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 11:37:36', 0);
INSERT INTO `sys_oper_log` VALUES (6406, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 13:49:04', 1);
INSERT INTO `sys_oper_log` VALUES (6407, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 13:49:26', 0);
INSERT INTO `sys_oper_log` VALUES (6408, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 13:55:37', 0);
INSERT INTO `sys_oper_log` VALUES (6409, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 13:55:55', 1);
INSERT INTO `sys_oper_log` VALUES (6410, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 13:56:10', 0);
INSERT INTO `sys_oper_log` VALUES (6411, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 13:56:32', 1);
INSERT INTO `sys_oper_log` VALUES (6412, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 14:28:38', 13);
INSERT INTO `sys_oper_log` VALUES (6413, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 14:36:23', 0);
INSERT INTO `sys_oper_log` VALUES (6414, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 14:39:20', 1);
INSERT INTO `sys_oper_log` VALUES (6415, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 14:48:25', 0);
INSERT INTO `sys_oper_log` VALUES (6416, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 15:03:45', 0);
INSERT INTO `sys_oper_log` VALUES (6417, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 15:48:59', 1);
INSERT INTO `sys_oper_log` VALUES (6418, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-17 15:56:29', 0);
INSERT INTO `sys_oper_log` VALUES (6419, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 08:44:57', 17);
INSERT INTO `sys_oper_log` VALUES (6420, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 08:44:59', 0);
INSERT INTO `sys_oper_log` VALUES (6421, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 08:45:39', 0);
INSERT INTO `sys_oper_log` VALUES (6422, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 08:46:32', 1);
INSERT INTO `sys_oper_log` VALUES (6423, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 08:46:33', 0);
INSERT INTO `sys_oper_log` VALUES (6424, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 08:46:37', 1);
INSERT INTO `sys_oper_log` VALUES (6425, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 08:46:37', 0);
INSERT INTO `sys_oper_log` VALUES (6426, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 08:46:38', 0);
INSERT INTO `sys_oper_log` VALUES (6427, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 08:48:02', 0);
INSERT INTO `sys_oper_log` VALUES (6428, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 08:48:05', 0);
INSERT INTO `sys_oper_log` VALUES (6429, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 08:48:13', 0);
INSERT INTO `sys_oper_log` VALUES (6430, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 08:48:47', 0);
INSERT INTO `sys_oper_log` VALUES (6431, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 08:49:16', 0);
INSERT INTO `sys_oper_log` VALUES (6432, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 08:54:39', 0);
INSERT INTO `sys_oper_log` VALUES (6433, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 08:55:34', 0);
INSERT INTO `sys_oper_log` VALUES (6434, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 08:57:49', 1);
INSERT INTO `sys_oper_log` VALUES (6435, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 08:58:06', 0);
INSERT INTO `sys_oper_log` VALUES (6436, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 08:59:03', 0);
INSERT INTO `sys_oper_log` VALUES (6437, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:11:32', 14);
INSERT INTO `sys_oper_log` VALUES (6438, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:12:06', 0);
INSERT INTO `sys_oper_log` VALUES (6439, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:12:12', 0);
INSERT INTO `sys_oper_log` VALUES (6440, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:17:32', 1);
INSERT INTO `sys_oper_log` VALUES (6441, '告警数据导出', 5, 'com.ruoyi.ems.AlarmMessageController.export()', 'POST', 1, 'admin', NULL, '/alarm/msg/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-20 09:17:54', 570);
INSERT INTO `sys_oper_log` VALUES (6442, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:21:13', 13);
INSERT INTO `sys_oper_log` VALUES (6443, '告警数据导出', 5, 'com.ruoyi.ems.AlarmMessageController.export()', 'POST', 1, 'admin', NULL, '/alarm/msg/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-20 09:21:15', 500);
INSERT INTO `sys_oper_log` VALUES (6444, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:23:30', 14);
INSERT INTO `sys_oper_log` VALUES (6445, '告警数据导出', 5, 'com.ruoyi.ems.AlarmMessageController.export()', 'POST', 1, 'admin', NULL, '/alarm/msg/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-20 09:23:32', 491);
INSERT INTO `sys_oper_log` VALUES (6446, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:25:42', 13);
INSERT INTO `sys_oper_log` VALUES (6447, '告警数据导出', 5, 'com.ruoyi.ems.AlarmMessageController.export()', 'POST', 1, 'admin', NULL, '/alarm/msg/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-20 09:25:44', 500);
INSERT INTO `sys_oper_log` VALUES (6448, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:26:13', 0);
INSERT INTO `sys_oper_log` VALUES (6449, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:26:16', 0);
INSERT INTO `sys_oper_log` VALUES (6450, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:26:27', 0);
INSERT INTO `sys_oper_log` VALUES (6451, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:26:29', 0);
INSERT INTO `sys_oper_log` VALUES (6452, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:38:28', 1);
INSERT INTO `sys_oper_log` VALUES (6453, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:41:09', 0);
INSERT INTO `sys_oper_log` VALUES (6454, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:42:49', 0);
INSERT INTO `sys_oper_log` VALUES (6455, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:42:50', 1);
INSERT INTO `sys_oper_log` VALUES (6456, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:44:20', 1);
INSERT INTO `sys_oper_log` VALUES (6457, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:45:44', 0);
INSERT INTO `sys_oper_log` VALUES (6458, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:46:08', 0);
INSERT INTO `sys_oper_log` VALUES (6459, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:46:09', 0);
INSERT INTO `sys_oper_log` VALUES (6460, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:46:24', 0);
INSERT INTO `sys_oper_log` VALUES (6461, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:46:24', 0);
INSERT INTO `sys_oper_log` VALUES (6462, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:46:25', 0);
INSERT INTO `sys_oper_log` VALUES (6463, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:46:25', 0);
INSERT INTO `sys_oper_log` VALUES (6464, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:46:38', 0);
INSERT INTO `sys_oper_log` VALUES (6465, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:48:01', 0);
INSERT INTO `sys_oper_log` VALUES (6466, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:48:47', 0);
INSERT INTO `sys_oper_log` VALUES (6467, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:48:48', 0);
INSERT INTO `sys_oper_log` VALUES (6468, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:48:49', 0);
INSERT INTO `sys_oper_log` VALUES (6469, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:48:50', 0);
INSERT INTO `sys_oper_log` VALUES (6470, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:50:29', 0);
INSERT INTO `sys_oper_log` VALUES (6471, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:50:30', 0);
INSERT INTO `sys_oper_log` VALUES (6472, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:50:36', 0);
INSERT INTO `sys_oper_log` VALUES (6473, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:50:37', 0);
INSERT INTO `sys_oper_log` VALUES (6474, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:50:37', 0);
INSERT INTO `sys_oper_log` VALUES (6475, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:50:38', 0);
INSERT INTO `sys_oper_log` VALUES (6476, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:50:43', 0);
INSERT INTO `sys_oper_log` VALUES (6477, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:50:43', 0);
INSERT INTO `sys_oper_log` VALUES (6478, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:51:05', 0);
INSERT INTO `sys_oper_log` VALUES (6479, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:51:06', 0);
INSERT INTO `sys_oper_log` VALUES (6480, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:51:06', 0);
INSERT INTO `sys_oper_log` VALUES (6481, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:52:13', 0);
INSERT INTO `sys_oper_log` VALUES (6482, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:52:33', 0);
INSERT INTO `sys_oper_log` VALUES (6483, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:52:50', 1);
INSERT INTO `sys_oper_log` VALUES (6484, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:53:14', 0);
INSERT INTO `sys_oper_log` VALUES (6485, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:53:42', 0);
INSERT INTO `sys_oper_log` VALUES (6486, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:53:43', 0);
INSERT INTO `sys_oper_log` VALUES (6487, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:53:50', 0);
INSERT INTO `sys_oper_log` VALUES (6488, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:53:56', 0);
INSERT INTO `sys_oper_log` VALUES (6489, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:54:14', 0);
INSERT INTO `sys_oper_log` VALUES (6490, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:54:15', 0);
INSERT INTO `sys_oper_log` VALUES (6491, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:54:48', 0);
INSERT INTO `sys_oper_log` VALUES (6492, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:54:49', 0);
INSERT INTO `sys_oper_log` VALUES (6493, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:54:51', 1);
INSERT INTO `sys_oper_log` VALUES (6494, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:54:57', 0);
INSERT INTO `sys_oper_log` VALUES (6495, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:54:58', 0);
INSERT INTO `sys_oper_log` VALUES (6496, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:55:11', 0);
INSERT INTO `sys_oper_log` VALUES (6497, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:55:12', 0);
INSERT INTO `sys_oper_log` VALUES (6498, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:56:51', 1);
INSERT INTO `sys_oper_log` VALUES (6499, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:57:12', 0);
INSERT INTO `sys_oper_log` VALUES (6500, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:57:36', 0);
INSERT INTO `sys_oper_log` VALUES (6501, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:58:22', 0);
INSERT INTO `sys_oper_log` VALUES (6502, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:58:33', 1);
INSERT INTO `sys_oper_log` VALUES (6503, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:58:35', 0);
INSERT INTO `sys_oper_log` VALUES (6504, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:59:08', 1);
INSERT INTO `sys_oper_log` VALUES (6505, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 09:59:15', 1);
INSERT INTO `sys_oper_log` VALUES (6506, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 10:02:28', 0);
INSERT INTO `sys_oper_log` VALUES (6507, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 13:47:37', 8);
INSERT INTO `sys_oper_log` VALUES (6508, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 13:48:11', 0);
INSERT INTO `sys_oper_log` VALUES (6509, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 13:48:38', 0);
INSERT INTO `sys_oper_log` VALUES (6510, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 13:50:30', 12);
INSERT INTO `sys_oper_log` VALUES (6511, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 14:01:06', 10);
INSERT INTO `sys_oper_log` VALUES (6512, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 14:06:02', 0);
INSERT INTO `sys_oper_log` VALUES (6513, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 14:34:51', 12);
INSERT INTO `sys_oper_log` VALUES (6514, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 14:40:16', 0);
INSERT INTO `sys_oper_log` VALUES (6515, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 14:47:17', 0);
INSERT INTO `sys_oper_log` VALUES (6516, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 14:54:08', 1);
INSERT INTO `sys_oper_log` VALUES (6517, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 14:55:29', 0);
INSERT INTO `sys_oper_log` VALUES (6518, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 14:56:03', 1);
INSERT INTO `sys_oper_log` VALUES (6519, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 14:57:17', 13);
INSERT INTO `sys_oper_log` VALUES (6520, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 14:59:58', 0);
INSERT INTO `sys_oper_log` VALUES (6521, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 15:03:32', 0);
INSERT INTO `sys_oper_log` VALUES (6522, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 15:03:49', 0);
INSERT INTO `sys_oper_log` VALUES (6523, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 15:13:03', 0);
INSERT INTO `sys_oper_log` VALUES (6524, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 15:14:58', 1);
INSERT INTO `sys_oper_log` VALUES (6525, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 15:15:01', 0);
INSERT INTO `sys_oper_log` VALUES (6526, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 15:15:48', 1);
INSERT INTO `sys_oper_log` VALUES (6527, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 15:16:18', 0);
INSERT INTO `sys_oper_log` VALUES (6528, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 15:17:17', 0);
INSERT INTO `sys_oper_log` VALUES (6529, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 15:22:51', 17);
INSERT INTO `sys_oper_log` VALUES (6530, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 15:22:56', 0);
INSERT INTO `sys_oper_log` VALUES (6531, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 15:34:53', 16);
INSERT INTO `sys_oper_log` VALUES (6532, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 15:40:09', 13);
INSERT INTO `sys_oper_log` VALUES (6533, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 15:40:17', 0);
INSERT INTO `sys_oper_log` VALUES (6534, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 15:41:51', 0);
INSERT INTO `sys_oper_log` VALUES (6535, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 15:42:17', 0);
INSERT INTO `sys_oper_log` VALUES (6536, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 15:53:14', 11);
INSERT INTO `sys_oper_log` VALUES (6537, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 15:57:45', 11);
INSERT INTO `sys_oper_log` VALUES (6538, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 15:59:30', 0);
INSERT INTO `sys_oper_log` VALUES (6539, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 16:06:51', 0);
INSERT INTO `sys_oper_log` VALUES (6540, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 16:09:51', 0);
INSERT INTO `sys_oper_log` VALUES (6541, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 16:10:11', 0);
INSERT INTO `sys_oper_log` VALUES (6542, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 16:10:13', 0);
INSERT INTO `sys_oper_log` VALUES (6543, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 16:10:16', 0);
INSERT INTO `sys_oper_log` VALUES (6544, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 16:10:17', 0);
INSERT INTO `sys_oper_log` VALUES (6545, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 16:10:18', 0);
INSERT INTO `sys_oper_log` VALUES (6546, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 16:15:57', 0);
INSERT INTO `sys_oper_log` VALUES (6547, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 16:24:53', 0);
INSERT INTO `sys_oper_log` VALUES (6548, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 16:32:46', 0);
INSERT INTO `sys_oper_log` VALUES (6549, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 16:33:44', 0);
INSERT INTO `sys_oper_log` VALUES (6550, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 16:44:49', 1);
INSERT INTO `sys_oper_log` VALUES (6551, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 16:45:35', 0);
INSERT INTO `sys_oper_log` VALUES (6552, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 16:45:59', 0);
INSERT INTO `sys_oper_log` VALUES (6553, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 16:53:35', 0);
INSERT INTO `sys_oper_log` VALUES (6554, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 16:53:36', 0);
INSERT INTO `sys_oper_log` VALUES (6555, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 17:14:07', 0);
INSERT INTO `sys_oper_log` VALUES (6556, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 17:21:09', 1);
INSERT INTO `sys_oper_log` VALUES (6557, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 17:22:35', 0);
INSERT INTO `sys_oper_log` VALUES (6558, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 17:24:06', 0);
INSERT INTO `sys_oper_log` VALUES (6559, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 17:25:14', 1);
INSERT INTO `sys_oper_log` VALUES (6560, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 17:26:01', 0);
INSERT INTO `sys_oper_log` VALUES (6561, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 17:37:06', 7);
INSERT INTO `sys_oper_log` VALUES (6562, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-20 17:37:16', 0);
INSERT INTO `sys_oper_log` VALUES (6563, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-21 09:09:33', 18);
INSERT INTO `sys_oper_log` VALUES (6564, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-21 14:50:50', 11);
INSERT INTO `sys_oper_log` VALUES (6565, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-21 14:50:59', 0);
INSERT INTO `sys_oper_log` VALUES (6566, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-21 14:51:02', 0);
INSERT INTO `sys_oper_log` VALUES (6567, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-21 14:51:04', 0);
INSERT INTO `sys_oper_log` VALUES (6568, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-21 14:51:16', 0);
INSERT INTO `sys_oper_log` VALUES (6569, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 08:58:59', 11);
INSERT INTO `sys_oper_log` VALUES (6570, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:01:44', 0);
INSERT INTO `sys_oper_log` VALUES (6571, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:02:11', 1);
INSERT INTO `sys_oper_log` VALUES (6572, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:02:12', 0);
INSERT INTO `sys_oper_log` VALUES (6573, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:02:13', 0);
INSERT INTO `sys_oper_log` VALUES (6574, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:02:15', 0);
INSERT INTO `sys_oper_log` VALUES (6575, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:02:18', 0);
INSERT INTO `sys_oper_log` VALUES (6576, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:02:43', 1);
INSERT INTO `sys_oper_log` VALUES (6577, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:02:44', 0);
INSERT INTO `sys_oper_log` VALUES (6578, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:02:44', 0);
INSERT INTO `sys_oper_log` VALUES (6579, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:02:44', 1);
INSERT INTO `sys_oper_log` VALUES (6580, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:02:44', 0);
INSERT INTO `sys_oper_log` VALUES (6581, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:02:45', 0);
INSERT INTO `sys_oper_log` VALUES (6582, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:02:49', 13);
INSERT INTO `sys_oper_log` VALUES (6583, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:10:44', 0);
INSERT INTO `sys_oper_log` VALUES (6584, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:11:45', 1);
INSERT INTO `sys_oper_log` VALUES (6585, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:11:46', 0);
INSERT INTO `sys_oper_log` VALUES (6586, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:12:53', 0);
INSERT INTO `sys_oper_log` VALUES (6587, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:15:10', 0);
INSERT INTO `sys_oper_log` VALUES (6588, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:15:10', 0);
INSERT INTO `sys_oper_log` VALUES (6589, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:15:11', 1);
INSERT INTO `sys_oper_log` VALUES (6590, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:15:11', 0);
INSERT INTO `sys_oper_log` VALUES (6591, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:15:11', 0);
INSERT INTO `sys_oper_log` VALUES (6592, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:15:12', 0);
INSERT INTO `sys_oper_log` VALUES (6593, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:15:12', 0);
INSERT INTO `sys_oper_log` VALUES (6594, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:15:12', 0);
INSERT INTO `sys_oper_log` VALUES (6595, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:15:12', 0);
INSERT INTO `sys_oper_log` VALUES (6596, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:15:13', 0);
INSERT INTO `sys_oper_log` VALUES (6597, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:52:17', 0);
INSERT INTO `sys_oper_log` VALUES (6598, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:54:27', 0);
INSERT INTO `sys_oper_log` VALUES (6599, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:54:34', 0);
INSERT INTO `sys_oper_log` VALUES (6600, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:55:50', 0);
INSERT INTO `sys_oper_log` VALUES (6601, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:55:51', 0);
INSERT INTO `sys_oper_log` VALUES (6602, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:56:13', 0);
INSERT INTO `sys_oper_log` VALUES (6603, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:56:59', 0);
INSERT INTO `sys_oper_log` VALUES (6604, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:57:43', 0);
INSERT INTO `sys_oper_log` VALUES (6605, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:58:14', 1);
INSERT INTO `sys_oper_log` VALUES (6606, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:58:15', 0);
INSERT INTO `sys_oper_log` VALUES (6607, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 09:58:31', 0);
INSERT INTO `sys_oper_log` VALUES (6608, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 10:02:42', 0);
INSERT INTO `sys_oper_log` VALUES (6609, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 10:05:22', 0);
INSERT INTO `sys_oper_log` VALUES (6610, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 10:05:28', 0);
INSERT INTO `sys_oper_log` VALUES (6611, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 10:05:37', 0);
INSERT INTO `sys_oper_log` VALUES (6612, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 10:09:49', 0);
INSERT INTO `sys_oper_log` VALUES (6613, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 10:10:38', 0);
INSERT INTO `sys_oper_log` VALUES (6614, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 10:15:49', 0);
INSERT INTO `sys_oper_log` VALUES (6615, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 10:17:22', 1);
INSERT INTO `sys_oper_log` VALUES (6616, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 10:18:18', 1);
INSERT INTO `sys_oper_log` VALUES (6617, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 10:18:28', 0);
INSERT INTO `sys_oper_log` VALUES (6618, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 10:20:26', 0);
INSERT INTO `sys_oper_log` VALUES (6619, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:00:09', 0);
INSERT INTO `sys_oper_log` VALUES (6620, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:00:14', 0);
INSERT INTO `sys_oper_log` VALUES (6621, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:00:25', 0);
INSERT INTO `sys_oper_log` VALUES (6622, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:00:34', 0);
INSERT INTO `sys_oper_log` VALUES (6623, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:05:34', 0);
INSERT INTO `sys_oper_log` VALUES (6624, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:15:40', 0);
INSERT INTO `sys_oper_log` VALUES (6625, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:18:16', 1);
INSERT INTO `sys_oper_log` VALUES (6626, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:18:39', 0);
INSERT INTO `sys_oper_log` VALUES (6627, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:18:39', 1);
INSERT INTO `sys_oper_log` VALUES (6628, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:18:40', 0);
INSERT INTO `sys_oper_log` VALUES (6629, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:23:17', 0);
INSERT INTO `sys_oper_log` VALUES (6630, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:24:52', 0);
INSERT INTO `sys_oper_log` VALUES (6631, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:24:53', 0);
INSERT INTO `sys_oper_log` VALUES (6632, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:27:57', 0);
INSERT INTO `sys_oper_log` VALUES (6633, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:28:07', 0);
INSERT INTO `sys_oper_log` VALUES (6634, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:33:57', 0);
INSERT INTO `sys_oper_log` VALUES (6635, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:33:58', 0);
INSERT INTO `sys_oper_log` VALUES (6636, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:36:53', 0);
INSERT INTO `sys_oper_log` VALUES (6637, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:40:07', 0);
INSERT INTO `sys_oper_log` VALUES (6638, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:44:43', 0);
INSERT INTO `sys_oper_log` VALUES (6639, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:45:14', 1);
INSERT INTO `sys_oper_log` VALUES (6640, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 11:46:33', 0);
INSERT INTO `sys_oper_log` VALUES (6641, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 12:13:52', 0);
INSERT INTO `sys_oper_log` VALUES (6642, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 13:39:42', 0);
INSERT INTO `sys_oper_log` VALUES (6643, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 14:23:05', 1);
INSERT INTO `sys_oper_log` VALUES (6644, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 14:41:18', 1);
INSERT INTO `sys_oper_log` VALUES (6645, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 14:42:39', 0);
INSERT INTO `sys_oper_log` VALUES (6646, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 15:53:23', 9);
INSERT INTO `sys_oper_log` VALUES (6647, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 15:55:03', 0);
INSERT INTO `sys_oper_log` VALUES (6648, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:03:35', 0);
INSERT INTO `sys_oper_log` VALUES (6649, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:05:26', 0);
INSERT INTO `sys_oper_log` VALUES (6650, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:05:34', 1);
INSERT INTO `sys_oper_log` VALUES (6651, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:05:45', 0);
INSERT INTO `sys_oper_log` VALUES (6652, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:05:45', 0);
INSERT INTO `sys_oper_log` VALUES (6653, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:05:53', 0);
INSERT INTO `sys_oper_log` VALUES (6654, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:05:53', 1);
INSERT INTO `sys_oper_log` VALUES (6655, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:05:54', 0);
INSERT INTO `sys_oper_log` VALUES (6656, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:05:55', 0);
INSERT INTO `sys_oper_log` VALUES (6657, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:07:36', 0);
INSERT INTO `sys_oper_log` VALUES (6658, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:09:33', 0);
INSERT INTO `sys_oper_log` VALUES (6659, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:10:49', 0);
INSERT INTO `sys_oper_log` VALUES (6660, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:14:29', 0);
INSERT INTO `sys_oper_log` VALUES (6661, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:17:38', 1);
INSERT INTO `sys_oper_log` VALUES (6662, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:19:21', 0);
INSERT INTO `sys_oper_log` VALUES (6663, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:21:14', 0);
INSERT INTO `sys_oper_log` VALUES (6664, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:21:15', 0);
INSERT INTO `sys_oper_log` VALUES (6665, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:21:17', 0);
INSERT INTO `sys_oper_log` VALUES (6666, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:22:09', 0);
INSERT INTO `sys_oper_log` VALUES (6667, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:25:06', 0);
INSERT INTO `sys_oper_log` VALUES (6668, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 16:47:15', 0);
INSERT INTO `sys_oper_log` VALUES (6669, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:04:01', 0);
INSERT INTO `sys_oper_log` VALUES (6670, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:06:42', 0);
INSERT INTO `sys_oper_log` VALUES (6671, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:07:20', 0);
INSERT INTO `sys_oper_log` VALUES (6672, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:07:59', 0);
INSERT INTO `sys_oper_log` VALUES (6673, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:08:13', 0);
INSERT INTO `sys_oper_log` VALUES (6674, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:08:50', 0);
INSERT INTO `sys_oper_log` VALUES (6675, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:10:10', 1);
INSERT INTO `sys_oper_log` VALUES (6676, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:10:11', 0);
INSERT INTO `sys_oper_log` VALUES (6677, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:10:58', 0);
INSERT INTO `sys_oper_log` VALUES (6678, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:11:38', 0);
INSERT INTO `sys_oper_log` VALUES (6679, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:13:44', 0);
INSERT INTO `sys_oper_log` VALUES (6680, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:19:35', 0);
INSERT INTO `sys_oper_log` VALUES (6681, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:20:54', 0);
INSERT INTO `sys_oper_log` VALUES (6682, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:25:47', 0);
INSERT INTO `sys_oper_log` VALUES (6683, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:26:10', 0);
INSERT INTO `sys_oper_log` VALUES (6684, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:28:06', 0);
INSERT INTO `sys_oper_log` VALUES (6685, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:38:50', 0);
INSERT INTO `sys_oper_log` VALUES (6686, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:38:57', 1);
INSERT INTO `sys_oper_log` VALUES (6687, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:41:15', 0);
INSERT INTO `sys_oper_log` VALUES (6688, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:41:29', 0);
INSERT INTO `sys_oper_log` VALUES (6689, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:41:33', 0);
INSERT INTO `sys_oper_log` VALUES (6690, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:41:34', 0);
INSERT INTO `sys_oper_log` VALUES (6691, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:41:37', 0);
INSERT INTO `sys_oper_log` VALUES (6692, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:41:39', 0);
INSERT INTO `sys_oper_log` VALUES (6693, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:41:41', 0);
INSERT INTO `sys_oper_log` VALUES (6694, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:41:43', 0);
INSERT INTO `sys_oper_log` VALUES (6695, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:43:18', 0);
INSERT INTO `sys_oper_log` VALUES (6696, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:43:19', 0);
INSERT INTO `sys_oper_log` VALUES (6697, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:43:20', 0);
INSERT INTO `sys_oper_log` VALUES (6698, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:43:21', 0);
INSERT INTO `sys_oper_log` VALUES (6699, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:47:21', 0);
INSERT INTO `sys_oper_log` VALUES (6700, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 17:47:23', 0);
INSERT INTO `sys_oper_log` VALUES (6701, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 22:41:39', 16);
INSERT INTO `sys_oper_log` VALUES (6702, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-22 22:42:06', 1);
INSERT INTO `sys_oper_log` VALUES (6703, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 09:26:37', 10);
INSERT INTO `sys_oper_log` VALUES (6704, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 09:26:40', 0);
INSERT INTO `sys_oper_log` VALUES (6705, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 09:27:12', 0);
INSERT INTO `sys_oper_log` VALUES (6706, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 10:24:55', 0);
INSERT INTO `sys_oper_log` VALUES (6707, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 10:27:43', 0);
INSERT INTO `sys_oper_log` VALUES (6708, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 10:27:45', 1);
INSERT INTO `sys_oper_log` VALUES (6709, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 10:27:46', 0);
INSERT INTO `sys_oper_log` VALUES (6710, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 10:28:10', 0);
INSERT INTO `sys_oper_log` VALUES (6711, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 11:47:48', 0);
INSERT INTO `sys_oper_log` VALUES (6712, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 13:46:50', 1);
INSERT INTO `sys_oper_log` VALUES (6713, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 13:46:58', 0);
INSERT INTO `sys_oper_log` VALUES (6714, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 13:48:11', 0);
INSERT INTO `sys_oper_log` VALUES (6715, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 13:50:21', 0);
INSERT INTO `sys_oper_log` VALUES (6716, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 13:50:33', 1);
INSERT INTO `sys_oper_log` VALUES (6717, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 14:21:01', 0);
INSERT INTO `sys_oper_log` VALUES (6718, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 14:21:22', 0);
INSERT INTO `sys_oper_log` VALUES (6719, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 14:29:15', 0);
INSERT INTO `sys_oper_log` VALUES (6720, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 14:38:23', 0);
INSERT INTO `sys_oper_log` VALUES (6721, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 17:17:43', 20);
INSERT INTO `sys_oper_log` VALUES (6722, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 17:21:15', 0);
INSERT INTO `sys_oper_log` VALUES (6723, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-23 17:21:25', 0);
INSERT INTO `sys_oper_log` VALUES (6724, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-24 10:57:47', 12);
INSERT INTO `sys_oper_log` VALUES (6725, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-24 10:58:17', 0);
INSERT INTO `sys_oper_log` VALUES (6726, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-24 10:58:47', 1);
INSERT INTO `sys_oper_log` VALUES (6727, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-24 11:16:43', 0);
INSERT INTO `sys_oper_log` VALUES (6728, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-24 11:25:49', 0);
INSERT INTO `sys_oper_log` VALUES (6729, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-24 11:26:41', 0);
INSERT INTO `sys_oper_log` VALUES (6730, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-24 13:55:39', 0);
INSERT INTO `sys_oper_log` VALUES (6731, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-24 13:55:48', 0);
INSERT INTO `sys_oper_log` VALUES (6732, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-24 14:14:41', 0);
INSERT INTO `sys_oper_log` VALUES (6733, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-25 12:27:19', 11);
INSERT INTO `sys_oper_log` VALUES (6734, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-25 12:27:56', 0);
INSERT INTO `sys_oper_log` VALUES (6735, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-25 12:52:03', 10);
INSERT INTO `sys_oper_log` VALUES (6736, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-25 12:52:08', 1);
INSERT INTO `sys_oper_log` VALUES (6737, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-25 13:00:01', 10);
INSERT INTO `sys_oper_log` VALUES (6738, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-27 10:56:06', 10);
INSERT INTO `sys_oper_log` VALUES (6739, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-27 10:57:10', 0);
INSERT INTO `sys_oper_log` VALUES (6740, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-28 09:04:06', 8);
INSERT INTO `sys_oper_log` VALUES (6741, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-28 09:04:42', 0);
INSERT INTO `sys_oper_log` VALUES (6742, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-28 09:39:58', 12);
INSERT INTO `sys_oper_log` VALUES (6743, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-28 09:40:17', 0);
INSERT INTO `sys_oper_log` VALUES (6744, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-28 09:49:09', 10);
INSERT INTO `sys_oper_log` VALUES (6745, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-28 09:49:45', 0);
INSERT INTO `sys_oper_log` VALUES (6746, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-28 09:52:54', 8);
INSERT INTO `sys_oper_log` VALUES (6747, '开启设备告警监控定时任务', 1, 'com.ruoyi.ems.AlarmMessageController.startAlarmTempMonitor()', 'GET', 1, 'admin', NULL, '/alarm/msg/startAlarmTempMonitor', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2023-11-28 09:54:11', 0);
INSERT INTO `sys_oper_log` VALUES (6748, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":100,\"batteryCount\":1,\"batteryRange\":10,\"batteryType\":12.0,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"535d1k8962.yicp.fun\",\"params\":{},\"port\":361321,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-11-28 14:13:38\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 14:13:38', 25);
INSERT INTO `sys_oper_log` VALUES (6749, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":100,\"batteryCount\":1,\"batteryRange\":10,\"batteryType\":12.0,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"535d1k8962.yicp.fun\",\"params\":{},\"port\":36132,\"slaveAddress\":1,\"status\":\"0\",\"updateTime\":\"2023-11-28 14:13:46\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-28 14:13:46', 60);
INSERT INTO `sys_oper_log` VALUES (6750, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":100,\"batteryCount\":1,\"batteryRange\":10,\"batteryType\":12.0,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"192.168.1.13\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"0\",\"updateTime\":\"2023-11-29 10:42:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 10:42:56', 24);
INSERT INTO `sys_oper_log` VALUES (6751, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":100,\"batteryCount\":1,\"batteryRange\":10,\"batteryType\":12.0,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"192.168.1.200\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"0\",\"updateTime\":\"2023-11-29 14:57:11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 14:57:11', 131);
INSERT INTO `sys_oper_log` VALUES (6752, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":100,\"batteryCount\":1,\"batteryRange\":10,\"batteryType\":12.0,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"192.168.1.13\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"0\",\"updateTime\":\"2023-11-29 16:02:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 16:02:04', 1159);
INSERT INTO `sys_oper_log` VALUES (6753, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":100,\"batteryCount\":10,\"batteryRange\":10,\"batteryType\":12.0,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"192.168.1.13\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-11-30 10:33:41\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-30 10:33:41', 370);
INSERT INTO `sys_oper_log` VALUES (6754, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":100,\"batteryCount\":1,\"batteryRange\":10,\"batteryType\":12.0,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"192.168.1.13\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-11-30 13:52:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-30 13:52:29', 278);
INSERT INTO `sys_oper_log` VALUES (6755, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"3000\",\"info\":\"电压不均一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-30 16:24:10', 646);
INSERT INTO `sys_oper_log` VALUES (6756, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"4000\",\"info\":\"电压不均一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-30 16:24:22', 536);
INSERT INTO `sys_oper_log` VALUES (6757, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"10000000\",\"info\":\"电压不均一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-30 16:24:34', 95);
INSERT INTO `sys_oper_log` VALUES (6758, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"3000\",\"info\":\"电压不均一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-30 16:24:42', 492);
INSERT INTO `sys_oper_log` VALUES (6759, '告警数据导出', 5, 'com.ruoyi.ems.AlarmMessageController.export()', 'POST', 1, 'admin', NULL, '/alarm/msg/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-30 16:34:36', 839);
INSERT INTO `sys_oper_log` VALUES (6760, '告警数据导出', 5, 'com.ruoyi.ems.AlarmMessageController.export()', 'POST', 1, 'admin', NULL, '/alarm/msg/export', '127.0.0.1', '内网IP', '{\"timeRange[0]\":\"2023-11-17 00:00:00\",\"pageSize\":\"10\",\"timeRange[1]\":\"2023-12-13 00:00:00\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-30 17:17:01', 140);
INSERT INTO `sys_oper_log` VALUES (6761, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":100,\"batteryCount\":1,\"batteryRange\":10,\"batteryType\":12.0,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"134.175.61.30\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"0\",\"updateTime\":\"2023-12-05 11:08:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-05 11:08:14', 146);
INSERT INTO `sys_oper_log` VALUES (6762, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":100,\"batteryCount\":2,\"batteryRange\":10,\"batteryType\":12.0,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"134.175.61.30\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-12-05 13:46:43\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-05 13:46:43', 455);
INSERT INTO `sys_oper_log` VALUES (6763, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":100,\"batteryCount\":1,\"batteryRange\":10,\"batteryType\":12.0,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"134.175.61.30\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-12-05 13:47:16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-05 13:47:16', 549);
INSERT INTO `sys_oper_log` VALUES (6764, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"130\",\"info\":\"组端电压一般下限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-05 13:47:25', 1528);
INSERT INTO `sys_oper_log` VALUES (6765, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"130\",\"info\":\"组端电压一般下限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-05 13:47:27', 1078);
INSERT INTO `sys_oper_log` VALUES (6766, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"100\",\"info\":\"组端电压一般下限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-05 14:05:14', 1589);
INSERT INTO `sys_oper_log` VALUES (6767, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":100,\"batteryCount\":1,\"batteryRange\":10,\"batteryType\":12.0,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"192.168.1.13\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-12-07 09:02:32\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-07 09:02:32', 2936);
INSERT INTO `sys_oper_log` VALUES (6768, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":100,\"batteryCount\":1,\"batteryRange\":10,\"batteryType\":12.0,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"134.175.61.30\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"0\",\"updateTime\":\"2023-12-11 09:04:13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-11 09:04:13', 661);
INSERT INTO `sys_oper_log` VALUES (6769, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":2,\"batteryRange\":50,\"batteryType\":12.0,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"134.175.61.30\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-12-11 17:04:28\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-11 17:04:28', 172);
INSERT INTO `sys_oper_log` VALUES (6770, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12.0,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"134.175.61.30\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-12-12 09:16:07\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 09:16:07', 16);
INSERT INTO `sys_oper_log` VALUES (6771, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"200\",\"info\":\"组端电压一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:02:56', 690);
INSERT INTO `sys_oper_log` VALUES (6772, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"100\",\"info\":\"组端电压一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:03:05', 893);
INSERT INTO `sys_oper_log` VALUES (6773, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"5000\",\"info\":\"电压不均一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:30:56', 682);
INSERT INTO `sys_oper_log` VALUES (6774, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"3000\",\"info\":\"电压不均严重上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:31:04', 870);
INSERT INTO `sys_oper_log` VALUES (6775, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"11000\",\"info\":\"电压极差一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:31:16', 834);
INSERT INTO `sys_oper_log` VALUES (6776, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"110\",\"info\":\"温度极差一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:31:31', 653);
INSERT INTO `sys_oper_log` VALUES (6777, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"100\",\"info\":\"温度极差一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:31:37', 1032);
INSERT INTO `sys_oper_log` VALUES (6778, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"1\",\"info\":\"单体内阻一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:32:17', 767);
INSERT INTO `sys_oper_log` VALUES (6779, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"0\",\"info\":\"单体内阻一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:32:23', 883);
INSERT INTO `sys_oper_log` VALUES (6780, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"300\",\"info\":\"单体温度一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:32:29', 684);
INSERT INTO `sys_oper_log` VALUES (6781, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"400\",\"info\":\"单体温度一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:32:36', 858);
INSERT INTO `sys_oper_log` VALUES (6782, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"450\",\"info\":\"单体温度严重上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:32:40', 811);
INSERT INTO `sys_oper_log` VALUES (6783, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"51000\",\"info\":\"电压不均一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:35:08', 860);
INSERT INTO `sys_oper_log` VALUES (6784, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"5000\",\"info\":\"电压不均一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:35:12', 996);
INSERT INTO `sys_oper_log` VALUES (6785, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"22\",\"info\":\"SOC下限一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:35:56', 857);
INSERT INTO `sys_oper_log` VALUES (6786, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"30\",\"info\":\"SOC下限一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:36:03', 1270);
INSERT INTO `sys_oper_log` VALUES (6787, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"60\",\"info\":\"SOC下限一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:36:10', 695);
INSERT INTO `sys_oper_log` VALUES (6788, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"600\",\"info\":\"SOC下限一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:36:42', 1038);
INSERT INTO `sys_oper_log` VALUES (6789, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"160\",\"info\":\"组端电压一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:40:21', 918);
INSERT INTO `sys_oper_log` VALUES (6790, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"60\",\"info\":\"SOC下限一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:41:36', 977);
INSERT INTO `sys_oper_log` VALUES (6791, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"1000\",\"info\":\"SOC下限严重上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:42:35', 693);
INSERT INTO `sys_oper_log` VALUES (6792, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"100\",\"info\":\"SOC下限严重上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:45:06', 1228);
INSERT INTO `sys_oper_log` VALUES (6793, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"300\",\"info\":\"SOC下限一般上限回差\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:45:37', 1068);
INSERT INTO `sys_oper_log` VALUES (6794, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"300\",\"info\":\"SOC下限一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:47:34', 720);
INSERT INTO `sys_oper_log` VALUES (6795, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"200\",\"info\":\"SOC下限严重上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:47:43', 972);
INSERT INTO `sys_oper_log` VALUES (6796, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"3\",\"info\":\"SOC下限一般上限回差\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:47:51', 924);
INSERT INTO `sys_oper_log` VALUES (6797, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"2000\",\"info\":\"单体内阻一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 15:49:28', 799);
INSERT INTO `sys_oper_log` VALUES (6798, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":100,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"134.175.61.30\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-12-12 16:42:34\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 16:42:34', 416);
INSERT INTO `sys_oper_log` VALUES (6799, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"134.175.61.30\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-12-12 16:43:32\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 16:43:32', 246);
INSERT INTO `sys_oper_log` VALUES (6800, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"80000\",\"info\":\"单体内阻一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 17:09:44', 866);
INSERT INTO `sys_oper_log` VALUES (6801, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"70000\",\"info\":\"单体内阻一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 17:09:55', 876);
INSERT INTO `sys_oper_log` VALUES (6802, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"60000\",\"info\":\"单体内阻一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 17:10:03', 643);
INSERT INTO `sys_oper_log` VALUES (6803, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"60000\",\"info\":\"单体内阻严重上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-12 17:10:16', 1015);
INSERT INTO `sys_oper_log` VALUES (6804, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":100,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"134.175.61.30\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-12-13 09:02:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 09:02:55', 867);
INSERT INTO `sys_oper_log` VALUES (6805, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"134.175.61.30\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-12-13 09:03:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 09:03:59', 968);
INSERT INTO `sys_oper_log` VALUES (6806, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"150\",\"info\":\"组端电压一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 12:29:31', 1046);
INSERT INTO `sys_oper_log` VALUES (6807, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"10000\",\"info\":\"单体电压一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 12:29:38', 1792);
INSERT INTO `sys_oper_log` VALUES (6808, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"15000\",\"info\":\"单体电压一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 12:29:47', 876);
INSERT INTO `sys_oper_log` VALUES (6809, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"1000\",\"info\":\"单体电压严重上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 12:29:52', 1011);
INSERT INTO `sys_oper_log` VALUES (6810, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"15000\",\"info\":\"单体电压严重上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 12:31:36', 2278);
INSERT INTO `sys_oper_log` VALUES (6811, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"10000\",\"info\":\"单体电压一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 12:31:42', 2696);
INSERT INTO `sys_oper_log` VALUES (6812, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":100,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"134.175.61.30\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-12-13 14:18:46\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 14:18:46', 931);
INSERT INTO `sys_oper_log` VALUES (6813, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"134.175.61.30\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-12-13 14:36:50\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 14:36:50', 581);
INSERT INTO `sys_oper_log` VALUES (6814, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"100\",\"info\":\"组端电压一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 15:24:48', 2089);
INSERT INTO `sys_oper_log` VALUES (6815, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"80\",\"info\":\"组端电压严重上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 15:24:56', 1835);
INSERT INTO `sys_oper_log` VALUES (6816, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"60\",\"info\":\"环境温度严重上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 15:25:08', 4438);
INSERT INTO `sys_oper_log` VALUES (6817, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"150\",\"info\":\"组端电压一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 15:45:22', 3878);
INSERT INTO `sys_oper_log` VALUES (6818, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"150\",\"info\":\"组端电压一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 15:45:24', 2087);
INSERT INTO `sys_oper_log` VALUES (6819, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"160\",\"info\":\"组端电压严重上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 15:45:28', 1680);
INSERT INTO `sys_oper_log` VALUES (6820, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"600\",\"info\":\"环境温度严重上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 15:45:39', 1618);
INSERT INTO `sys_oper_log` VALUES (6821, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"160\",\"info\":\"组端电流一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 15:45:47', 1573);
INSERT INTO `sys_oper_log` VALUES (6822, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"180\",\"info\":\"组端电流严重上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 15:45:59', 1845);
INSERT INTO `sys_oper_log` VALUES (6823, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":2,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"134.175.61.30\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-12-13 15:46:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 15:46:17', 2164);
INSERT INTO `sys_oper_log` VALUES (6824, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"134.175.61.30\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-12-13 15:47:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-13 15:47:03', 6715);
INSERT INTO `sys_oper_log` VALUES (6825, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"100\",\"info\":\"组端电压一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-14 13:47:29', 839);
INSERT INTO `sys_oper_log` VALUES (6826, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"50\",\"info\":\"单体温度一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-14 13:49:52', 713);
INSERT INTO `sys_oper_log` VALUES (6827, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"300\",\"info\":\"单体温度严重下限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-14 13:59:34', 1071);
INSERT INTO `sys_oper_log` VALUES (6828, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":2,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"134.175.61.30\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-12-14 14:00:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-14 14:00:10', 637);
INSERT INTO `sys_oper_log` VALUES (6829, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"15000\",\"info\":\"单体电压一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-14 14:47:47', 1464);
INSERT INTO `sys_oper_log` VALUES (6830, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"100\",\"info\":\"组端电压严重下限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-14 14:47:58', 1693);
INSERT INTO `sys_oper_log` VALUES (6831, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"300\",\"info\":\"单体温度一般下限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-14 14:48:17', 1840);
INSERT INTO `sys_oper_log` VALUES (6832, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"400\",\"info\":\"单体温度严重下限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-14 14:48:23', 1537);
INSERT INTO `sys_oper_log` VALUES (6833, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"134.175.61.30\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-12-14 14:48:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-14 14:48:59', 1483);
INSERT INTO `sys_oper_log` VALUES (6834, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"300\",\"info\":\"单体温度一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-14 14:49:26', 805);
INSERT INTO `sys_oper_log` VALUES (6835, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"100\",\"info\":\"单体温度一般下限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-14 14:49:38', 897);
INSERT INTO `sys_oper_log` VALUES (6836, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"100\",\"info\":\"单体温度一般下限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-14 14:49:38', 611);
INSERT INTO `sys_oper_log` VALUES (6837, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"-50\",\"info\":\"单体温度一般下限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-14 14:49:48', 1484);
INSERT INTO `sys_oper_log` VALUES (6838, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"-100\",\"info\":\"单体温度严重下限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-14 14:49:55', 1032);
INSERT INTO `sys_oper_log` VALUES (6839, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"110\",\"info\":\"组端电压一般下限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-14 15:33:04', 2585);
INSERT INTO `sys_oper_log` VALUES (6840, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"152\",\"info\":\"组端电压一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-14 16:21:34', 2317);
INSERT INTO `sys_oper_log` VALUES (6841, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"192.168.1.13\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"0\",\"updateTime\":\"2023-12-15 11:33:08\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-15 11:33:08', 2160);
INSERT INTO `sys_oper_log` VALUES (6842, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"192.168.1.13\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"0\",\"updateTime\":\"2023-12-15 11:35:13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-15 11:35:13', 8);
INSERT INTO `sys_oper_log` VALUES (6843, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'admin', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"10000\",\"info\":\"单体电压一般上限告警\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-15 13:48:27', 1112);
INSERT INTO `sys_oper_log` VALUES (6844, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"192.168.1.14\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-12-15 11:35:13\"}', NULL, 1, '', '2023-12-15 17:13:58', 3132);
INSERT INTO `sys_oper_log` VALUES (6845, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"192.168.1.13\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"0\",\"updateTime\":\"2023-12-15 11:35:13\"}', NULL, 1, '', '2023-12-15 17:14:12', 1012);
INSERT INTO `sys_oper_log` VALUES (6846, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"192.168.1.12\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"0\",\"updateTime\":\"2023-12-15 11:35:13\"}', NULL, 1, '', '2023-12-15 17:15:04', 2291);
INSERT INTO `sys_oper_log` VALUES (6847, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"192.168.1.13\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"0\",\"updateTime\":\"2023-12-15 11:35:13\"}', NULL, 1, '', '2023-12-15 17:15:49', 1004);
INSERT INTO `sys_oper_log` VALUES (6848, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"192.168.1.14\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-12-15 11:35:13\"}', NULL, 1, '', '2023-12-15 17:19:18', 2043);
INSERT INTO `sys_oper_log` VALUES (6849, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"192.168.1.14\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-12-15 17:22:02\"}', NULL, 1, '', '2023-12-15 17:22:03', 2041);
INSERT INTO `sys_oper_log` VALUES (6850, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"192.168.1.13\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"0\",\"updateTime\":\"2023-12-15 17:23:55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-15 17:23:55', 198);
INSERT INTO `sys_oper_log` VALUES (6851, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"192.168.1.14\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2023-12-15 17:24:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-15 17:24:03', 1035);
INSERT INTO `sys_oper_log` VALUES (6852, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"192.168.1.13\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"0\",\"updateTime\":\"2023-12-15 17:24:08\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-15 17:24:08', 114);
INSERT INTO `sys_oper_log` VALUES (6853, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"t_heap\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-18 16:25:18', 91);
INSERT INTO `sys_oper_log` VALUES (6854, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_heap\"}', NULL, 0, NULL, '2023-12-18 16:25:24', 163);
INSERT INTO `sys_oper_log` VALUES (6855, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":12,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:47:19', 18);
INSERT INTO `sys_oper_log` VALUES (6856, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"alarm/index\",\"createTime\":\"2023-09-12 15:29:31\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"设备报警\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"alarm\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:47:40', 17);
INSERT INTO `sys_oper_log` VALUES (6857, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-12-19 14:47:48', 6);
INSERT INTO `sys_oper_log` VALUES (6858, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"index\",\"createTime\":\"2023-09-12 17:17:17\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"报警中心\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"11\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:48:08', 19);
INSERT INTO `sys_oper_log` VALUES (6859, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-12-19 14:48:12', 4);
INSERT INTO `sys_oper_log` VALUES (6860, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2000', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-12-19 14:48:23', 2);
INSERT INTO `sys_oper_log` VALUES (6861, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"index\",\"createTime\":\"2023-09-12 17:17:17\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"报警中心\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"11\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:48:30', 8);
INSERT INTO `sys_oper_log` VALUES (6862, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-12-19 14:48:33', 5);
INSERT INTO `sys_oper_log` VALUES (6863, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"index\",\"createTime\":\"2023-09-12 17:17:17\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"报警中心\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"11\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:48:37', 17);
INSERT INTO `sys_oper_log` VALUES (6864, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-12-19 14:48:40', 4);
INSERT INTO `sys_oper_log` VALUES (6865, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"index\",\"createTime\":\"2023-09-12 17:17:17\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"报警中心\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"11\",\"perms\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:48:51', 17);
INSERT INTO `sys_oper_log` VALUES (6866, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-12-19 14:48:53', 4);
INSERT INTO `sys_oper_log` VALUES (6867, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"alarm/index\",\"createTime\":\"2023-09-12 15:29:31\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"设备报警\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"111\",\"perms\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:49:05', 19);
INSERT INTO `sys_oper_log` VALUES (6868, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2000', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-12-19 14:49:07', 3);
INSERT INTO `sys_oper_log` VALUES (6869, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-12-19 14:49:11', 3);
INSERT INTO `sys_oper_log` VALUES (6870, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"index\",\"createTime\":\"2023-09-12 17:17:17\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"1\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"11\",\"perms\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:49:26', 16);
INSERT INTO `sys_oper_log` VALUES (6871, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-12-19 14:49:29', 4);
INSERT INTO `sys_oper_log` VALUES (6872, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"index\",\"createTime\":\"2023-09-12 17:17:17\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"1\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"11\",\"perms\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:49:39', 10);
INSERT INTO `sys_oper_log` VALUES (6873, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-12-19 14:49:42', 5);
INSERT INTO `sys_oper_log` VALUES (6874, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-12-19 14:49:54', 3);
INSERT INTO `sys_oper_log` VALUES (6875, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2000', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-12-19 14:50:10', 4);
INSERT INTO `sys_oper_log` VALUES (6876, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:50:16', 23);
INSERT INTO `sys_oper_log` VALUES (6877, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"湖北宇宿新能源科技有限公司\",\"email\":\"YS@qq.com\",\"leader\":\"YS\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:51:15', 14);
INSERT INTO `sys_oper_log` VALUES (6878, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/101', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2023-12-19 14:51:22', 3);
INSERT INTO `sys_oper_log` VALUES (6879, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2023-12-19 14:51:24', 2);
INSERT INTO `sys_oper_log` VALUES (6880, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/108', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:51:27', 19);
INSERT INTO `sys_oper_log` VALUES (6881, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:51:30', 18);
INSERT INTO `sys_oper_log` VALUES (6882, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-12-19 14:51:32', 4);
INSERT INTO `sys_oper_log` VALUES (6883, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:51:34', 10);
INSERT INTO `sys_oper_log` VALUES (6884, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:51:36', 12);
INSERT INTO `sys_oper_log` VALUES (6885, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/106', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:51:37', 18);
INSERT INTO `sys_oper_log` VALUES (6886, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:51:40', 11);
INSERT INTO `sys_oper_log` VALUES (6887, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:51:46', 8);
INSERT INTO `sys_oper_log` VALUES (6888, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"研发部门\",\"email\":\"ry@qq.com\",\"leader\":\"YS\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"湖北宇宿新能源科技有限公司\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:52:11', 38);
INSERT INTO `sys_oper_log` VALUES (6889, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-08-30 06:46:56\",\"flag\":false,\"params\":{},\"postCode\":\"EE\",\"postId\":1,\"postName\":\"工程师\",\"postSort\":1,\"remark\":\"工程师\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:54:39', 21);
INSERT INTO `sys_oper_log` VALUES (6890, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', NULL, '/system/post/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:54:41', 22);
INSERT INTO `sys_oper_log` VALUES (6891, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', NULL, '/system/post/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:54:44', 18);
INSERT INTO `sys_oper_log` VALUES (6892, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-08-30 06:46:56\",\"flag\":false,\"params\":{},\"postCode\":\"OP\",\"postId\":2,\"postName\":\"操作员\",\"postSort\":2,\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:55:30', 17);
INSERT INTO `sys_oper_log` VALUES (6893, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"通知公告\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":1,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:56:04', 8);
INSERT INTO `sys_oper_log` VALUES (6894, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:56:15', 10);
INSERT INTO `sys_oper_log` VALUES (6895, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:56:21', 16);
INSERT INTO `sys_oper_log` VALUES (6896, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/druid/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":111,\"menuName\":\"数据监控\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2,\"path\":\"druid\",\"perms\":\"monitor:druid:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:57:24', 17);
INSERT INTO `sys_oper_log` VALUES (6897, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/server/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":112,\"menuName\":\"服务监控\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2,\"path\":\"server\",\"perms\":\"monitor:server:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:57:26', 7);
INSERT INTO `sys_oper_log` VALUES (6898, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/cache/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"redis\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":113,\"menuName\":\"缓存监控\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2,\"path\":\"cache\",\"perms\":\"monitor:cache:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:57:29', 8);
INSERT INTO `sys_oper_log` VALUES (6899, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/cache/list\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"redis-list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":114,\"menuName\":\"缓存列表\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2,\"path\":\"cacheList\",\"perms\":\"monitor:cache:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:57:32', 18);
INSERT INTO `sys_oper_log` VALUES (6900, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-12-19 14:58:12', 3);
INSERT INTO `sys_oper_log` VALUES (6901, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-09-12 17:17:17\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"1\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"11\",\"perms\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:58:26', 9);
INSERT INTO `sys_oper_log` VALUES (6902, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-12-19 14:58:28', 3);
INSERT INTO `sys_oper_log` VALUES (6903, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2002', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-12-19 14:58:56', 3);
INSERT INTO `sys_oper_log` VALUES (6904, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-20 10:47:47\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":100,\"roleKey\":\"YS\",\"roleName\":\"YS\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:59:13', 47);
INSERT INTO `sys_oper_log` VALUES (6905, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:59:18', 9);
INSERT INTO `sys_oper_log` VALUES (6906, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"infrared/index\",\"createTime\":\"2023-09-12 16:59:39\",\"icon\":\"chart\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"系统总览\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"infrared\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:59:51', 15);
INSERT INTO `sys_oper_log` VALUES (6907, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"heapInfo\",\"createTime\":\"2023-09-12 16:59:39\",\"icon\":\"chart\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"系统总览\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"heapInfo\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 15:00:33', 16);
INSERT INTO `sys_oper_log` VALUES (6908, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"cell\",\"createTime\":\"2023-09-16 11:39:30\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"单体电池\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"cell\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 15:01:20', 16);
INSERT INTO `sys_oper_log` VALUES (6909, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"controlStrategy\",\"createBy\":\"admin\",\"icon\":\"system\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuName\":\"控制策略\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"controlStrategy\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:13:31', 26);
INSERT INTO `sys_oper_log` VALUES (6910, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"historyCurve\",\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuName\":\"历史曲线\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"historyCurve\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:14:19', 20);
INSERT INTO `sys_oper_log` VALUES (6911, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"cell/index\",\"createTime\":\"2023-09-16 11:39:30\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"单体电池\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"cell\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:15:34', 17);
INSERT INTO `sys_oper_log` VALUES (6912, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"alarm/index\",\"createTime\":\"2023-09-12 15:29:31\",\"icon\":\"bug\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"设备报警\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"111\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:15:44', 23);
INSERT INTO `sys_oper_log` VALUES (6913, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"historyCurve/index\",\"createTime\":\"2023-12-20 09:14:19\",\"icon\":\"chart\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"历史曲线\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"historyCurve\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:15:52', 15);
INSERT INTO `sys_oper_log` VALUES (6914, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"controlStrategy/index\",\"createTime\":\"2023-12-20 09:13:31\",\"icon\":\"system\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"控制策略\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"controlStrategy\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:16:23', 22);
INSERT INTO `sys_oper_log` VALUES (6915, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"parameter/index\",\"createTime\":\"2023-09-12 16:58:20\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"告警参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"parameter\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:17:19', 23);
INSERT INTO `sys_oper_log` VALUES (6916, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"alarm/index\",\"createTime\":\"2023-09-12 15:29:31\",\"icon\":\"bug\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"设备报警\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"alarm\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:18:59', 23);
INSERT INTO `sys_oper_log` VALUES (6917, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"heapInfo\",\"createTime\":\"2023-09-12 16:59:39\",\"icon\":\"chart\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"系统总览\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"heapInfo\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:19:24', 17);
INSERT INTO `sys_oper_log` VALUES (6918, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"cell/index\",\"createTime\":\"2023-09-16 11:39:30\",\"icon\":\"tree-table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"单体电池\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"cell\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:19:32', 24);
INSERT INTO `sys_oper_log` VALUES (6919, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"alarm/index\",\"createTime\":\"2023-09-12 15:29:31\",\"icon\":\"bug\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"设备报警\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"alarm\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:19:42', 25);
INSERT INTO `sys_oper_log` VALUES (6920, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"controlStrategy/index\",\"createTime\":\"2023-12-20 09:13:31\",\"icon\":\"system\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"控制策略\",\"menuType\":\"C\",\"orderNum\":15,\"params\":{},\"parentId\":0,\"path\":\"controlStrategy\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:19:54', 17);
INSERT INTO `sys_oper_log` VALUES (6921, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"historyCurve/index\",\"createTime\":\"2023-12-20 09:14:19\",\"icon\":\"chart\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"历史曲线\",\"menuType\":\"C\",\"orderNum\":20,\"params\":{},\"parentId\":0,\"path\":\"historyCurve\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:20:04', 24);
INSERT INTO `sys_oper_log` VALUES (6922, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"environmental/index\",\"createBy\":\"admin\",\"icon\":\"monitor\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuName\":\"环境监测\",\"menuType\":\"C\",\"orderNum\":25,\"params\":{},\"parentId\":0,\"path\":\"environmental\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:21:30', 12);
INSERT INTO `sys_oper_log` VALUES (6923, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"parameter/index\",\"createTime\":\"2023-09-12 16:58:20\",\"icon\":\"system\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":30,\"params\":{},\"parentId\":0,\"path\":\"parameter\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:21:49', 16);
INSERT INTO `sys_oper_log` VALUES (6924, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"equipment/index\",\"createTime\":\"2023-09-12 17:40:10\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"设备管理\",\"menuType\":\"C\",\"orderNum\":35,\"params\":{},\"parentId\":0,\"path\":\"equipment\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:21:57', 27);
INSERT INTO `sys_oper_log` VALUES (6925, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":1000,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:22:10', 23);
INSERT INTO `sys_oper_log` VALUES (6926, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":100,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:22:24', 22);
INSERT INTO `sys_oper_log` VALUES (6927, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":200,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:22:35', 22);
INSERT INTO `sys_oper_log` VALUES (6928, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"alarm/index\",\"createTime\":\"2023-09-12 15:29:31\",\"icon\":\"bug\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"设备告警\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"alarm\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 09:43:55', 25);
INSERT INTO `sys_oper_log` VALUES (6929, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-20 10:47:47\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":100,\"roleKey\":\"YS\",\"roleName\":\"工程师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 11:09:58', 57);
INSERT INTO `sys_oper_log` VALUES (6930, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-20 10:47:47\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":100,\"roleKey\":\"工程师\",\"roleName\":\"工程师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 11:10:05', 28);
INSERT INTO `sys_oper_log` VALUES (6931, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":101,\"roleKey\":\"操作员\",\"roleName\":\"操作员\",\"roleSort\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 11:10:26', 19);
INSERT INTO `sys_oper_log` VALUES (6932, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"rizi\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"日志管理\",\"menuType\":\"C\",\"orderNum\":50,\"params\":{},\"parentId\":0,\"path\":\"rizi\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 11:11:25', 20);
INSERT INTO `sys_oper_log` VALUES (6933, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"rizi\",\"createTime\":\"2023-12-20 11:11:25\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"日志管理\",\"menuType\":\"M\",\"orderNum\":50,\"params\":{},\"parentId\":0,\"path\":\"rizi\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 11:11:42', 19);
INSERT INTO `sys_oper_log` VALUES (6934, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":108,\"menuName\":\"日志管理\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"log\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"修改菜单\'日志管理\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2023-12-20 11:12:29', 6);
INSERT INTO `sys_oper_log` VALUES (6935, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":108,\"menuName\":\"日志管理\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"log\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"修改菜单\'日志管理\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2023-12-20 11:12:32', 4);
INSERT INTO `sys_oper_log` VALUES (6936, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2011', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 11:12:41', 23);
INSERT INTO `sys_oper_log` VALUES (6937, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":108,\"menuName\":\"日志管理\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"log\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 11:12:50', 21);
INSERT INTO `sys_oper_log` VALUES (6938, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":108,\"menuName\":\"日志管理\",\"menuType\":\"M\",\"orderNum\":50,\"params\":{},\"parentId\":0,\"path\":\"log\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 11:13:03', 10);
INSERT INTO `sys_oper_log` VALUES (6939, '岗位管理', 5, 'com.ruoyi.web.controller.system.SysPostController.export()', 'POST', 1, 'admin', NULL, '/system/post/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-12-20 11:24:01', 991);
INSERT INTO `sys_oper_log` VALUES (6940, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"systemctl/monitor/operlog/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":500,\"menuName\":\"操作日志\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":108,\"path\":\"operlog\",\"perms\":\"monitor:operlog:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 15:09:41', 11);
INSERT INTO `sys_oper_log` VALUES (6941, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"systemctl/monitor/logininfor/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"logininfor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":501,\"menuName\":\"登录日志\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":108,\"path\":\"logininfor\",\"perms\":\"monitor:logininfor:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 15:09:50', 20);
INSERT INTO `sys_oper_log` VALUES (6942, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/monitor/operlog/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":500,\"menuName\":\"操作日志\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":108,\"path\":\"operlog\",\"perms\":\"monitor:operlog:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 15:11:17', 20);
INSERT INTO `sys_oper_log` VALUES (6943, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/monitor/logininfor/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"logininfor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":501,\"menuName\":\"登录日志\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":108,\"path\":\"logininfor\",\"perms\":\"monitor:logininfor:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 15:11:23', 20);
INSERT INTO `sys_oper_log` VALUES (6944, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/monitor/online/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"online\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":109,\"menuName\":\"在线用户\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2,\"path\":\"online\",\"perms\":\"monitor:online:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 15:11:54', 21);
INSERT INTO `sys_oper_log` VALUES (6945, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/monitor/job/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":110,\"menuName\":\"定时任务\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"job\",\"perms\":\"monitor:job:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 15:12:08', 12);
INSERT INTO `sys_oper_log` VALUES (6946, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', NULL, '/system/post/1', '127.0.0.1', '内网IP', '{}', NULL, 1, '工程师已分配,不能删除', '2023-12-20 15:17:28', 8);
INSERT INTO `sys_oper_log` VALUES (6947, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-12-20 15:17:55', 7);
INSERT INTO `sys_oper_log` VALUES (6948, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"/profile/avatar/2023/10/11/blob_20231011143123A001.png\",\"createBy\":\"admin\",\"createTime\":\"2023-09-20 10:46:37\",\"delFlag\":\"0\",\"email\":\"\",\"loginDate\":\"2023-12-19 11:13:55\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"root\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"工程师\",\"roleName\":\"工程师\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"root\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 15:18:07', 21);
INSERT INTO `sys_oper_log` VALUES (6949, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-12-20 15:18:18', 5);
INSERT INTO `sys_oper_log` VALUES (6950, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', NULL, '/system/post/1', '127.0.0.1', '内网IP', '{}', NULL, 1, '工程师已分配,不能删除', '2023-12-20 15:18:22', 5);
INSERT INTO `sys_oper_log` VALUES (6951, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', NULL, '/system/post/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 15:18:25', 24);
INSERT INTO `sys_oper_log` VALUES (6952, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-20 10:47:47\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":100,\"roleKey\":\"gcs\",\"roleName\":\"工程师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 15:19:55', 30);
INSERT INTO `sys_oper_log` VALUES (6953, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-12-20 11:10:26\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":101,\"roleKey\":\"czy\",\"roleName\":\"操作员\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 15:20:03', 28);
INSERT INTO `sys_oper_log` VALUES (6954, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"研发部门\",\"phone\":\"15888888888\",\"status\":\"0\"}', '{\"msg\":\"修改部门\'研发部门\'失败，部门名称已存在\",\"code\":500}', 0, NULL, '2023-12-20 15:20:21', 5);
INSERT INTO `sys_oper_log` VALUES (6955, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-12-20 15:20:36', 6);
INSERT INTO `sys_oper_log` VALUES (6956, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2023-12-20 15:22:45', 5);
INSERT INTO `sys_oper_log` VALUES (6957, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', NULL, '/system/post/1', '127.0.0.1', '内网IP', '{}', NULL, 1, '工程师已分配,不能删除', '2023-12-20 15:23:54', 7);
INSERT INTO `sys_oper_log` VALUES (6958, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-08-30 06:46:56\",\"flag\":false,\"params\":{},\"postCode\":\"EE\",\"postId\":1,\"postName\":\"111\",\"postSort\":1,\"remark\":\"工程师\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 15:24:02', 25);
INSERT INTO `sys_oper_log` VALUES (6959, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 15:27:04', 11);
INSERT INTO `sys_oper_log` VALUES (6960, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 15:27:10', 35);
INSERT INTO `sys_oper_log` VALUES (6961, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"/profile/avatar/2023/09/22/blob_20230922153031A001.png\",\"createBy\":\"admin\",\"createTime\":\"2023-08-30 06:46:56\",\"delFlag\":\"0\",\"dept\":{\"children\":[],\"deptId\":103,\"params\":{}},\"deptId\":103,\"email\":\"\",\"loginDate\":\"2023-12-20 14:55:04\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"YS\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"remark\":\"管理员\",\"roleIds\":[1],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', NULL, 1, '不允许操作超级管理员用户', '2023-12-20 15:30:31', 0);
INSERT INTO `sys_oper_log` VALUES (6962, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"/profile/avatar/2023/09/22/blob_20230922153031A001.png\",\"createBy\":\"admin\",\"createTime\":\"2023-08-30 06:46:56\",\"delFlag\":\"0\",\"dept\":{\"children\":[],\"deptId\":103,\"params\":{}},\"deptId\":103,\"email\":\"\",\"loginDate\":\"2023-12-20 14:55:04\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"YS\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"remark\":\"管理员\",\"roleIds\":[1],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', NULL, 1, '不允许操作超级管理员用户', '2023-12-20 15:30:33', 0);
INSERT INTO `sys_oper_log` VALUES (6963, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"\",\"userId\":\"100\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 15:37:22', 6);
INSERT INTO `sys_oper_log` VALUES (6964, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"\",\"userId\":\"100\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 15:37:25', 5);
INSERT INTO `sys_oper_log` VALUES (6965, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"工程师\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":101,\"userName\":\"gcs\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:11:15', 114);
INSERT INTO `sys_oper_log` VALUES (6966, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"操作员\",\"params\":{},\"postIds\":[],\"roleIds\":[],\"status\":\"0\",\"userId\":102,\"userName\":\"csz\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:11:36', 109);
INSERT INTO `sys_oper_log` VALUES (6967, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-20 10:47:47\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2002,2007,2000,2008,2009,2010,2001,2006,108,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"roleId\":100,\"roleKey\":\"gcs\",\"roleName\":\"工程师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:12:54', 21);
INSERT INTO `sys_oper_log` VALUES (6968, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-12-20 11:10:26\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2002,2007,2000,2008,2009,2010,2001,2006,108,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"roleId\":101,\"roleKey\":\"czy\",\"roleName\":\"操作员\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:15:17', 26);
INSERT INTO `sys_oper_log` VALUES (6969, '角色管理', 4, 'com.ruoyi.web.controller.system.SysRoleController.selectAuthUserAll()', 'PUT', 1, 'admin', NULL, '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":\"100\",\"userIds\":\"101\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:16:15', 13);
INSERT INTO `sys_oper_log` VALUES (6970, '角色管理', 4, 'com.ruoyi.web.controller.system.SysRoleController.selectAuthUserAll()', 'PUT', 1, 'admin', NULL, '/system/role/authUser/selectAll', '127.0.0.1', '内网IP', '{\"roleId\":\"101\",\"userIds\":\"102\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:16:30', 15);
INSERT INTO `sys_oper_log` VALUES (6971, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"equipment/index\",\"createTime\":\"2023-09-12 17:40:10\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"设备管理\",\"menuType\":\"F\",\"orderNum\":35,\"params\":{},\"parentId\":0,\"path\":\"equipment\",\"perms\":\"heap:heap:update\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:18:26', 18);
INSERT INTO `sys_oper_log` VALUES (6972, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"equipment/index\",\"createTime\":\"2023-09-12 17:40:10\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"设备管理\",\"menuType\":\"F\",\"orderNum\":35,\"params\":{},\"parentId\":0,\"path\":\"equipment\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:20:02', 19);
INSERT INTO `sys_oper_log` VALUES (6973, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改设备信息\",\"menuType\":\"F\",\"orderNum\":0,\"params\":{},\"parentId\":2006,\"perms\":\"heap:heap:update\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:20:28', 17);
INSERT INTO `sys_oper_log` VALUES (6978, '操作日志', 3, 'com.ruoyi.web.controller.system.monitor.SysOperlogController.remove()', 'DELETE', 1, 'gcs', NULL, '/monitor/operlog/6974', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:36:13', 27);
INSERT INTO `sys_oper_log` VALUES (6979, '操作日志', 3, 'com.ruoyi.web.controller.system.monitor.SysOperlogController.remove()', 'DELETE', 1, 'gcs', NULL, '/monitor/operlog/6976', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:36:26', 17);
INSERT INTO `sys_oper_log` VALUES (6980, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-20 10:47:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"gcs\",\"roleName\":\"工程师\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:36:43', 34);
INSERT INTO `sys_oper_log` VALUES (6981, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-12-20 11:10:26\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":101,\"roleKey\":\"czy\",\"roleName\":\"操作员\",\"roleSort\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:36:50', 22);
INSERT INTO `sys_oper_log` VALUES (6982, '操作日志', 3, 'com.ruoyi.web.controller.system.monitor.SysOperlogController.remove()', 'DELETE', 1, 'gcs', NULL, '/monitor/operlog/6977', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:36:58', 16);
INSERT INTO `sys_oper_log` VALUES (6983, '操作日志', 3, 'com.ruoyi.web.controller.system.monitor.SysOperlogController.remove()', 'DELETE', 1, 'gcs', NULL, '/monitor/operlog/6975', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:37:02', 17);
INSERT INTO `sys_oper_log` VALUES (6984, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-20 10:47:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[108,500,2002,2007,2000,2008,2009,2010,2001,2006,1039],\"params\":{},\"roleId\":100,\"roleKey\":\"gcs\",\"roleName\":\"工程师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:37:38', 24);
INSERT INTO `sys_oper_log` VALUES (6985, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-20 10:47:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2002,2007,2000,2008,2009,2010,2001,2006,108,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"roleId\":100,\"roleKey\":\"gcs\",\"roleName\":\"工程师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:38:23', 33);
INSERT INTO `sys_oper_log` VALUES (6986, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2012', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:38:59', 14);
INSERT INTO `sys_oper_log` VALUES (6987, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"equipment/index\",\"createTime\":\"2023-09-12 17:40:10\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"设备管理\",\"menuType\":\"F\",\"orderNum\":35,\"params\":{},\"parentId\":0,\"path\":\"equipment\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:39:09', 17);
INSERT INTO `sys_oper_log` VALUES (6988, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-20 10:47:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2002,2007,2000,2008,2009,2006,108,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"roleId\":100,\"roleKey\":\"gcs\",\"roleName\":\"工程师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:40:18', 30);
INSERT INTO `sys_oper_log` VALUES (6989, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-20 10:47:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2002,2007,2000,2008,2009,2010,2001,2006,108,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"roleId\":100,\"roleKey\":\"gcs\",\"roleName\":\"工程师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:40:32', 23);
INSERT INTO `sys_oper_log` VALUES (6990, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-12-20 11:10:26\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2002,2007,2000,2008,2009,2010,2001,2006],\"params\":{},\"roleId\":101,\"roleKey\":\"czy\",\"roleName\":\"操作员\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:40:37', 30);
INSERT INTO `sys_oper_log` VALUES (6991, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"equipment/index\",\"createTime\":\"2023-09-12 17:40:10\",\"icon\":\"tool\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"设备管理\",\"menuType\":\"C\",\"orderNum\":35,\"params\":{},\"parentId\":0,\"path\":\"equipment\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:47:20', 14);
INSERT INTO `sys_oper_log` VALUES (6992, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改设备参数\",\"menuType\":\"F\",\"orderNum\":0,\"params\":{},\"parentId\":2006,\"perms\":\"heap:heap:update\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:48:20', 18);
INSERT INTO `sys_oper_log` VALUES (6993, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-20 10:47:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2002,2007,2000,2008,2009,2010,2001,2006,2013,108,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"roleId\":100,\"roleKey\":\"gcs\",\"roleName\":\"工程师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:54:32', 72);
INSERT INTO `sys_oper_log` VALUES (6994, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-12-20 11:10:26\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2002,2007,2000,2008,2009,2010,2001,2006],\"params\":{},\"roleId\":101,\"roleKey\":\"czy\",\"roleName\":\"操作员\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:54:39', 35);
INSERT INTO `sys_oper_log` VALUES (6995, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改告警参数\",\"menuType\":\"F\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"perms\":\"alarm:alarm:update\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:55:23', 25);
INSERT INTO `sys_oper_log` VALUES (6996, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-12-20 16:55:23\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"修改告警参数\",\"menuType\":\"F\",\"orderNum\":0,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"parameter:parameter:update\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 16:56:07', 24);
INSERT INTO `sys_oper_log` VALUES (6997, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-20 10:47:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2002,2007,2000,2008,2009,2010,2001,2006,2013,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114],\"params\":{},\"roleId\":100,\"roleKey\":\"gcs\",\"roleName\":\"工程师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 17:25:08', 30);
INSERT INTO `sys_oper_log` VALUES (6998, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-20 10:47:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2002,2007,2000,2008,2009,2010,2001,2006,2013,108,500,1039,1040,1041,501,1042,1043,1044,1045,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":100,\"roleKey\":\"gcs\",\"roleName\":\"工程师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-20 17:25:53', 31);
INSERT INTO `sys_oper_log` VALUES (6999, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/100', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-22 10:07:14', 81);
INSERT INTO `sys_oper_log` VALUES (7000, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-22 14:20:31', 43);
INSERT INTO `sys_oper_log` VALUES (7001, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"操作员001\",\"params\":{},\"postIds\":[],\"roleIds\":[101],\"status\":\"0\",\"userId\":103,\"userName\":\"csy\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-22 14:21:04', 90);
INSERT INTO `sys_oper_log` VALUES (7002, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"101\",\"userId\":\"103\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-22 14:21:15', 18);
INSERT INTO `sys_oper_log` VALUES (7003, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"101\",\"userId\":\"103\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-22 14:21:18', 17);
INSERT INTO `sys_oper_log` VALUES (7004, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"101\",\"userId\":\"103\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-22 14:22:05', 17);
INSERT INTO `sys_oper_log` VALUES (7005, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"192.168.1.13\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"0\",\"updateTime\":\"2023-12-28 11:50:50\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 11:50:51', 36);
INSERT INTO `sys_oper_log` VALUES (7006, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'admin', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"134.175.61.30\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"0\",\"updateTime\":\"2023-12-28 15:55:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-28 15:55:44', 940);
INSERT INTO `sys_oper_log` VALUES (7007, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/01/08/blob_20240108102434A001.png\",\"code\":200}', 0, NULL, '2024-01-08 10:24:34', 62);
INSERT INTO `sys_oper_log` VALUES (7008, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/01/08/blob_20240108151410A002.png\",\"code\":200}', 0, NULL, '2024-01-08 15:14:10', 15);
INSERT INTO `sys_oper_log` VALUES (7009, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/01/08/blob_20240108152350A003.png\",\"code\":200}', 0, NULL, '2024-01-08 15:23:50', 8);
INSERT INTO `sys_oper_log` VALUES (7010, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/01/08/blob_20240108152853A004.png\",\"code\":200}', 0, NULL, '2024-01-08 15:28:53', 10);
INSERT INTO `sys_oper_log` VALUES (7011, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/01/08/blob_20240108153004A005.png\",\"code\":200}', 0, NULL, '2024-01-08 15:30:04', 9);
INSERT INTO `sys_oper_log` VALUES (7012, '定时任务', 5, 'com.ruoyi.quartz.controller.SysJobController.export()', 'POST', 1, 'admin', NULL, '/monitor/job/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-01-08 15:47:56', 632);
INSERT INTO `sys_oper_log` VALUES (7013, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 16:26:55', 13);
INSERT INTO `sys_oper_log` VALUES (7014, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 16:27:05', 17);
INSERT INTO `sys_oper_log` VALUES (7015, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 16:27:09', 17);
INSERT INTO `sys_oper_log` VALUES (7016, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 16:27:47', 19);
INSERT INTO `sys_oper_log` VALUES (7017, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-20 10:47:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2002,2007,2000,2008,2009,2010,2001,2014,2006,2013,108,500,1039,1040,1041,501,1042,1043,1044,1045,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleId\":100,\"roleKey\":\"gcs\",\"roleName\":\"工程师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 16:30:13', 42);
INSERT INTO `sys_oper_log` VALUES (7018, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 16:52:37', 8);
INSERT INTO `sys_oper_log` VALUES (7019, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 16:52:42', 9);
INSERT INTO `sys_oper_log` VALUES (7020, '角色管理', 4, 'com.ruoyi.web.controller.system.SysRoleController.cancelAuthUser()', 'PUT', 1, 'admin', NULL, '/system/role/authUser/cancel', '127.0.0.1', '内网IP', '{\"roleId\":100,\"userId\":101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 16:53:12', 19);
INSERT INTO `sys_oper_log` VALUES (7021, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"100\",\"userId\":\"101\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 16:53:29', 16);
INSERT INTO `sys_oper_log` VALUES (7022, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-20 10:47:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,2002,2007,2000,2008,2009,2010,2001,2014,2006,2013,108,500,1039,1040,1041,501,1042,1043,1044,1045,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054],\"params\":{},\"roleId\":100,\"roleKey\":\"gcs\",\"roleName\":\"工程师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 16:55:13', 16);
INSERT INTO `sys_oper_log` VALUES (7023, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-12-20 11:10:26\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2002,2007,2000,2008,2009,2010,2001,2014,2006,2013],\"params\":{},\"roleId\":101,\"roleKey\":\"czy\",\"roleName\":\"操作员\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 16:56:38', 24);
INSERT INTO `sys_oper_log` VALUES (7024, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"部门管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 17:03:50', 9);
INSERT INTO `sys_oper_log` VALUES (7025, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 17:03:58', 9);
INSERT INTO `sys_oper_log` VALUES (7026, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 17:04:03', 7);
INSERT INTO `sys_oper_log` VALUES (7027, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"100\",\"userId\":\"101\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 17:08:40', 8);
INSERT INTO `sys_oper_log` VALUES (7028, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"100\",\"userId\":\"101\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 17:09:33', 9);
INSERT INTO `sys_oper_log` VALUES (7029, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"100,101\",\"userId\":\"101\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 17:09:41', 8);
INSERT INTO `sys_oper_log` VALUES (7030, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"100\",\"userId\":\"101\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-08 17:09:46', 7);
INSERT INTO `sys_oper_log` VALUES (7031, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询设备参数\",\"menuType\":\"F\",\"orderNum\":0,\"params\":{},\"parentId\":2006,\"perms\":\"heap:heap:select\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-09 09:46:17', 20);
INSERT INTO `sys_oper_log` VALUES (7032, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-12-20 16:48:20\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"修改设备参数\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"\",\"perms\":\"heap:heap:update\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-09 09:46:23', 32);
INSERT INTO `sys_oper_log` VALUES (7033, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-09 09:46:17\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"查询设备参数\",\"menuType\":\"F\",\"orderNum\":0,\"params\":{},\"parentId\":2006,\"path\":\"\",\"perms\":\"heap:heap:query\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-09 09:46:54', 13);
INSERT INTO `sys_oper_log` VALUES (7034, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-09-20 10:47:47\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,2002,2007,2000,2008,2009,2010,2001,2014,2006,2015,2013,108,500,1039,1040,1041,501,1042,1043,1044,1045,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054],\"params\":{},\"roleId\":100,\"roleKey\":\"gcs\",\"roleName\":\"工程师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-09 09:48:23', 37);
INSERT INTO `sys_oper_log` VALUES (7035, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'czy', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":2,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"134.175.61.30\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2024-01-09 10:25:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-09 10:25:56', 621);
INSERT INTO `sys_oper_log` VALUES (7036, '更新Heap设备信息', 2, 'com.ruoyi.ems.HeapController.update()', 'POST', 1, 'czy', NULL, '/heap/data/update', '127.0.0.1', '内网IP', '{\"alarmOpen\":\"1\",\"batteryCapacity\":20,\"batteryCount\":1,\"batteryRange\":50,\"batteryType\":12,\"createBy\":\"xj\",\"createTime\":\"2023-09-15 10:55:38\",\"heapId\":1,\"heapStatus\":\"3\",\"location\":\"134.175.61.30\",\"params\":{},\"port\":502,\"slaveAddress\":1,\"status\":\"1\",\"updateTime\":\"2024-01-09 10:26:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-09 10:26:04', 906);
INSERT INTO `sys_oper_log` VALUES (7037, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-12-20 11:10:26\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2002,2007,2000,2008,2009,2010,2001,2014],\"params\":{},\"roleId\":101,\"roleKey\":\"czy\",\"roleName\":\"操作员\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-09 10:27:34', 34);
INSERT INTO `sys_oper_log` VALUES (7038, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-12-20 11:10:26\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2006,2002,2007,2000,2008,2009,2010,2001,2014,2015],\"params\":{},\"roleId\":101,\"roleKey\":\"czy\",\"roleName\":\"操作员\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-09 10:27:54', 31);
INSERT INTO `sys_oper_log` VALUES (7039, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-12-20 16:55:23\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"修改告警参数\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"parameter:parameter:update\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-09 10:28:52', 15);
INSERT INTO `sys_oper_log` VALUES (7040, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"createBy\":\"admin\",\"createTime\":\"2023-08-30 06:46:56\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"YS@163.com\",\"loginDate\":\"2024-01-12 10:26:07\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"超级管理员\",\"params\":{},\"phonenumber\":\"13588888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-12 14:58:00', 30);
INSERT INTO `sys_oper_log` VALUES (7041, '告警数据导出', 5, 'com.ruoyi.ems.AlarmMessageController.export()', 'POST', 1, 'admin', NULL, '/alarm/msg/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-01-12 15:41:27', 1181);
INSERT INTO `sys_oper_log` VALUES (7042, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'gcs', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/monitor/logininfor/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"logininfor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":501,\"menuName\":\"登录日志\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":108,\"path\":\"logininfor\",\"perms\":\"monitor:logininfor:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"gcs\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-15 09:59:56', 26);
INSERT INTO `sys_oper_log` VALUES (7043, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'gcs', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/monitor/operlog/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"form\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":500,\"menuName\":\"操作日志\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":108,\"path\":\"operlog\",\"perms\":\"monitor:operlog:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"gcs\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-15 10:00:02', 18);
INSERT INTO `sys_oper_log` VALUES (7044, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'gcs', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/monitor/job/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":110,\"menuName\":\"定时任务\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"job\",\"perms\":\"monitor:job:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"gcs\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-15 10:02:59', 9);
INSERT INTO `sys_oper_log` VALUES (7045, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'gcs', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/monitor/job/index\",\"createTime\":\"2023-08-30 06:46:56\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":110,\"menuName\":\"定时任务\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"job\",\"perms\":\"monitor:job:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"gcs\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-15 10:03:34', 18);
INSERT INTO `sys_oper_log` VALUES (7046, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'czy', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"1110\",\"info\":\"组端电压一般上限告警\"}', '{\"msg\":\"修改报警参数失败,BMU设备离线!\",\"code\":500}', 0, NULL, '2024-01-15 10:04:29', 2);
INSERT INTO `sys_oper_log` VALUES (7047, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'czy', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"1110\",\"info\":\"组端电压一般上限告警\"}', '{\"msg\":\"修改报警参数失败,BMU设备离线!\",\"code\":500}', 0, NULL, '2024-01-15 10:04:29', 0);
INSERT INTO `sys_oper_log` VALUES (7048, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'czy', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"1110\",\"info\":\"组端电压一般上限告警\"}', '{\"msg\":\"修改报警参数失败,BMU设备离线!\",\"code\":500}', 0, NULL, '2024-01-15 10:04:30', 1);
INSERT INTO `sys_oper_log` VALUES (7049, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'czy', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"1110\",\"info\":\"组端电压一般上限告警\"}', '{\"msg\":\"修改报警参数失败,BMU设备离线!\",\"code\":500}', 0, NULL, '2024-01-15 10:04:30', 0);
INSERT INTO `sys_oper_log` VALUES (7050, '修改单个的Heap告警参数信息', 2, 'com.ruoyi.ems.AlarmParameterController.updateAlarmParameterByItem()', 'GET', 1, 'czy', NULL, '/alarm/parameter/updateByItem/', '127.0.0.1', '内网IP', '{\"value\":\"1110\",\"info\":\"组端电压一般上限告警\"}', '{\"msg\":\"修改报警参数失败,BMU设备离线!\",\"code\":500}', 0, NULL, '2024-01-15 10:04:30', 1);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-08-30 06:46:56', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 0, 0, '1', '2', 'admin', '2023-08-30 06:46:56', 'admin', '2023-09-20 10:50:00', '普通角色');
INSERT INTO `sys_role` VALUES (100, '工程师', 'gcs', 3, '2', 1, 1, '0', '0', 'admin', '2023-09-20 10:47:47', 'admin', '2024-01-09 09:48:23', NULL);
INSERT INTO `sys_role` VALUES (101, '操作员', 'czy', 4, '2', 1, 1, '0', '0', 'admin', '2023-12-20 11:10:26', 'admin', '2024-01-09 10:27:54', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 101);
INSERT INTO `sys_role_menu` VALUES (100, 102);
INSERT INTO `sys_role_menu` VALUES (100, 108);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 110);
INSERT INTO `sys_role_menu` VALUES (100, 500);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1000);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1007);
INSERT INTO `sys_role_menu` VALUES (100, 1008);
INSERT INTO `sys_role_menu` VALUES (100, 1009);
INSERT INTO `sys_role_menu` VALUES (100, 1010);
INSERT INTO `sys_role_menu` VALUES (100, 1011);
INSERT INTO `sys_role_menu` VALUES (100, 1012);
INSERT INTO `sys_role_menu` VALUES (100, 1013);
INSERT INTO `sys_role_menu` VALUES (100, 1014);
INSERT INTO `sys_role_menu` VALUES (100, 1015);
INSERT INTO `sys_role_menu` VALUES (100, 1039);
INSERT INTO `sys_role_menu` VALUES (100, 1040);
INSERT INTO `sys_role_menu` VALUES (100, 1041);
INSERT INTO `sys_role_menu` VALUES (100, 1042);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
INSERT INTO `sys_role_menu` VALUES (100, 1044);
INSERT INTO `sys_role_menu` VALUES (100, 1045);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 1049);
INSERT INTO `sys_role_menu` VALUES (100, 1050);
INSERT INTO `sys_role_menu` VALUES (100, 1051);
INSERT INTO `sys_role_menu` VALUES (100, 1052);
INSERT INTO `sys_role_menu` VALUES (100, 1053);
INSERT INTO `sys_role_menu` VALUES (100, 1054);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (101, 2000);
INSERT INTO `sys_role_menu` VALUES (101, 2001);
INSERT INTO `sys_role_menu` VALUES (101, 2002);
INSERT INTO `sys_role_menu` VALUES (101, 2006);
INSERT INTO `sys_role_menu` VALUES (101, 2007);
INSERT INTO `sys_role_menu` VALUES (101, 2008);
INSERT INTO `sys_role_menu` VALUES (101, 2009);
INSERT INTO `sys_role_menu` VALUES (101, 2010);
INSERT INTO `sys_role_menu` VALUES (101, 2014);
INSERT INTO `sys_role_menu` VALUES (101, 2015);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '超级管理员', '00', 'YS@163.com', '13588888888', '0', '/profile/avatar/2024/01/08/blob_20240108153004A005.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-01-18 17:26:31', 'admin', '2023-08-30 06:46:56', '', '2024-01-18 17:26:30', '管理员');
INSERT INTO `sys_user` VALUES (101, 103, 'gcs', '工程师', '00', '', '', '0', '', '$2a$10$o7wniTYUKKRMajkT5TurTuSwsfVMhS4dIfNScT26JEvM6aLG1dMai', '0', '0', '127.0.0.1', '2024-01-15 12:26:46', 'admin', '2023-12-20 16:11:15', '', '2024-01-15 12:26:45', NULL);
INSERT INTO `sys_user` VALUES (103, 103, 'czy', '操作员', '00', '', '', '0', '', '$2a$10$tccP0FTb7j/PqhkRVXzbf.gUYYrh685UtkwpzZhqHwSfDRMQ7vzZW', '0', '0', '127.0.0.1', '2024-01-15 12:26:33', 'admin', '2023-12-22 14:21:04', '', '2024-01-15 12:26:33', NULL);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(0) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('01b7a85f-9c73-4095-b1e1-4c3f63157d66', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', 'on_line', '2023-03-01 15:30:14', '2023-03-01 15:43:41', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (101, 100);
INSERT INTO `sys_user_role` VALUES (103, 101);

SET FOREIGN_KEY_CHECKS = 1;
