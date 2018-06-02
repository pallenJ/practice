conn pallen/pallen;

CREATE TABLE s_member(
email varchar2(100) PRIMARY KEY NOT NULL,
name varchar2(60) 				NOT NULL,
pw varchar2(100) 				NOT NULL,
grade varchar2(30) 				NOT NULL,
reg date 						NOT NULL
);

insert into s_member values('pallennellap17@gmail.com','pallen','1234','admin',sysdate);

CREATE TABLE s_board(
no number PRIMARY KEY 		NOT NULL,
board varchar2(30) 		NOT NULL,
title varchar2(150) 		NOT NULL, 
secret varchar2(5) 			NOT NULL, --true/false
content varchar2(4000) 		NOT NULL, 

uploadpath varchar2(256), 
upload varchar2(256), 
uploadname varchar2(256), 

reg date NOT NULL, 
read number NOT NULL, 
writer constraint fk_member_writer references s_member(email) on delete cascade, 
parent number NOT NULL, 
gno number NOT NULL-- group number
);

DROP SEQUENCE board_seq;
CREATE SEQUENCE board_seq NOCACHE;

insert into s_board values(board_seq.NEXTVAL,'기타','타이틀','false','test',NULL,NULL,NULL,
sysdate,0,'pallennellap17@gmail.com',0,0
);

update s_board set parent=no where no=(select max(no) from s_board);

