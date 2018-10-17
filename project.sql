drop table STUDENT;
drop table COURSE;
drop table ENROL;

/* alter table ENROL drop column midterm; */
/* alter table ENROL add midterm integer default 1; */
create table STUDENT (
  sno number(3) primary key,
  sname nvarchar2(4) constraint sname_always_exists not null, /* NULL 값을 가질 수 없음 */
  year number(1) default 1, 
  dept nvarchar2(5), /* n: 다국어 지원, 가변형 문자열 */
  unique (dept, sname), /* 동일한 학과 내에서 이름이 유일하다. */
  constraint year_check check (year >=1 and year <=4 )
);

/* Input Data */
insert into STUDENT values (100, '나수영', 4, '컴퓨터');
insert into STUDENT values (200, '이찬수', 3, '전기');
insert into STUDENT values (300, '정기태', 1, '컴퓨터');
insert into STUDENT values (400, '송병길', 4, '컴퓨터');
insert into STUDENT values (500, '박종화', 2, '산공');

create table COURSE (
  cno char(4),
  cname nvarchar2(10) not null,
  credit number(1) not null,
  dept nvarchar2(4) not null,
  professor nvarchar2(4),
  primary key(cno),
  unique (cno, professor)
);

insert into COURSE values ('C123', 'C프로그래밍', 3, '컴퓨터', '김성국');
insert into COURSE values ('C312', '자료구조', 3, '컴퓨터', '황수관');
insert into COURSE values ('C324', '화일구조', 3, '컴퓨터', '이규찬');
insert into COURSE values ('C413', '데이터베이스', 3, '컴퓨터', '이일로');
insert into COURSE values ('E412', '반도체', 3, '전자', '홍봉진');

create table ENROL (
  sno number(3) not null, /* NULL 값을 가질 수 없음 */
  cno char(4) not null,
  grade char,
  midterm integer,
  finterm integer,
  primary key (sno, cno),
  foreign key (sno) references STUDENT(sno) /* sno number(3) not null references STUDENT(sno) */
    on delete cascade,/* 부모 테이블에서 삭제 시 서브 테이블에서도 삭제 */
    /* 이 query문이 존재하지 않으면 서브 테이블에서 먼저 지우고 부모 테이블에서 지워야 한다. -> default값 restrict */
  foreign key (cno) references COURSE
    on delete cascade,
  check (grade in ('A', 'B', 'C', 'D', 'F'))
);

insert into ENROL values (100, 'C413', 'A', 90, 95);
insert into ENROL values (100, 'E412', 'A', 95, 95);
insert into ENROL values (200, 'C123', 'B', 85, 80);
insert into ENROL values (300, 'C312', 'A', 90, 95);
insert into ENROL values (300, 'C324', 'C', 75, 75);
insert into ENROL values (300, 'C413', 'A', 95, 90);
insert into ENROL values (400, 'C312', 'A', 90, 95);
insert into ENROL values (400, 'C324', 'A', 95, 90);
insert into ENROL values (400, 'C413', 'B', 80, 85);
insert into ENROL values (400, 'E412', 'C', 65, 75);
insert into ENROL values (500, 'C312', 'B', 85, 80);

commit;

select * from STUDENT;
select * from ENROL;
select * from COURSE;

select sname from student where dept = '산공' and year = 2;
select sno from enrol where midterm >= 90 or finterm >= 90;
select distinct sno from enrol where midterm < finterm; /* 출력값이 같으면 하나만 출력한다. */

select * from student where dept = '컴퓨터' order by year asc, sno asc; /* 오름 차순 */ /* desc 가 내림 차순 */
select * from student where sname like '나%'; /* %는 글자가 없거나 임의의 갯수가 와도 괜찮다. */
select * from student where year in (1, 2); /* 1학년 또는 2학년이랑 같다. */
select * from STUDENT where year between 1 and 3; /* 1 ~ 3사이 */
select sno as 학번, sname 이름, year+1 진급학년 from STUDENT; /* 이름만 바꾼다. */

/* drop table COURSE; ENROL 테이블에서 외부 참조하고 있어서 ERROR 발생 */
/* drop table COURSE cascade constraints;*/ /* 외부 참조하고 있는 것까지 다 없애라 */
/* update STUDENT set year = year + 1 where sno = 200; */

/*
delete from STUDENT where SNO = 100;
delete from ENROL where SNO = 200;
*/

/* select * from all_tables; */