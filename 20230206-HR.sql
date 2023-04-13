select * from board;

select * from member;

desc member;

insert INTO member
values ('id1','1234','송사리','서울시','02-1234-1234',default,default);

drop table member;

Create Table member(
    idx number primary key ,
    id varchar2(100) not null unique,
    pass varchar2(100) not null,
    name varchar2(100) not null,
    email varchar2(100) not null,
    age number(3) null,
    weight number(3) null,
    regdate date default sysdate,
    cnt number(5) default 0
    );
    
    
