select * from performance_schema.setup_actors;

update performance_schema.setup_instruments set ENABLED = 'YES', TIMED = 'YES'
 where name like '%statement/%';
update performance_schema.setup_instruments set ENABLED = 'YES', TIMED = 'YES'
 where name like '%stage/%';

update performance_schema.setup_consumers set ENABLED = 'YES'
 where name like '%events_statements_%';
update performance_schema.setup_consumers set ENABLED = 'YES'
 where name like '%events_stages_%';
