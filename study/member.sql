conn sw3/sw3;

CREATE TABLE s_member(
email varchar2(100) PRIMARY KEY NOT NULL,
id varchar2(60) NOT NULL,
pw varchar2(100) NOT NULL,
grade varchar2(30) NOT NULL,
reg date NOT NULL
);

insert into s_member values('pallennellap17@gmail.com','pallen','1234','admin',sysdate);

