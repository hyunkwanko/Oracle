select * from student;
delete student where sno=700 or sno = 600;

insert into student values (600, '홍길동', 3, 'IT');

commit; /* 데이터베이스에 저장 */ /* 새로운 transaction을 시작한다. */

rollback; /* 지금까지 했던거 취소 */