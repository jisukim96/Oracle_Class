

use myDB;
/*MS-SQL���� Table ����*/
create table guestboard(
    name varchar(100),
    email varchar(100),
    inputdate varchar(100) primary key,
    subject varchar(100),
    content varchar(2000)
    );

desc guestboard

drop table guestboard;