SELECT game_id,game_level,gamer_id,competition_date,score,
  SUM(score)
  OVER (PARTITION BY game_id, gamer_id
        ORDER BY competition_date)
  AS total_score
FROM competition;
