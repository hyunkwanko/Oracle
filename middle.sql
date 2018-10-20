drop table G;
drop table M;
drop table B;

create table G (
    gname nvarchar2(10) primary key,
    genre nvarchar2(10) not null,
    gtype char(1) not null
);

insert into G values ('소녀시대', '댄스팝', 'F');
insert into G values ('원더걸스', '댄스팝', 'F');
insert into G values ('2AM', '발라드', 'M');

create table M (
    jno char(16) primary key,
    mname nchar(3) not null,
    age integer not null,
    mphone char(13)
);

insert into M values ('19900530-2000001', '유나', 21, '010-1111-0001');
insert into M values ('19900530-2000002', '써니', 22, '010-2222-0001');
insert into M values ('19900530-2000003', '서현', 23, '010-3333-0001');
insert into M values ('19900530-2000004', '소희', 24, '010-4444-0001');
insert into M values ('19900530-2000005', '선예', 25, '010-5555-0001');
insert into M values ('19900530-2000006', '조권', 26, '010-6666-0001');
insert into M values ('19900530-2000007', '이창민', 27, '010-7777-0001');
insert into M values ('19900530-2000008', '임슬옹', 28, '010-8888-0001');

create table B (
    gname nvarchar2(5) not null,
    jno char(16) not null,
    jyear integer,
    primary key (gname, jno),
    foreign key (gname) references G(gname)
        on delete cascade,
    foreign key (jno) references M(jno)
        on delete cascade
);

insert into B values ('소녀시대', '19900530-2000001', 2001);
insert into B values ('소녀시대', '19900530-2000002', 2002);
insert into B values ('소녀시대', '19900530-2000003', 2003);
insert into B values ('원더걸스', '19900530-2000004', 2004);
insert into B values ('원더걸스', '19900530-2000005', 2005);
insert into B values ('2AM', '19900530-2000006', 2010);
insert into B values ('2AM', '19900530-2000007', 2010);
insert into B values ('2AM', '19900530-2000008', 2010);

select genre from G where gtype = 'F';
select distinct G.gname from G join B on G.gname = B.gname where jyear = 2010;
select gname, count(*) from (G natural join B) natural join M group by gname;
commit;