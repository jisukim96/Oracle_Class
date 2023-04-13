
/*Oracle에서 Table 생성*/
create table guestboard(
    name varchar2(100),
    email varchar2(100),
    inputdate varchar2(100) primary key,
    subject varchar2(100),
    content varchar2(2000)
    );

desc guestboard;

select * from guestboard;

drop table guestboard;

/*더미 데이터 입력 : 테스트 목적으로 값 입력 */
insert into guestboard (name,email,inputdate,subject,content)
    values('홍길동','aaa@aaa.com','2023 1 10 오후 13시 30분','제목1입니다.','내용');
    
commit;

insert into guestboard (name,email,inputdate,subject,content) values('홍길동','1234@abc.com','2023. 1. 10. 오후 3:42:38','첫번째 글제목','ㄴㅇ')

/*Oracle XE DataBase 에서 Table 생성 */

create Table guestlab (
	idx varchar2(200) primary key,
	ename varchar2(200),
	phone varchar2(200),
	gender varchar2(200),
	addr varchar2(200)
	);
    
select * from guestlab;