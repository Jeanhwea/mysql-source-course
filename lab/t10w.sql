use rtc;

drop table if exists t10w;

create table t10w (
  k1 int,
  c1 varchar(8),
  c2 varchar(8),
  primary key (k1)
);

delimiter //

create procedure mock10w ()
begin
declare
  i int;
  set i = 1;
  while (i <= 100000)
  do insert into t10w
    values (i, i, i);
  set i = i + 1;
end while;
end //

delimiter ;

call mock10w();
