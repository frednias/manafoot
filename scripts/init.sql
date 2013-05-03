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

CREATE TABLE init.cpi_competition_instance (
    cpi_id SERIAL,
    cpi_ins_date DATE,
    cpi_cpt_id INTEGER,
    cpi_milesime TEXT,
    cpi_data TEXT
);

CREATE TABLE init.mat_match (
    mat_id SERIAL,
    mat_ins_date DATE,
    mat_cpi_id INTEGER,
    mat_round TEXT,
    mat_tea_id__1 INTEGER,
    mat_tea_id__2 INTEGER,
    mat_score__1 INTEGER,
    mat_score__2 INTEGER,
    mat_date DATE,
    mat_mtt_id INTEGER
);

CREATE TABLE init.fla_flash (
    fla_id SERIAL,
    fla_ins_date DATE,
    fla_subject TEXT,
    fla_body TEXT
);

CREATE TABLE init.mar_match_referer (
    mar_mat_id INTEGER,
    mar_mat_id__referer INTEGER
);
