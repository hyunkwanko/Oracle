drop table student;

create table STUDENT (
  sno number(3) primary key,
  sname nvarchar2(4) constraint sname_always_exists not null, /* NULL 값을 가질 수 없음 */
  year number(1) default 1, 
  dept nvarchar2(5), /* n: 다국어 지원, 가변형 문자열 */
  unique (dept, sname), /* 동일한 학과 내에서 이름이 유일하다. */
  constraint year_check check (year >=1 and year <=4 )
);

select * from student;

select dept, count(*) from student group by dept;

drop table st_dept;

create table ST_DEPT(
    DEPT nvarchar2(10),
    STNUM number(3)
);
insert into st_dept select dept, count(*) from student group by dept;
select * from st_dept;

/* delete 쿼리문은 스키마는 남아있고 데이터만 지운다. drop 쿼리문은 스키마까지 전부 삭제 */

create or replace procedure refresh_st_dept
is
begin

delete st_dept;
insert into st_dept select dept, count(*) from student group by dept;

end;
/

select * from st_dept;

select * from student;

delete student where sno = 100;

execute refresh_st_dept; /* execute를 해야 전체적으로 업데이트된다. */

select * from user_procedures; /* 사용자가 정의한 프로시절들 */ /* All_OBJECTS는 함부로 하면 안된다. */


























