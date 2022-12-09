
-- grade_pt_rade 3
create table grade_pt_rade(
    mem_grade varchar2(20) not null constraint grade_pt_rade_mem_grade_PK primary key,
    grade_pt_rate number(3,2)
    );

insert into grade_pt_rade 
    values('A','9.99');
insert into grade_pt_rade 
    values('B','7');
insert into grade_pt_rade 
    values('C','5');
insert into grade_pt_rade 
    values('D','3');
insert into grade_pt_rade 
    values('E','1.5');    
commit    
    
-- today 4
create table today(
    today_code varchar2(6) not null constraint today_today_code_PK primary key,
    today_sens_value number(3),
    today_intell_value number(3),
    today_phy_value number(3)
    );
    
insert into today
    values('RED','10','10','10');
insert into today 
    values('BLUE','0','50','50');
insert into today 
    values('YELLOW','50','80','80');    
insert into today
    values('GREEN','100','100','100');
insert into today 
    values('PINK','50','50','50');    
    
 select * from today;   
    
-- nation 5
create table nation (
    nation_code varchar2(26) not null constraint nation_nation_code_PK primary key,
    nation_name varchar2(50) not null
    );
    
insert into nation
    values('99999','가나');
insert into nation
    values('88888','스페인');
insert into nation
    values('77777','프랑스');    
insert into nation
    values('66666','독일');
insert into nation
    values('55555','칠레');    
commit;    
-- theme 7
create table theme (
    theme_code varchar2(6) not null constraint theme_theme_code_PK primary key,
    theme_name varchar2(50) not null
    );
 
insert into theme
    values('1','화이트와인');
insert into theme
    values('2','레드와인');
insert into theme
    values('3','로제와인');
insert into theme
    values('4','스파클링와인');
insert into theme
    values('5','화이트와인');    
commit    ;
    
-- manager 9
create table manager (
    manager_id varchar2(30) not null constraint manager_manager_id_PK primary key,
    manager_pwd varchar2(20) not null,
    manager_tel varchar2(20)
    );

insert into manager
    values ( 'ab','12345','010-1234-5678');
insert into manager
    values ( 'bc','23456','010-1234-5678');
insert into manager
    values ( 'cd','34567','010-1234-5678');
insert into manager
    values ( 'de','45678','010-1234-5678');
insert into manager
    values ( 'ef','56789','010-1234-5678');
commit;
select * from manager;
-- wine type 10
create table wine_type (
    wine_type_code varchar2(6) not null constraint wine_type_wine_type_code_PK primary key,
    wine_type_name varchar2(50)
    );

insert into wine_type
    values('a1','zhdtnsdl');
insert into wine_type
    values('a2','zhdtnsdl');
insert into wine_type
    values('a3','zhdtnsdl');
insert into wine_type
    values('a4','zhdtnsdl');
insert into wine_type
    values('a5','zhdtnsdl');
commit;    
select * from wine_type;

-- member_wine 2------------------
create table member_wine(
    mem_id varchar2(6) not null constraint member_wine_mem_id_PK primary key,
    mem_grade varchar2(20),
    constraint member_wine_mem_grade_FK foreign key (mem_grade) references grade_pt_rade (mem_grade),
    mem_pw varchar2(20) not null,
    mem_birth date  default sysdate not null,
    mem_tel varchar2(20),
    mem_pt varchar2(10) default 0 not null 
    );
drop table member_wine
select * from member_wine ;   
 
select*from grade_pt_rade;
 
 insert into member_wine
 values('i1','A','1234',default,null,'100');
  insert into member_wine
 values('i2','B','1234',default,null,'100');
  insert into member_wine
 values('i3','C','1234',default,null,'100');
  insert into member_wine
 values('i4','D','1234',default,null,'100');
  insert into member_wine
 values('i5','E','1234',default,null,'100');
 commit;
 
 select * from grade_pt_rade;
 
 
-- wine 6---------------
create table wine (
    wine_code varchar2(26) not null constraint wine_wine_code_PK primary key,
    wine_name varchar2(100) not null,
    wine_url blob,
    nation_code varchar2(6),
    constraint wine_nation_code_FK foreign key (nation_code) references nation (nation_code),
    wine_type_code varchar2(6),
    constraint wine_wine_type_code_FK foreign key (wine_type_code) references wine_type (wine_type_code),
    wine_sugar_code number(2),
    wine_price number(15) default 0 not null,
    wine_vintage date,
    theme_code varchar2(6),
    constraint wine_theme_code_FK foreign key (theme_code) references theme (theme_code),
    today_code varchar2(6),
    constraint wine_today_code_FK foreign key (today_code) references today (today_code)
    );
 
 insert into wine 
 values('dlf','dlf',null,null,null,50,default,null,null,null);
  insert into wine 
 values('dl','dl',null,'99999','a1',50,default,null,1,'RED');
  insert into wine 
 values('tka','tka',null,'88888',null,40,default,null,1,'BLUE');
  insert into wine 
 values('tk','tk',null,'77777',null,70,default,null,4,'GREEN');
  insert into wine 
 values('dj','dh',null,'66666',null,80,default,null,5,'PINK');
   
 commit; 
 select * from wine;
-- sale 1
create table sale(
    sale_date date default sysdate not null constraint sale_sale_date_PK primary key,
    wine_code varchar2(6) not null,
    constraint sale_wine_code_FK foreign key (wine_code) references wine (wine_code),
    mem_id varchar2(30) not null,
    constraint sale_mem_id_FK foreign key (mem_id) references member_wine (mem_id),
    sale_amount varchar2(5) not null,
    sale_price varchar2(6) not null,
    sale_tot_price varchar2(15) not null
    );
 
 insert into sale
    values(default,'dl','i2','100','100','100');
insert into sale
    values(default,'tka','i3','200','200','100');
insert into sale
    values(default,'dl','i2','140','100','100');
insert into sale
    values(default,'dl','i2','150','100','100');

 select * from sale;   
 
--  stock_mamagement 8
create table stock_mamagement(
    stock_code varchar2(6) not null constraint stock_mamagement_stock_code_PK primary key,
    wine_code varchar2(6),
    constraint stock_mamagement_wine_code_FK foreign key (wine_code) references wine (wine_code),
    manager_id varchar2(30),
    constraint stock_mamagement_manager_id_FK foreign key (manager_id) references manager (manager_id),
    ware_date date default sysdate not null,
    stock_amount number(5) default 0 not null
    );
    
insert into stock_mamagement
        values('1234','dlf','ab',default,default);
insert into stock_mamagement
        values('4563','dlf','ab',default,default);
insert into stock_mamagement
        values('8523','dlf','ab',default,default);
insert into stock_mamagement
        values('7951','dlf','ab',default,default);
insert into stock_mamagement
        values('9652','dlf','ab',default,default);        
    
 commit   ;
 select * from stock_mamagement;
       
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    