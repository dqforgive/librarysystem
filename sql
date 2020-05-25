CREATE SCHEMA `book_manage` ;           #创建数据库
use book_manage;  
set autocommit=0;  
  
create table `manager`                 #创建管理员表
(  
`username` varchar(20),              #用户名
`password` varchar(20) not null,     #密码  不为空
primary key(`username`)              #主键用户名
);  
  
create table `user`                   #创建用户表
(  
`username` varchar(20) not null,      #学号 不为空
`password` varchar(20) not null,      #密码 不为空
primary key (`username`)              #主键 学号
);  
  
create table `book`                  #创建图书表
(  
`book_id` char(5),                    #图书编号
`name` varchar(20) not null,          #图书名 不为空
`price` float(9,2) unsigned,          #价格 无符号类型
`number` int unsigned not null,       #数量 整形无符号   不为空
`storage_date` date,                  #入库时间   日期类型
`manage_name` char(20),               #上传者
`publisher` varchar(15) not null,     #出版社  不为空
`publish_year` year,                  #出版年份
`type` varchar(10) not null,          #种类 不为空
primary key(`book_id`),               #主键 图书编号
foreign key(`manage_name`) references `manager`(`username`)  #外键  管理员用户名 上传者
);  
  
create table `book_author`  #创建图书作者表
(  
`book_id` char(5),            #图书编号
`author_name` varchar(20),    #作者
primary key(`author_name`,`book_id`),     #主键  作者 图书编号
foreign key(`book_id`) references `book`(`book_id`) on delete cascade on update cascade          #外键约束  在父表上update/delete记录时，同步update/delete子表的匹配记录   
);  
  
create table `loan`    #创建借书表
(  
`username` char(20),   #学号
`book_id` char(5),     #图书编号
`loan_date` date,      #出借日期
`loan_number` int unsigned,    #出借数量
primary key(`username`,`book_id`,`loan_number`),    #主键 学号 图书编号 出借数量
foreign key(`username`) references `user`(`username`),  #外键 学号 
foreign key(`book_id`) references `book`(`book_id`)     #外键 图书编号
);  
