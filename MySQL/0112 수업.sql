
use mydb;

/*My-SQL에서 Table 생성*/
create table guestboard(
    name varchar(100),
    email varchar(100),
    inputdate varchar(100) primary key,
    subject varchar(100),
    content varchar(2000)
    );
    
desc guestboard;

drop table guestboard;


/* MYSQL DB (mydb) 용 */
--- 게시판 ( 질문 답변형 게시판)
Create Table freeboard (
    id int ,
    constraint PK_freeboard_id Primary Key(id),
    name varchar(100) not null,
    password varchar(100) not null,
    email varchar(100) null,
    subject varchar(100) not null,
    content varchar(2000) not null,
    inputdate varchar(100) not null,
    -- 답변을 처리하는 컬럼
    masterid int default 0,
    readcount int default 0,
    replaynum int default 0,
    step int default 0
);