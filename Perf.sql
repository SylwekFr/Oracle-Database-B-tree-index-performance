
create table table_small(INTEGER_NUMBER integer,FLOAT_NUMBER float,RAND_DATE date,SMALL_FIXED_STRING char(8),BIG_FIXED_STRING char(58),SMALL_VARIABLE_CHAR varchar2(8),BIG_VARIABLE_CHAR varchar2(58));
create table table_medium(INTEGER_NUMBER integer,FLOAT_NUMBER float,RAND_DATE date,SMALL_FIXED_STRING char(8),BIG_FIXED_STRING char(58),SMALL_VARIABLE_CHAR varchar2(8),BIG_VARIABLE_CHAR varchar2(58));
create table table_big(INTEGER_NUMBER integer,FLOAT_NUMBER float,RAND_DATE date,SMALL_FIXED_STRING char(8),BIG_FIXED_STRING char(58),SMALL_VARIABLE_CHAR varchar2(8),BIG_VARIABLE_CHAR varchar2(58));
set serveroutput on
declare
  type small is table of varchar(8);
  small_fixed small;
  small_variable small;
  type huge is table of varchar(58);
  big_fixed huge;
  big_variable huge;
  rnd_int int;
  rnd_ind int;
  rnd_inde int;
  rnd_day int;
  rnd_flt float;
begin
  small_fixed := small('georgesm', 'bonjours' , 'aurevoir', 'jamaisif',
               'hellowor', 'gregorrz', 'luisvito', 'azertyui', 'qwertyui', 'undeuxtr');
  small_variable := small('c','la','vie', 'que', 'je', 'avais', 'choisitf', 'azertyui', 
               'jamais', 'toujours');
  big_fixed := huge('Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch','Llajfhirpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch','Ghytfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch', 'Ghytfairpwllgwyngykjhogerychwyrndrobwllllantysiliogogogoch','azertyuiopqsdfghjklmwxcvbnazertyuiopqsdfghjklmwxcvbnazerty');
  big_variable:= huge('Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch','Llajfhirpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch','Ghytfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch', 'Ghytfairpwllgwyngykjhogerychwyrndrobwllllantysiliogogogoch','azertyuiopqsdfghjklmwxcvbnazertyuiopqsdfghjklmwxcvbnazerty');
  
  for i in 1..1000 loop
    rnd_day := round(dbms_random.value(1,10000));
	  rnd_int := round(dbms_random.value(1,1000));
    rnd_ind := round(dbms_random.value(1,10));
    rnd_inde := round(dbms_random.value(1,5));
    rnd_flt := round(dbms_random.value(1000,100000));
    insert into table_small
    (INTEGER_NUMBER,FLOAT_NUMBER,RAND_DATE,SMALL_FIXED_STRING,BIG_FIXED_STRING,SMALL_VARIABLE_CHAR,BIG_VARIABLE_CHAR) 
    values (rnd_int,rnd_flt,sysdate-rnd_day, small_fixed(rnd_ind),big_fixed(rnd_inde),small_variable(rnd_ind),big_variable(rnd_inde)); 
  end loop;
  for i in 1..100000 loop
    rnd_day := round(dbms_random.value(1,10000));
	  rnd_int := round(dbms_random.value(1,100000));
    rnd_ind := round(dbms_random.value(1,10));
    rnd_inde := round(dbms_random.value(1,5));
    rnd_flt := round(dbms_random.value(1000,100000));
    insert into table_medium
    (INTEGER_NUMBER,FLOAT_NUMBER,RAND_DATE,SMALL_FIXED_STRING,BIG_FIXED_STRING,SMALL_VARIABLE_CHAR,BIG_VARIABLE_CHAR) 
    values (rnd_int,rnd_flt,sysdate-rnd_day, small_fixed(rnd_ind),big_fixed(rnd_inde),small_variable(rnd_ind),big_variable(rnd_inde)); 
  end loop;
  for i in 1..10000000 loop
    rnd_day := round(dbms_random.value(1,10000));
	  rnd_int := round(dbms_random.value(1,10000000));
    rnd_ind := round(dbms_random.value(1,10));
    rnd_inde := round(dbms_random.value(1,5));
    rnd_flt := round(dbms_random.value(1000,100000));
    insert into table_medium
    (INTEGER_NUMBER,FLOAT_NUMBER,RAND_DATE,SMALL_FIXED_STRING,BIG_FIXED_STRING,SMALL_VARIABLE_CHAR,BIG_VARIABLE_CHAR) 
    values (rnd_int,rnd_flt,sysdate-rnd_day, small_fixed(rnd_ind),big_fixed(rnd_inde),small_variable(rnd_ind),big_variable(rnd_inde)); 
  end loop;
end;
/
set timing on;
set termout off;
spool result.txt;
select * from table_small;
select * from table_medium;
select * from table_big;
select * from table_small where INTEGER_NUMBER < 10;
select * from table_medium where INTEGER_NUMBER < 10;
select * from table_big where INTEGER_NUMBER < 10;
select * from table_small where FLOAT_NUMBER < 10;
select * from table_medium where FLOAT_NUMBER < 10;
select * from table_big where FLOAT_NUMBER < 10;
select * from table_small where RAND_DATE between '14-FEB-2018' and '24-FEB-2018';
select * from table_medium where RAND_DATE between '14-FEB-2018' and '24-FEB-2018';
select * from table_big where RAND_DATE between '14-FEB-2018' and '24-FEB-2018';
select * from table_small where SMALL_FIXED_STRING = 'aurevoir';
select * from table_medium where SMALL_FIXED_STRING = 'aurevoir';
select * from table_big where SMALL_FIXED_STRING = 'aurevoir';
select * from table_small where BIG_FIXED_STRING = 'Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch';
select * from table_medium where BIG_FIXED_STRING = 'Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch';
select * from table_big where BIG_FIXED_STRING = 'Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch';
select * from table_small where SMALL_VARIABLE_CHAR = 'avais';
select * from table_medium where SMALL_VARIABLE_CHAR = 'avais';
select * from table_big where SMALL_VARIABLE_CHAR = 'avais';
select * from table_small where BIG_VARIABLE_CHAR = 'Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch';
select * from table_medium where BIG_VARIABLE_CHAR = 'Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch';
select * from table_big where BIG_VARIABLE_CHAR = 'Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch';
set serveroutput on
begin
  for i in 1..10000 loop
    insert into table_small(INTEGER_NUMBER,FLOAT_NUMBER,RAND_DATE,SMALL_FIXED_STRING,BIG_FIXED_STRING,SMALL_VARIABLE_CHAR,BIG_VARIABLE_CHAR) 
    values (501,321.12,'14-FEB-2020', 'toujours','Abanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch', 'toujours','Abanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch'); 
  end loop;
end;
/
update table_small set SMALL_VARIABLE_CHAR = 'toujour' where SMALL_FIXED_STRING='toujours';
delete from table_small where RAND_DATE='14-FEB-2020';
set serveroutput on
begin
  for i in 1..10000 loop
    insert into table_medium(INTEGER_NUMBER,FLOAT_NUMBER,RAND_DATE,SMALL_FIXED_STRING,BIG_FIXED_STRING,SMALL_VARIABLE_CHAR,BIG_VARIABLE_CHAR) 
    values (501,321.12,'14-FEB-2020', 'toujours','Abanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch', 'toujours','Abanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch'); 
  end loop;
end;
/
update table_medium set SMALL_VARIABLE_CHAR = 'toujour' where SMALL_FIXED_STRING='toujours';
delete from table_medium where RAND_DATE='14-FEB-2020';
set serveroutput on
begin
  for i in 1..10000 loop
    insert into table_big(INTEGER_NUMBER,FLOAT_NUMBER,RAND_DATE,SMALL_FIXED_STRING,BIG_FIXED_STRING,SMALL_VARIABLE_CHAR,BIG_VARIABLE_CHAR) 
    values (501,321.12,'14-FEB-2020', 'toujours','Abanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch', 'toujours','Abanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch'); 
  end loop;
end;
/
update table_big set SMALL_VARIABLE_CHAR = 'toujour' where SMALL_FIXED_STRING='toujours';
delete from table_big where RAND_DATE='14-FEB-2020';
create index small_int_key on table_small(INTEGER_NUMBER);
create index small_float_key on table_small(FLOAT_NUMBER);
create index small_date_key on table_small(RAND_DATE);
create index small_schar_key on table_small(SMALL_FIXED_STRING);
create index small_lchar_key on table_small(BIG_FIXED_STRING);
create index small_svchar_key on table_small(SMALL_VARIABLE_CHAR);
create index small_lvchar_key on table_small(BIG_VARIABLE_CHAR);
create index medium_int_key on table_medium(INTEGER_NUMBER);
create index medium_float_key on table_medium(FLOAT_NUMBER);
create index medium_date_key on table_medium(RAND_DATE);
create index medium_schar_key on table_medium(SMALL_FIXED_STRING);
create index medium_lchar_key on table_medium(BIG_FIXED_STRING);
create index medium_svchar_key on table_medium(SMALL_VARIABLE_CHAR);
create index medium_lvchar_key on table_medium(BIG_VARIABLE_CHAR);
create index big_int_key on table_big(INTEGER_NUMBER);
create index big_float_key on table_big(FLOAT_NUMBER);
create index big_date_key on table_big(RAND_DATE);
create index big_schar_key on table_big(SMALL_FIXED_STRING);
create index big_lchar_key on table_big(BIG_FIXED_STRING);
create index big_svchar_key on table_big(SMALL_VARIABLE_CHAR);
create index big_lvchar_key on table_big(BIG_VARIABLE_CHAR);
select * from table_small;
select * from table_medium;
select * from table_big;
select /*+ index(table_small small_int_key */ * from table_small where INTEGER_NUMBER < 10;
select /*+ index(table_medium medim_int_key */ * from table_medium where INTEGER_NUMBER < 10;
select /*+ index(table_big big_int_key */ * from table_big where INTEGER_NUMBER < 10;
select /*+ index(table_small small_float_key */ * from table_small where FLOAT_NUMBER < 10;
select /*+ index(table_medium medium_float_key */ * from table_medium where FLOAT_NUMBER < 10;
select /*+ index(table_big big_float_key */ * from table_big where FLOAT_NUMBER < 10;
select /*+ index(table_small small_date_key */ * from table_small where RAND_DATE between '14-FEB-2018' and '24-FEB-2018';
select /*+ index(table_medium medium_date_key */ * from table_medium where RAND_DATE between '14-FEB-2018' and '24-FEB-2018';
select /*+ index(table_big big_date_key */ * from table_big where RAND_DATE between '14-FEB-2018' and '24-FEB-2018';
select /*+ index(table_small small_schar_key */ * from table_small where SMALL_FIXED_STRING = 'aurevoir';
select /*+ index(table_medium medium_schar_key */ * from table_medium where SMALL_FIXED_STRING = 'aurevoir';
select /*+ index(table_big big_schar_key */ * from table_big where SMALL_FIXED_STRING = 'aurevoir';
select /*+ index(table_small small_lchar_key */ * from table_small where BIG_FIXED_STRING = 'Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch';
select /*+ index(table_medium medium_lchar_key */ * from table_medium where BIG_FIXED_STRING = 'Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch';
select /*+ index(table_big big_lchar_key */ * from table_big where BIG_FIXED_STRING = 'Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch';
select /*+ index(table_small small_svchar_key */ * from table_small where SMALL_VARIABLE_CHAR = 'avais';
select /*+ index(table_medium medium_svchar_key */ * from table_medium where SMALL_VARIABLE_CHAR = 'avais';
select /*+ index(table_big big_svchar_key */ * from table_big where SMALL_VARIABLE_CHAR = 'avais';
select /*+ index(table_small small_lvchar_key */ * from table_small where BIG_VARIABLE_CHAR = 'Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch';
select /*+ index(table_medium medium_lvchar_key */ * from table_medium where BIG_VARIABLE_CHAR = 'Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch';
select /*+ index(table_big big_lvchar_key */ * from table_big where BIG_VARIABLE_CHAR = 'Llanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch';
set serveroutput on
begin
  for i in 1..10000 loop
    insert into table_small
    (INTEGER_NUMBER,FLOAT_NUMBER,RAND_DATE,SMALL_FIXED_STRING,BIG_FIXED_STRING,SMALL_VARIABLE_CHAR,BIG_VARIABLE_CHAR) 
    values (501,321.12,'14-FEB-2020', 'toujours','Abanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch', 'toujours','Abanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch'); 
  end loop;
end;
/
update table_small set SMALL_VARIABLE_CHAR = 'toujour' where SMALL_FIXED_STRING='toujours';
delete from table_small where RAND_DATE='14-FEB-2020';
set serveroutput on
begin
  for i in 1..10000 loop
    insert into table_medium
    (INTEGER_NUMBER,FLOAT_NUMBER,RAND_DATE,SMALL_FIXED_STRING,BIG_FIXED_STRING,SMALL_VARIABLE_CHAR,BIG_VARIABLE_CHAR) 
    values (501,321.12,'14-FEB-2020', 'toujours','Abanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch', 'toujours','Abanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch'); 
  end loop;
end;
/
update table_medium set SMALL_VARIABLE_CHAR = 'toujour' where SMALL_FIXED_STRING='toujours';
delete from table_medium where RAND_DATE='14-FEB-2020';
set serveroutput on
begin
  for i in 1..10000 loop
    insert into table_big
    (INTEGER_NUMBER,FLOAT_NUMBER,RAND_DATE,SMALL_FIXED_STRING,BIG_FIXED_STRING,SMALL_VARIABLE_CHAR,BIG_VARIABLE_CHAR) 
    values (501,321.12,'14-FEB-2020', 'toujours','Abanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch', 'toujours','Abanfairpwllgwyngyllgogerychwyrndrobwllllantysiliogogogoch'); 
  end loop;
end;
/
update table_big set SMALL_VARIABLE_CHAR = 'toujour' where SMALL_FIXED_STRING='toujours';
delete from table_big where RAND_DATE='14-FEB-2020';
drop index small_int_key;
drop index small_float_key;
drop index small_date_key;
drop index small_schar_key;
drop index small_lchar_key;
drop index small_svchar_key;
drop index small_lvchar_key;
drop index medium_int_key;
drop index medium_float_key;
drop index medium_date_key;
drop index medium_schar_key;
drop index medium_lchar_key;
drop index medium_svchar_key;
drop index medium_lvchar_key;
drop index big_int_key;
drop index big_float_key;
drop index big_date_key;
drop index big_schar_key;
drop index big_lchar_key;
drop index big_svchar_key;
drop index big_lvchar_key;
spool off;
set termout on;
