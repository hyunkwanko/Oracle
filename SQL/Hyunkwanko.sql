CREATE TABLE CONTACT (
	ID    SMALLINT    NOT NULL,
	NAME   VARCHAR(50) NOT NULL,
	PHONE  VARCHAR(13), 
	EMAIL  VARCHAR(40), 
	ADDR   VARCHAR(50)
);

select * from contact;

insert into contact 
values (contact_id.nextval, 
'Foo', '010-111-1111', 'foo@pknu.ac.kr', 'BUSAN');

insert into contact values (contact_id.nextval, 
'Tigger', '010-222-2222', 'tiger@gmail.com', 'SEOUL');



commit;