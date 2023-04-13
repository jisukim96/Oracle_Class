
use mysql;
select * from user;
select host, user from user;

create user user1;

create user user1@localhost identified by '1234';
-- 모든 원격 호스트에서 접근
create user user1@'%' identified by '1234';

-- database 생성
create database testDB;

-- DataBase 를 사용자 계정이 사용 가능하도록 권한 부여
-- Grant ALL PRIVILEGES ON DB명.테이블 TO 계정아이디@host IDENTIFIED BY '비밀번호';
GRANT ALL privileges ON testDB.* TO user1@localhost with grant option;
grant all privileges on testDB.* to user1@'%' with grant option;
-- 권한 바로 적용하기
flush privileges;
