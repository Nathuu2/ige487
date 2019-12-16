
--- Work log Mart
INSERT INTO analyticDB.work_week_dimension
SELECT date_trunc('week', generate_series(timestamp '2000-01-01', NOW() + INTERVAL '7 days', '1 week')::DATE) AS week_date;
