create table icc_world_cup
(
Team_1 Varchar(20),
Team_2 Varchar(20),
Winner Varchar(20)
);
INSERT INTO icc_world_cup values('India','SL','India');
INSERT INTO icc_world_cup values('SL','Aus','Aus');
INSERT INTO icc_world_cup values('SA','Eng','Eng');
INSERT INTO icc_world_cup values('Eng','NZ','NZ');
INSERT INTO icc_world_cup values('Aus','India','India');

select * from icc_world_cup;

select Team_name, count(1) as Total_matches, sum(win_flag) as total_wins, count(1) - sum(win_flag) as total_loses
from (
select Team_1 as Team_name , case when Team_1=Winner then 1 else 0 end as win_flag
from icc_world_cup
union all
select Team_2 as Team_name , case when Team_2=winner then 1 else 0 end as win_flag
from icc_world_cup) A
group by Team_name
order by Total_matches desc;
