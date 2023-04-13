
select * from freeboard order by id desc;

select * from freeboard where id = 29;

select * from freeboard where id = 21;

select * from freeboard where id = 22;

select * from freeboard order by masterid desc, replaynum , step , id ;

select * from guestlab order by to_number(idx);
select * from guestlab where idx = 10;

insert into guestlab (idx , ename , phone , gender , addr)
values(11 ,'다섯' ,'010-1111-1111','여성','서울시 강남구');

commit;

insert into freeboard (id,name,password,email,subject,content,inputdate,masterid)
values( 7 , '남대문','0000',null,'제목','내용','23-01-12 03:40 오후',7);

commit;

select * from freeboard where id = 22;

update freeboard 
set name ='남대문', email='1234@abc.com', subject ='1월 12일' , content ='내용' where id = 22;

select * from guestlab where idx = 10;

