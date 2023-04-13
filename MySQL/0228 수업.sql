create database shop;

use shop;

select * from member;

select * from item;

select * from item_img;

select * from item_img
where item_id = 2
order by item_img_id asc;

update member
set role = 'USER'
where member_id = 13;

delete from member
where member_id = 12;