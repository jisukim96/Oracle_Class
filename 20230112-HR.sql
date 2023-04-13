select*from guestboard order by inputdate desc

--- 게시판 ( 질문 답변형 게시판)
Create Table freeboard (
    id number constraint PK_freeboard_id Primary Key,
    name varchar2(100) not null,
    password varchar2(100) not null,
    email varchar2(100) null,
    subject varchar2(100) not null,
    content varchar2(2000) not null,
    inputdate varchar2(100) not null,
    -- 답변을 처리하는 컬럼
    masterid number default 0,
    readcount number default 0,
    replaynum number default 0,
    step number default 0
);

select * from freeboard;

select max(id) from freeboard;

select max(id) as id from freeboard;    --변수명 max(id) -> id 변경

select id from freeboard;

--더미 값 insert (*보다는 컬럼명을 명시해놓는 것이 퍼포먼스적으로도 효율적이다)
insert into freeboard (id,name,password,email,subject,content,inputdate,
    masterid,readcount,replaynum,step)
values(1,'홍길동','1234','aaa@aaa.com','제목','내용','23-01-12 11:59 오전',
    1,0,0,0);

insert into freeboard (id,name,password,email,subject,content, inputdate,masterid,readcount,replaynum,step)
values(2,'홍길동','1234','aaa@aaa.com','제목','내용', '23-01-12 11:59 오전',2,0,0,0);

insert into freeboard (id,name,password,email,subject,content, inputdate,masterid,readcount,replaynum,step)
values(3,'홍길동','1234','aaa@aaa.com','제목','내용', '23-01-12 11:59 오전',3,0,0,0);

commit;
-- * 보다 컬럼명을 모두 찍어주는 것이 성능면에서 더 낫다.
select * from freeboard order by id desc;

select * from freeboard
where id = 14;

update freeboard set readcount = readcount +1 where id = 19; 
commit;
