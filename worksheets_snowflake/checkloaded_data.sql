USE ROLE SYSADMIN;

SELECT count (*) as rader
FROM sportsapi365.matches;

SELECT *
FROM sportsapi365.matches;

SELECT COUNT(DISTINCT MATCH_ID) as ids
FROM sportsapi365.matches;

SELECT round_id
FROM sportsapi365.matches;

SELECT count (*) as nr_round
FROM sportsapi365.matches
WHERE round_id = 4;  -- resultatet blir 64 -> korrekt

SELECT count (*) as nr_round
FROM sportsapi365.matches
WHERE round_id = 5; -- resultatet blir 31

SELECT count (*) as nr_round
FROM sportsapi365.matches
WHERE round_id = 6; -- resultatet blir 15

SELECT count(*) as nr_round
FROM sportsapi365.matches
WHERE round_id = 7; -- resultatet blir 8

SELECT count(*) as nr_round
FROM sportsapi365.matches
WHERE round_id = 9; -- resultatet blir 4

SELECT count(*) as nr_round
FROM sportsapi365.matches
WHERE round_id = 10; -- resultatet blir 2 

SELECT count(*) as nr_round
FROM sportsapi365.matches
WHERE round_id = 12; -- resultatet blir 1

SELECT * 
FROM sportsapi365.matches
WHERE round_id = 4;

SELECT count(*) as stat_rader
FROM sportsapi365.statistic; -- detta ger 125

SELECT COUNT(DISTINCT match_id)
FROM sportsapi365.statistic;

SELECT COUNT(*) AS stat_utan_match
FROM sportsapi365.statistic s
LEFT JOIN sportsapi365.matches m
    ON s.match_id = m.id
WHERE m.id IS NULL;