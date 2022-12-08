--부모테이블 생성
create table tb_zipcode (
    zipcode varchar2(7) not null constraint PK_tb_zipcode_zipcode primary key,
    sido varchar2(30),
    gugun varchar2(30),
    dong varchar2(30),
    bungi varchar2(30)
    );
    
select * from user_constraints
where table_name = 'tb_zipcode'

insert into tb_zipcode ( zipcode,sido,gugun,dong,bungi)
values('123-456','서울시','중구','인사동','3번지');

insert into tb_zipcode ( zipcode,sido,gugun,dong,bungi)
values('234-567','서울시','중구','인사동','4번지');

insert into tb_zipcode ( zipcode,sido,gugun,dong,bungi)
values('456-789','서울시','중구','인사동','1번지');

insert into tb_zipcode ( zipcode,sido,gugun,dong,bungi)
values('345-678','서울시','중구','인사동','2번지');

insert into tb_zipcode ( zipcode,sido,gugun,dong,bungi)
values('567-890','서울시','중구','인사동','5번지');

select * from tb_zipcode
desc tb_zipcode


commit

drop table member

create table member (
    id varchar2(20) not null constraint PK_member_id primary key,
    pwd varchar2(20),
    name varchar2(50),
    zipcode varchar2(7) constraint FK_member_id_tb_zipcode foreign key references tb_zipcode(zipcode),
    address varchar2(20),
    tel varchar2(13),
    indate date default sysdate
    );
    
create table member (
    id varchar2(20) not null constraint PK_member_id primary key,
    pwd varchar2(20),
    name varchar2(50),
    zipcode varchar2(7), 
    address varchar2(20),
    tel varchar2(13),
    indate date default sysdate,
    constraint  FK_member_id_tb_zipcode foreign key(zipcode) references tb_zipcode(zipcode)
    );
    
select *from member
insert into member 
values ('홍차','홍차차','홍차','123-456','인사동','010-1234-5678',default);

insert into member (id ,pwd,name,zipcode,address,tel)
values ('우차','우차차','우차','234-567','인사동','010-1234-5678');

insert into member (id ,pwd,name,zipcode,address,tel)
values ('하차','하차차','하차','345-678','인사동','010-1234-5678');

insert into member (id ,pwd,name,zipcode,address,tel)
values ('이차','이차차','이차','456-789','인사동','010-1234-5678');

insert into member (id ,pwd,name,zipcode,address,tel)
values ('도차','도하하','또치','567-890','인사동','010-1234-5678');

create table products(
    product_code varchar2(20) NOT NULL constraint PK_products_product_code primary key ,
    product_name varchar2(100) ,
    product_kind char(1) ,
    product_price1 varchar2(10) ,
    product_price2 varchar2(10) ,
    product_content varchar2(1000) ,
    product_image varchar2(50) ,
    sizeSt varchar2(5) ,
    sizeEt varchar2(5) ,
    product_quantity varchar2(5) ,
    useyn char(1) ,
    indate date
);

insert into products 
values ('aaaa','사과','1','200','500','과일','abc','a','d','250','Y','22/12/08');

insert into products 
values ('bbbb','바나나','1','200','500','과일','abcd','a','d','200','Y','22/12/08');

insert into products 
values ('cccc','배','1','200','500','과일','abcde','a','d','250','N','22/12/08');

insert into products 
values ('dddd','키위','1','200','500','과일','abc','a','d','150','Y','22/12/08');

insert into products 
values ('eeee','수박','1','200','500','과일','abc','a','d','50','Y','22/12/08');

select * from products;

create table orders(
     o_seq number(10) NOT NULL constraint PK_orders_o_seq primary key,
     product_code varchar2(20) ,
     id varchar2(16) ,
     product_size varchar2(5) ,
     quantity varchar2(5) ,
     result char(1) ,
     indate date,
     constraint FK_orders_product_code_products foreign key ( product_code) references products( product_code),
    constraint FK_orders_id_member foreign key (id) references member(id)
);

select * from orders
insert into orders 
values(9876,'aaaa','홍차','a','250','Y','22/12/08');

insert into orders 
values(4537,'bbbb','우차','a','250','Y','22/12/08');

insert into orders 
values(5279,'cccc','도차','a','250','Y','22/12/08');

insert into orders 
values(9668,'dddd','이차','a','250','Y','22/12/08');

insert into orders 
values(7453,'eeee','하차','a','250','Y','22/12/08');
    