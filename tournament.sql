
-- Delete DB is already exists
DROP DATABASE if exists tournament;

-- Create tournament database
CREATE DATABASE tournament;
\c tournament

-- Delete table(s) if already exist
DROP TABLE if exists players;
DROP TABLE if exists matches;

-- Create tables
CREATE TABLE players (
    id serial PRIMARY KEY,
    name text UNIQUE
);

CREATE TABLE matches (
    match_id serial PRIMARY KEY,
    player1_id INTEGER,
    player2_id INTEGER,
    FOREIGN KEY(player1_id) REFERENCES players(id),
    FOREIGN KEY(player2_id) REFERENCES players(id)
);

CREATE VIEW player_standings AS (
SELECT
    players.id,
    players.name,
    COUNT(
        CASE
            WHEN players.id = matches.player1_id THEN 1
        END) AS wins,
    COUNT(match_id) AS matches_played
FROM players
LEFT JOIN matches ON players.id IN (matches.player1_id, matches.player2_id)
GROUP BY
    players.id,
    players.name
ORDER BY
    wins DESC,
    matches_played DESC
);
