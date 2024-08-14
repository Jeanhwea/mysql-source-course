use rtc;

drop table if exists t200w;

create table t200w (
  k1 int,
  c1 varchar(8),
  c2 varchar(8),
  primary key (k1)
);

delimiter //

create procedure mock200w ()
begin
declare
  i int;
  set i = 1;
  while (i <= 2000000)
  do insert into t200w
    values (i, i, i);
  set i = i + 1;
end while;
end //

delimiter ;

call mock200w();
