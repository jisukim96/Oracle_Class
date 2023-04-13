select * from freeboard;

/* 검색 */
-- 이름 : name 컬럼에 '%한%' ('한' 들어간 모든 이름 검색)

select * from freeboard
where name like '%한%' ;

--제목 : subject 컬럼 검색
select * from freeboard
where subject like '%제목%';

-- 글내용 : content
select * from freeboard
where content like '%내용%';

-- 이름과 제목에서 검색
select * from freeboard
where name like '%홍길동%' or subject like '%수정%';

select * from freeboard where name like '%홍길동%'order by id desc;

select * from freeboard where subject like '%수정%' order by id desc;

select * from freeboard where content like '%내용%'order by id desc;

select * from freeboard where name like '%홍길동%' or subject like '%홍길동%'order by id desc;

select * from freeboard where name like '%홍길동%' or content like '%홍길동%'order by id desc;

select * from freeboard where subject like '%수정%' or content like '%수정%'order by id desc;

select * from freeboard where name like '%홍길동%' or subject like '%홍길동%' or content like '%홍길동%'order by id desc;


select * from guestlab;
commit;
delete guestlab where idx = 7;

update guestlab set ename ='비빔쫄면', phone='010-1234-1234' ,gender ='여성' , addr ='경기도 화성시' where idx = 13;

select * from freeboard;



