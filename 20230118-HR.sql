

select * from freeboard
where id = 23;

select * from freeboard
order by id desc;

select max(id) from freeboard;

select max(replaynum) from freeboard where masterid = 15;

commit;
insert into freeboard (id , name, password, email, subject,content, inputdate, masterid, readcount, replaynum, step) 
values (34,'신사임당-답변','0000','aaa@abc.com','Re :제목a',' 제목 수정 필수입니다. ----------------------------------------------------------------------- > ㄴㅇ ','23-01-18 1:19 오후',23,0,1,1)

select * from freeboard
order by id desc;

select * from freeboard
order by masterid desc,replaynum,step,id;


/* 회원 정보를 저장하는 테이블 */

Create Table mbTbl (
	idx number not null,  			-- 행의 번호 : 1씩 증가
	id varchar2(100) not null,		-- 회원의 ID
	pass varchar2(100) not null,	-- 회원의 password 정보를 저장
	name varchar2(100) not null,	-- 회원의 이름을 저장하는 컬럼
	email varchar2(100) not null,	-- email 정보 저장
	city varchar2(100)  null,	
	phone varchar2(100) null
); 

alter table mbTbl
add constraint mbTbl_id_pk primary key (id);

select * from mbTbl;

insert into mbTbl (idx,id,pass,name,email,city,phone) 
values(2,'aaaa','0000','aaaa','aaa@aaa.com','busan','010-1111-1111');

select max(idx) from mbTbl;

select * from mbTbl where idx = 3;

commit;

select * from mbTbl where idx =2;

insert into mbTbl (idx,id,pass,name,email,city,phone) 
values(7,'fff',0000,'gggg','aaa@aaa.com','seoul','010-1111-1111');
select * from mbtbl; 


select * from mbTbl;

select pass from mbTbl where idx = 1;