grant all privileges on *.* to ###PROJ_NAME###_w@"%";
grant all privileges on *.* to ###PROJ_NAME###_w@"localhost";
grant select         on *.* to ###PROJ_NAME###_r@"%";
grant select         on *.* to ###PROJ_NAME###_r@"localhost";

#---------------------------------------------------------------------
# user db

drop   database if exists ###PROJ_NAME###_user;
create database           ###PROJ_NAME###_user;
use                       ###PROJ_NAME###_user;

create table user_data (
  user_id       int         unsigned not null, # �桼��ID
  reg_date      int         unsigned not null, # ��Ͽ����
  user_st       tinyint              not null, # �桼�����ơ�����
  serv_st       tinyint              not null, # �����ӥ����ơ�����
  
  carrier       char(1)              not null, # ����ꥢ ( D | A | V )
  model_name    varchar(20)          not null, # ���ߤε���̾
  subscr_id     varchar(40)                  , # ���֥����饤��ID
  serial_id     varchar(30)                  , # SIM������ / ü��ID
  
  nickname      varchar(16)          not null, # �˥å��͡���
  sex_type      char(1)              not null, # M | F
  birthday      date                 not null, # ��ǯ����
  intro         text                 not null, # ���ʾҲ�
  blood_type    varchar(2)           not null, # A | B | O | AB
  show_birth    tinyint              not null, # �������򸫤���
  show_age      tinyint              not null  # ǯ���ߤ���

) type=InnoDB;

alter table user_data
 add primary key     (user_id),
 add unique index i1 (subscr_id),
 add unique index i2 (serial_id),
 add unique index i3 (nickname);

#---------------------------------------------------------------------
# sequence db

drop   database if exists ###PROJ_NAME###_seq;
create database           ###PROJ_NAME###_seq;
use                       ###PROJ_NAME###_seq;

create table seq_user (id int unsigned not null) type=MyISAM;
insert into  seq_user values (10000);

create table seq_diary (id int unsigned not null) type=MyISAM;
insert into  seq_diary values (10000);

create table seq_comment (id int unsigned not null) type=MyISAM;
insert into  seq_comment values (10000);

#---------------------------------------------------------------------
# diary db

drop   database if exists ###PROJ_NAME###_diary;
create database           ###PROJ_NAME###_diary;
use                       ###PROJ_NAME###_diary;

create table diary_data (
diary_id    int unsigned not null, # ����ID
user_id     int unsigned not null, # �桼��ID
post_date   int unsigned not null, # ��������
subject     varchar(100) not null, # �����ȥ�
content     text         not null, # ����
comment_num smallint     not null, # �����ȿ�
access_num  int unsigned not null, # ����������
last_user   int unsigned not null  # �ǽ����������桼��
);
alter table diary_data
  add primary key (diary_id),
  add index i1 (user_id, post_date),
  add index i2 (post_date),
  add index i3 (comment_num),
  add index i4 (access_num);

create table diary_comment (
comment_id int unsigned not null, # ������ID
diary_id   int unsigned not null, # ����ID
diary_user int unsigned not null, # �����桼��ID
post_date  int unsigned not null, # ����������
user_id    int unsigned not null, # �����ȼ�ID
content    text         not null  # ����������
);
alter table diary_comment
  add primary key (comment_id),
  add index i1 (diary_id,   post_date),
  add index i2 (diary_user, post_date),
  add index i3 (user_id,    post_date);

