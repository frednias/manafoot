DROP TYPE E_VISIBILITY CASCADE;
CREATE TYPE E_VISIBILITY AS ENUM ('background', 'foreground');
DROP TYPE E_STATUS CASCADE;
CREATE TYPE E_STATUS AS ENUM ('todo', 'ok', 'err');

-- PUBLIC TABLES

DROP TABLE cou_country;
CREATE TABLE cou_country (
	cou_id SERIAL,
	cou_name TEXT
);
-- "cou_country_cou_id_seq"

DROP TABLE ass_association;
CREATE TABLE ass_association (
	ass_id SERIAL,
	ass_name TEXT,
	ass_cou_id INTEGER
);

DROP TABLE lk_mbr_ass;
CREATE TABLE lk_mbr_ass (
	mbr_ass_id__master INTEGER,
	mbr_ass_id__slave INTEGER
);

DROP TABLE tea_team;
CREATE TABLE tea_team (
	tea_id SERIAL,
	tea_name TEXT,
	tea_ass_id INTEGER,
    tea_gender varchar(1) default 'M'
);

DROP TABLE gam_game;
CREATE TABLE gam_game (
    gam_id SERIAL,
 	gam_ins_date DATE,
	gam_resume_date DATE
 );

DROP TABLE cpt_competition;
CREATE TABLE cpt_competition (
    cpt_id SERIAL,
    cpt_name TEXT,
    cpt_ass_id INTEGER,
    cpt_elo_level INTEGER
);

DROP TABLE mtt_match_type;
CREATE TABLE mtt_match_type (
    mtt_id SERIAL,
    mtt_label TEXT
);

DROP TABLE chi_championship_info;
CREATE TABLE chi_championship_info (
    chi_id SERIAL,
    chi_cpt_id INTEGER,
    chi_ass_id INTEGER,
    chi_nb_team INTEGER, -- per group
    chi_nb_group INTEGER,
    chi_nb_promote INTEGER,
    chi_nb_relegate INTEGER,
    chi_level INTEGER -- pyramidal level
);
