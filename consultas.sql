-- 1. Write a query in SQL to find the number of venues for EURO cup 2016. 
select count(venue_id) from soccer_venue;
+-----------------+
| count(venue_id) |
+-----------------+
|              10 |
+-----------------+

-- 2. Write a query in SQL to find the number goals scored in EURO cup 2016 within normal play Schedule. 
select count(goal_type) from goal_details where goal_type='N';
+------------------+
| count(goal_type) |
+------------------+
|               97 |
+------------------+

-- 3. Write a query in SQL to find the number of matches ended with draws.
select COUNT(RESULTS) from match_mast where results='DRAW';
+----------------+
| COUNT(RESULTS) |
+----------------+
|             11 |
+----------------+

-- 4.Write a query in SQL to find the number of self-goals scored in EURO cup 2016. 
select COUNT(goal_id) from goal_details where goal_type='O';
+----------------+
| COUNT(goal_id) |
+----------------+
|              3 |
+----------------+

-- 5.Write a query in SQL to count the number of matches ended with a results in group stage.
select COUNT(match_no) from match_mast where play_stage='G';
+-----------------+
| COUNT(match_no) |
+-----------------+
|              36 |
+-----------------+

-- 6.Write a query in SQL to find the number of matches were decided on penalties in the Round of 16
select COUNT(match_no) from match_mast where play_stage='R' AND decided_by='P';
+-----------------+
| COUNT(match_no) |
+-----------------+
|               1 |
+-----------------+

7
select play_date, match_no, goal_score from match_mast WHERE stop1_sec=0;
+------------+----------+------------+
| play_date  | match_no | goal_score |
+------------+----------+------------+
| 2016-06-12 |        4 | 1-1        |
+------------+----------+------------+

8
select count(team_id) from match_details where goal_score=1 and decided_by!='P' and win_loos='W';
+----------------+
| count(team_id) |
+----------------+
|             13 |
+----------------+

9
select COUNT(team_id) from player_in_out WHERE play_schedule='NT' and in_out='O';
+----------------+
| COUNT(team_id) |
+----------------+
|            275 |
+----------------+

10
select team_id Equipo, sum(kick_no) Total_Pateados from penalty_shootout group by(team_id);
+--------+----------------+
| Equipo | Total_Pateados |
+--------+----------------+
|   1208 |             90 |
|   1211 |             81 |
|   1213 |             50 |
|   1214 |             25 |
|   1221 |             25 |
+--------+----------------+

11
select soccer_country.country_name Equipo_Campeon from match_details INNER JOIN soccer_country ON match_details.team_id = soccer_country.country_id where match_details.play_stage='F' AND match_details.win_loos='W';
+----------------+
| Equipo_Campeon |
+----------------+
| Portugal       |
+----------------+

12
SELECT match_no
 FROM match_details
 INNER JOIN  soccer_country ON match_details.team_id = soccer_country.country_id
 WHERE  soccer_country.country_name='Germany' or soccer_country.country_name='Poland'
 GROUP BY match_no
 HAVING COUNT(DISTINCT team_id)=2;

13
 select player_mast.player_name Jugador, count(goal_details.goal_id) Goles
 from goal_details
 INNER JOIN player_mast ON player_mast.player_id = goal_details.player_id
 GROUP BY player_mast.player_name;
 
 
-- 14.Write a query in SQL to find the goalkeeper of the team Germany 
-- who didn't concede any goal in their group stage matches.
SELECT player_name, goal_score
FROM match_details
INNER JOIN player_mast ON player_mast.player_id = match_details.player_gk
INNER JOIN soccer_country ON soccer_country.country_id = match_details.team_id
WHERE play_stage='G'
GROUP BY player_name
soccer_country, match_mast

SELECT player_name, goal_score
    FROM match_details
    INNER JOIN player_mast ON player_mast.player_id=match_details.player_gk
    INNER JOIN soccer_country ON soccer_country.country_id=match_details.team_id
    WHERE play_stage='G'
    AND match_details.goal_score=0
    AND soccer_country.country_name='Germany';

-- 15. Write a query in SQL to find the match no. and teams who played the match
--  where highest number of penalty shots had been taken
SELECT match_no PARTIDO,soccer_country.country_name EQUIPO
from penalty_shootout
JOIN soccer_country ON penalty_shootout.team_id=soccer_country.country_id
GROUP BY match_no,country_name
ORDER BY count(kick_no)desc
LIMIT 2;

--16.Write a query in SQL to find the venues where penalty shootout matches played. 
SELECT venue_name
FROM match_mast
INNER JOIN soccer_venue ON match_mast.venue_id = soccer_venue.venue_id
WHERE decided_by='P';

--17
SELECT venue_name, city_id
FROM match_mast
INNER JOIN soccer_venue
soccer_city
play

--18
SELECT player_name, goal_id
FROM player_mast
INNER JOIN goal_details ON goal_details.player_id = player_mast.player_id
ORDER BY (player_id)desc;

--19
-- Write a query in SQL to find the scorer of only goal along with his country and 
--jersey number in the final of EURO cup 2016.
SELECT country_name



--20 
SELECT referee_name, country_name
FROM match_mast
INNER JOIN referee_mast ON match_mast.referee_id = referee_mast.referee_id
INNER JOIN soccer_country ON soccer_country.country_id = referee_mast.country_id
WHERE match_no = 1;

--21
SELECT ass_ref_name, country_name
FROM match_details
INNER JOIN asst_referee_mast ON match_details.ass_ref=asst_referee_mast.ass_ref_id
INNER JOIN soccer_country ON asst_referee_mast.country_id=soccer_country.country_id
WHERE play_stage='F' 

--22
SELECT venue_name ESTADIO, aud_capacity CAPACIDAD, audence AUDIENCIA
FROM match_mast
INNER JOIN soccer_venue ON match_mast.venue_id = soccer_venue.venue_id
WHERE play_stage = 'F';