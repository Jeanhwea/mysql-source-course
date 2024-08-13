use rtc;

create table t (
  k1 int,
  c1 varchar(8),
  c2 varchar(8),
  primary key (k1)
);

delimiter ;;

create procedure mockdata ()
begin
declare
  i int;
  set i = 1;
  while (i <= 100000)
  do insert into t
    values (i, i, i);
  set i = i + 1;
end while;
end;;

delimiter ;

call mockdata();
