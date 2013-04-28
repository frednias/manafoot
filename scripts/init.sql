-- SPECIFIC TABLES

DROP SCHEMA init CASCADE;
CREATE SCHEMA init;

CREATE TABLE init.evt_event (
    evt_id SERIAL,
    evt_ins_date DATE,
    evt_date DATE,
    evt_descr TEXT,
    evt_ass_id INTEGER,
    evt_function TEXT,
    evt_params TEXT,
    evt_visibility E_VISIBILITY,
    evt_status E_STATUS
);
-- "evt_event_evt_id_seq"

CREATE TABLE init.elo_elo (
    elo_tea_id INTEGER,
    elo_points INTEGER
);

CREATE TABLE init.elh_elo_history (
    elh_tea_id INTEGER,
    elh_points INTEGER,
    elh_evt_id INTEGER,
    elh_date DATE
);

