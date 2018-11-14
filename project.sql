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
select * from student where sname like '_기_'; /* %는 글자가 없거나 임의의 갯수가 와도 괜찮다. */
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

select dept, count(*) from course group by dept; /* 과목별로 튜플의 개수 */
select max(finterm), min(finterm), avg(finterm) from enrol;
select cno 과목번호, count(*) 수강인원, avg(finterm) 기말평균, avg(midterm) 중간평균 from enrol group by cno having count(*) >= 3; /* 여기선 그룹화를 먼저 해야해서 where을 쓸 수 없다. having을 써서 조건을 쓴다. */
select cno 과목번호, count(*) 수강인원, avg(finterm) 기말평균, avg(midterm) 중간평균 from enrol group by cno having avg(midterm) >= 80;
select sname from student where sno in (select sno from enrol where cno='C413'); /* 중첩된 select, Nested select */
select * from (select sno from enrol where cno = 'C413'); /* 이런 식으로 select 안에 또 select가 들어갈 수 있다. */

select * from student;

select dept student where sno = 100;

select * from student where dept = '컴퓨터';

select * from student where dept = (select dept from student where sno = 100); /* 부속 질의는 가능한 권장하지 않는다. */

/* 여기부터 중요하다. */
select * from student;
select * from enrol;
select * from student s, enrol e where s.sno = e.sno; /* 카디션 프로덕트, alias 사용 */
select count(*) from student, enrol;

select e.cno from student s join enrol e on s.sno = e.sno; /* join */

insert into student values (600, '홍길동', 3, 'IT');

select * from student s left outer join enrol e on s.sno = e.sno where cno is null; /* 외부 조인 -> 수강한 과목이 아무것도 없는 학생을 찾을 때 사용 */

-- 등록한 학생이 아무도 없는 과목(과목번호)을 찾아라.
select * from course;
insert into course values('T411', '모바일', 3, 'IT', '아무개');

select * from enrol e right outer join course c on e.cno = c.cno where e.sno is null;

select * from course c left outer join enrol e on e.cno = c.cno where e.sno is null; /* 위와 같은 쿼리문이다. */

select * from student s natural join enrol e; /* 자연 조인 */

select * from student s natural join enrol where enrol.cno = 'C413';

select * from student s join enrol e on s.sno = e.sno where e.cno = 'C413';

select sname from student s, enrol e where s.sno = e.sno and e.cno = 'C413'; /* 답이 하나만 있는 것이 아니다. -> 중첩 select도 가능 */

-- 등록한 과목이 아무것도 없는 학생
select * from student s left outer join enrol e on s.sno = e.sno where cno is null;

select * from student where sno not in(select sno from enrol);

-- 데이터베이스 과목을 듣는 학생들을 찾아라.
select sname from (student natural join enrol) join course on enrol.cno = course.cno where cname = '데이터베이스'; /* 자연 조인쓰면 안된다. dept때문에 */

-- 정기태 학생이 수강한 모든 과목의 중간고사 성적 평균을 구하라.
select avg(midterm) as 중간교사평균 from student natural join enrol where sname = '정기태';

-- 데이터베이스 과목의 기말고사 최저점수는?
select min(finterm) as 기말최저점수 from enrol natural join course where cname = '데이터베이스'; /* natural 조인은 항상 유의해서 쓸 것 */
select * from enrol natural join course where cname = '데이터베이스';
--
select * from course c join enrol e on c.cno = e.cno;
select * from course c, enrol e where c.cno = e.cno; /* 파티션 프로덕트 */
select min(finterm) from course natural join enrol where cname = '데이터베이스'; /* 공통된 것은 cno밖에 없으므로 자연 조인 가능 */

select cno, avg(finterm) from student join enrol on student.sno = enrol.sno where dept = '컴퓨터' group by cno;

select sname 이름, cname 과목명, midterm + finterm 중간기말합계 from (student s natural join enrol e) join course c on e.cno = c.cno;

select * from student left outer join enrol on student.sno = enrol.sno; /* 왼쪽의 테이블을 한 번은 출력해줘라 */
select * from student right outer join enrol on student.sno = enrol.sno; /* 오른쪽 테이블을 한 번은 출력해줘라 */
select * from student full outer join enrol on student.sno = enrol.sno; /* 양쪽 테이블을 한 번은 출력해줘라 */

select * from student, enrol where student.sno = enrol.sno;

select sname from student left outer join enrol on student.sno = enrol.sno where e.sno is null;
select sno from enrol;

select * from student where sno not in (select sno from enrol);

insert into student values(600, '홍길동', 3, 'IT');
insert into course valuse('T301', '컴퓨터구조', 3, 'IT', '김택진');

select cname from enrol right outer join course on enrol.cno = course.cno where enrol.cno is null;

select cno from enrol;
select * from course where cno not in (select cno from enrol);

commit;



















create or replace procedure print_hello (p1 in nvarchar2)
is
begin
DBMS_OUTPUT.put_line('Hello world! :' || p1);

end;
/
/* 반드시 슬래쉬 추가 */

set SERVEROUTPUT ON


execute print_hello('Foo');
call print_hello('Foo');









select * from (student natural join enrol) join course on enrol.cno = course.cno where sname='정기태';


