prompt Creating PUB_USER...
create table PUB_USER
(
  id              VARCHAR2(36) not null,
  user_code       VARCHAR2(10),
  user_name       VARCHAR2(50),
  user_password   VARCHAR2(50),
  photo           VARCHAR2(2000),
  telephone       VARCHAR2(11),
  qq              VARCHAR2(15),
  wechat          VARCHAR2(15),
  e_mail          VARCHAR2(50),
  address         VARCHAR2(255),
  gender          CHAR(1),
  age             CHAR(3),
  islocked        CHAR(1),
  userrole        CHAR(1),
  changedate      CHAR(10),
  last_pwd_modify CHAR(19),
  tempvar1        VARCHAR2(255),
  tempvar2        VARCHAR2(255),
  tempvar3        VARCHAR2(255),
  tempvar4        VARCHAR2(255),
  tempvar5        VARCHAR2(255),
  tempvar6        VARCHAR2(255),
  tempvar7        VARCHAR2(255),
  tempvar8        VARCHAR2(255),
  tempvar9        VARCHAR2(255),
  tempvar10       VARCHAR2(255)
)
tablespace SSM_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PUB_USER.id
  is '用户ID';
comment on column PUB_USER.user_code
  is '账号';
comment on column PUB_USER.user_name
  is '姓名';
comment on column PUB_USER.user_password
  is '密码';
comment on column PUB_USER.photo
  is '头像';
comment on column PUB_USER.telephone
  is '电话';
comment on column PUB_USER.qq
  is 'QQ';
comment on column PUB_USER.wechat
  is '微信';
comment on column PUB_USER.e_mail
  is '邮箱';
comment on column PUB_USER.address
  is '地址';
comment on column PUB_USER.gender
  is '性别';
comment on column PUB_USER.age
  is '年龄';
comment on column PUB_USER.islocked
  is '是否锁定';
comment on column PUB_USER.userrole
  is '角色';
comment on column PUB_USER.changedate
  is '变更时间';
comment on column PUB_USER.last_pwd_modify
  is '上次改密时间';
alter table PUB_USER
  add constraint PRIMARYKEY primary key (ID)
  using index 
  tablespace SSM_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PUB_USER
  add constraint UNIQUE_USER_CODE unique (USER_CODE)
  using index 
  tablespace SSM_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating PUB_ONLINEUSER...
create table PUB_ONLINEUSER
(
  id         VARCHAR2(36) not null,
  user_id    VARCHAR2(36),
  login_time CHAR(19),
  login_ip   VARCHAR2(15),
  temp_var1  VARCHAR2(50),
  temp_var2  VARCHAR2(50),
  temp_var3  VARCHAR2(50),
  temp_var4  VARCHAR2(50),
  temp_var5  VARCHAR2(50)
)
tablespace SSM_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column PUB_ONLINEUSER.id
  is '主键';
comment on column PUB_ONLINEUSER.user_id
  is '用户ID';
comment on column PUB_ONLINEUSER.login_time
  is '登录时间';
comment on column PUB_ONLINEUSER.login_ip
  is '登录IP';
alter table PUB_ONLINEUSER
  add constraint PRIMARYKEY_ONLINEUSER primary key (ID)
  using index 
  tablespace SSM_DATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table PUB_ONLINEUSER
  add constraint FOREIGNKEY_ONLINEUSER foreign key (USER_ID)
  references PUB_USER (ID);
grant select, insert, update, delete, references, alter, index, debug on PUB_ONLINEUSER to SYSTEM;

prompt Disabling triggers for PUB_USER...
alter table PUB_USER disable all triggers;
prompt Disabling triggers for PUB_ONLINEUSER...
alter table PUB_ONLINEUSER disable all triggers;
prompt Disabling foreign key constraints for PUB_ONLINEUSER...
alter table PUB_ONLINEUSER disable constraint FOREIGNKEY_ONLINEUSER;
prompt Loading PUB_USER...
insert into PUB_USER (id, user_code, user_name, user_password, photo, telephone, qq, wechat, e_mail, address, gender, age, islocked, userrole, changedate, last_pwd_modify, tempvar1, tempvar2, tempvar3, tempvar4, tempvar5, tempvar6, tempvar7, tempvar8, tempvar9, tempvar10)
values ('171c2c40-b953-401d-bd5a-2dd78bf7d3e6', '1002', 'hkj', '-9gvopsoc1bsuo6vqjoco6u704hmnrso7', null, null, null, null, '147@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into PUB_USER (id, user_code, user_name, user_password, photo, telephone, qq, wechat, e_mail, address, gender, age, islocked, userrole, changedate, last_pwd_modify, tempvar1, tempvar2, tempvar3, tempvar4, tempvar5, tempvar6, tempvar7, tempvar8, tempvar9, tempvar10)
values ('b06a4d29-20e7-4f2c-91b2-7048e58032f0', '1001', 'admin', '-5v61rl8smt8kl6fg7nlva4uafbpr4lj9', null, null, null, null, 'admin@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into PUB_USER (id, user_code, user_name, user_password, photo, telephone, qq, wechat, e_mail, address, gender, age, islocked, userrole, changedate, last_pwd_modify, tempvar1, tempvar2, tempvar3, tempvar4, tempvar5, tempvar6, tempvar7, tempvar8, tempvar9, tempvar10)
values ('29e8146f-b25b-409e-83f6-25adde75bdde', '1003', '5858', '-5v61rl8smt8kl6fg7nlva4uafbpr4lj9', null, null, null, null, '5858@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into PUB_USER (id, user_code, user_name, user_password, photo, telephone, qq, wechat, e_mail, address, gender, age, islocked, userrole, changedate, last_pwd_modify, tempvar1, tempvar2, tempvar3, tempvar4, tempvar5, tempvar6, tempvar7, tempvar8, tempvar9, tempvar10)
values ('29e8146f-b25b-409e-83f6-25adde75bddg', '1004', '5858', '-5v61rl8smt8kl6fg7nlva4uafbpr4lj9', null, null, null, null, '5858', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into PUB_USER (id, user_code, user_name, user_password, photo, telephone, qq, wechat, e_mail, address, gender, age, islocked, userrole, changedate, last_pwd_modify, tempvar1, tempvar2, tempvar3, tempvar4, tempvar5, tempvar6, tempvar7, tempvar8, tempvar9, tempvar10)
values ('29e8146f-b25b-40re-83f6-25adde75bddg', '1005', '5858', '-5v61rl8smt8kl6fg7nlva4uafbpr4lj9', null, null, null, null, 'admin@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into PUB_USER (id, user_code, user_name, user_password, photo, telephone, qq, wechat, e_mail, address, gender, age, islocked, userrole, changedate, last_pwd_modify, tempvar1, tempvar2, tempvar3, tempvar4, tempvar5, tempvar6, tempvar7, tempvar8, tempvar9, tempvar10)
values ('171c2c40-b953-40rd-bd5a-2dd78bf7d3e6', '1006', '5858', '-5v61rl8smt8kl6fg7nlva4uafbpr4lj9', null, null, null, null, 'admin@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into PUB_USER (id, user_code, user_name, user_password, photo, telephone, qq, wechat, e_mail, address, gender, age, islocked, userrole, changedate, last_pwd_modify, tempvar1, tempvar2, tempvar3, tempvar4, tempvar5, tempvar6, tempvar7, tempvar8, tempvar9, tempvar10)
values ('171c2c40-b9t3-401d-bd5a-2dd78bf7d3e6', '1007', '5858', '-5v61rl8smt8kl6fg7nlva4uafbpr4lj9', null, null, null, null, 'admin@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into PUB_USER (id, user_code, user_name, user_password, photo, telephone, qq, wechat, e_mail, address, gender, age, islocked, userrole, changedate, last_pwd_modify, tempvar1, tempvar2, tempvar3, tempvar4, tempvar5, tempvar6, tempvar7, tempvar8, tempvar9, tempvar10)
values ('171c2c40-b943-401d-bd5a-2dd78bf7d3e6', '1008', '5858', '-5v61rl8smt8kl6fg7nlva4uafbpr4lj9', null, null, null, null, 'admin@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into PUB_USER (id, user_code, user_name, user_password, photo, telephone, qq, wechat, e_mail, address, gender, age, islocked, userrole, changedate, last_pwd_modify, tempvar1, tempvar2, tempvar3, tempvar4, tempvar5, tempvar6, tempvar7, tempvar8, tempvar9, tempvar10)
values ('171c2t40-b953-401d-bd5a-2dd78bf7d3e6', '1009', '5858', '-5v61rl8smt8kl6fg7nlva4uafbpr4lj9', null, null, null, null, 'admin@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into PUB_USER (id, user_code, user_name, user_password, photo, telephone, qq, wechat, e_mail, address, gender, age, islocked, userrole, changedate, last_pwd_modify, tempvar1, tempvar2, tempvar3, tempvar4, tempvar5, tempvar6, tempvar7, tempvar8, tempvar9, tempvar10)
values ('171c2c4u-b953-401d-bd5a-2dd78bf7d3e6', '1010', '5858', '-5v61rl8smt8kl6fg7nlva4uafbpr4lj9', null, null, null, null, 'admin@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into PUB_USER (id, user_code, user_name, user_password, photo, telephone, qq, wechat, e_mail, address, gender, age, islocked, userrole, changedate, last_pwd_modify, tempvar1, tempvar2, tempvar3, tempvar4, tempvar5, tempvar6, tempvar7, tempvar8, tempvar9, tempvar10)
values ('171t2c40-b953-401d-bd5a-2dd78bf7d3e6', '1011', '58585858', '-5v61rl8smt8kl6fg7nlva4uafbpr4lj9', null, null, null, null, 'admin@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into PUB_USER (id, user_code, user_name, user_password, photo, telephone, qq, wechat, e_mail, address, gender, age, islocked, userrole, changedate, last_pwd_modify, tempvar1, tempvar2, tempvar3, tempvar4, tempvar5, tempvar6, tempvar7, tempvar8, tempvar9, tempvar10)
values ('1u1c2c40-b953-401d-bd5a-2dd78bf7d3e6', '1012', '5858', '-5v61rl8smt8kl6fg7nlva4uafbpr4lj9', null, null, null, null, 'admin@qq.com', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into PUB_USER (id, user_code, user_name, user_password, photo, telephone, qq, wechat, e_mail, address, gender, age, islocked, userrole, changedate, last_pwd_modify, tempvar1, tempvar2, tempvar3, tempvar4, tempvar5, tempvar6, tempvar7, tempvar8, tempvar9, tempvar10)
values ('171c2ci0-b953-401d-bd5a-2dd78bf7d3e6', '1013', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
commit;
prompt 13 records loaded
prompt Loading PUB_ONLINEUSER...
insert into PUB_ONLINEUSER (id, user_id, login_time, login_ip, temp_var1, temp_var2, temp_var3, temp_var4, temp_var5)
values ('3f7d9a46-48fb-4dd8-90c9-162f44d8dede', 'b06a4d29-20e7-4f2c-91b2-7048e58032f0', '2018-01-07 22:59:25', null, null, null, null, null, null);
insert into PUB_ONLINEUSER (id, user_id, login_time, login_ip, temp_var1, temp_var2, temp_var3, temp_var4, temp_var5)
values ('2c204b4f-6620-473c-b249-b9f3beef9077', 'b06a4d29-20e7-4f2c-91b2-7048e58032f0', '2018-01-07 23:03:05', null, null, null, null, null, null);
insert into PUB_ONLINEUSER (id, user_id, login_time, login_ip, temp_var1, temp_var2, temp_var3, temp_var4, temp_var5)
values ('2d716871-939a-440f-8386-c077ff432125', 'b06a4d29-20e7-4f2c-91b2-7048e58032f0', '2018-01-07 23:15:10', null, null, null, null, null, null);
insert into PUB_ONLINEUSER (id, user_id, login_time, login_ip, temp_var1, temp_var2, temp_var3, temp_var4, temp_var5)
values ('f4993bc3-af9e-4a04-aa9d-90319aec87c4', 'b06a4d29-20e7-4f2c-91b2-7048e58032f0', '2018-01-07 23:29:09', null, null, null, null, null, null);
insert into PUB_ONLINEUSER (id, user_id, login_time, login_ip, temp_var1, temp_var2, temp_var3, temp_var4, temp_var5)
values ('c8d9dcb6-1458-4ed7-b19e-e38c0118879b', 'b06a4d29-20e7-4f2c-91b2-7048e58032f0', '2018-01-07 23:31:47', null, null, null, null, null, null);
insert into PUB_ONLINEUSER (id, user_id, login_time, login_ip, temp_var1, temp_var2, temp_var3, temp_var4, temp_var5)
values ('80edacc8-bf0d-4e2c-8787-149e44f4fb80', 'b06a4d29-20e7-4f2c-91b2-7048e58032f0', '2018-01-07 23:35:28', null, null, null, null, null, null);
insert into PUB_ONLINEUSER (id, user_id, login_time, login_ip, temp_var1, temp_var2, temp_var3, temp_var4, temp_var5)
values ('f2264b39-ad6e-429c-9d46-4d193d831f0f', 'b06a4d29-20e7-4f2c-91b2-7048e58032f0', '2018-01-07 23:07:56', null, null, null, null, null, null);
insert into PUB_ONLINEUSER (id, user_id, login_time, login_ip, temp_var1, temp_var2, temp_var3, temp_var4, temp_var5)
values ('86cabdc7-2784-4614-ad36-b7312f5ddafb', 'b06a4d29-20e7-4f2c-91b2-7048e58032f0', '2018-01-07 23:11:42', null, null, null, null, null, null);
insert into PUB_ONLINEUSER (id, user_id, login_time, login_ip, temp_var1, temp_var2, temp_var3, temp_var4, temp_var5)
values ('378e8355-e65f-4c6a-8225-dd68ef8581a4', 'b06a4d29-20e7-4f2c-91b2-7048e58032f0', '2018-01-08 00:03:01', null, null, null, null, null, null);
insert into PUB_ONLINEUSER (id, user_id, login_time, login_ip, temp_var1, temp_var2, temp_var3, temp_var4, temp_var5)
values ('85f374ba-5552-40bd-a642-531507ddf1df', 'b06a4d29-20e7-4f2c-91b2-7048e58032f0', '2018-01-08 00:10:07', null, null, null, null, null, null);
insert into PUB_ONLINEUSER (id, user_id, login_time, login_ip, temp_var1, temp_var2, temp_var3, temp_var4, temp_var5)
values ('ce5c1504-591d-4df7-857d-9fc2d1cc8bdd', 'b06a4d29-20e7-4f2c-91b2-7048e58032f0', '2018-01-08 00:11:52', null, null, null, null, null, null);
insert into PUB_ONLINEUSER (id, user_id, login_time, login_ip, temp_var1, temp_var2, temp_var3, temp_var4, temp_var5)
values ('03f2d04a-bbd1-4936-94e5-e2398b630673', 'b06a4d29-20e7-4f2c-91b2-7048e58032f0', '2018-01-08 00:16:12', null, null, null, null, null, null);
insert into PUB_ONLINEUSER (id, user_id, login_time, login_ip, temp_var1, temp_var2, temp_var3, temp_var4, temp_var5)
values ('567654e5-1ad9-45c7-a0d1-6e4833023067', 'b06a4d29-20e7-4f2c-91b2-7048e58032f0', '2018-01-08 00:25:19', null, null, null, null, null, null);
insert into PUB_ONLINEUSER (id, user_id, login_time, login_ip, temp_var1, temp_var2, temp_var3, temp_var4, temp_var5)
values ('ed0be6c0-26cc-4d6a-9a29-17fa5088efe0', 'b06a4d29-20e7-4f2c-91b2-7048e58032f0', '2018-01-07 22:42:42', null, null, null, null, null, null);
commit;
prompt 14 records loaded
prompt Enabling foreign key constraints for PUB_ONLINEUSER...
alter table PUB_ONLINEUSER enable constraint FOREIGNKEY_ONLINEUSER;
prompt Enabling triggers for PUB_USER...
alter table PUB_USER enable all triggers;
prompt Enabling triggers for PUB_ONLINEUSER...
alter table PUB_ONLINEUSER enable all triggers;
