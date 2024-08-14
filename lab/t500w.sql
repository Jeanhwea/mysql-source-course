use rtc;

drop table if exists t500w;

create table t500w (
  k1 int,
  c1 varchar(8),
  c2 varchar(8),
  primary key (k1)
);

delimiter //

create procedure mock500w ()
begin
declare
  i int;
  set i = 1;
  while (i <= 5000000)
  do insert into t500w
    values (i, i, i);
  set i = i + 1;
end while;
end //

delimiter ;

call mock500w();
