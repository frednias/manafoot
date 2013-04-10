
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
	tea_ass_id INTEGER
);

-- SPECIFIC TABLES

DROP SCHEMA init CASCADE;
CREATE SCHEMA init;

CREATE TABLE init.hst_history (
	hst_id SERIAL,
	hst_date DATE,
	hst_descr TEXT
);
-- "hst_history_hst_id_seq"

CREATE TABLE init.elo_elo (
	elo_tea_id INTEGER,
	elo_points INTEGER
);


-- DATA

INSERT INTO
	init.hst_history
(
	hst_date,
	hst_descr
)
VALUES (
	'2011-03-09',
	'Classement mondial FIFA - Mars 2011'
);


INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1,'FIFA',NULL);

INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (11,'UEFA',NULL);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (12,'CAF',NULL);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (13,'AFC',NULL);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (14,'OFC',NULL);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (15,'CONMABOL',NULL);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (16,'CONCACAF',NULL);

INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (101,'Union nord-am�ricaine de football',NULL);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,101);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (102,'Union centre-am�ricaine de football',NULL);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,102);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (103,'Union carib�enne de football',NULL);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,103);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (104,'Union nord-africaine de football',NULL);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,104);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (105,'Union des f�d�rations ouest-africaines de football',NULL);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,105);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (106,'Union des f�d�rations de football d''Afrique centrale',NULL);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,106);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (107,'Council for East and Central Africa Football Association',NULL);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,107);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (108,'Council of Southern Africa Football Associations',NULL);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,108);


INSERT INTO cou_country (cou_name) VALUES ('Espagne'); -- 1
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1001,'F�d�ration royale espagnole de football',1);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1001);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1001);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Espagne de football',1001); -- 1
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (1,1880);

INSERT INTO cou_country (cou_name) VALUES ('Pays-Bas');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1002,'F�d�ration royale n�erlandaise de football',2);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1002);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1002);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des Pays-Bas de football',1002);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (2,1730);

INSERT INTO cou_country (cou_name) VALUES ('Mexique');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1003,'F�d�ration du Mexique de football', 3);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1003);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1003);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (101,1003);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Mexique de football',1003);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (3,811);

INSERT INTO cou_country (cou_name) VALUES ('�tats-Unis');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1004,'F�d�ration des �tats-Unis de soccer', 4);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1004);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1004);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (101,1004);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des �tats-Unis de soccer',1004);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (4,894);

INSERT INTO cou_country (cou_name) VALUES ('Canada');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1005,'Association canadienne de soccer', 5);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1005);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1005);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (101,1005);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Canada de soccer',1005); -- 5
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (5,391);

INSERT INTO cou_country (cou_name) VALUES ('B�lize');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1006,'F�d�ration du B�lize de football', 6);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1006);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1006);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (102,1006);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Belize de football',1006);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (6,66);

INSERT INTO cou_country (cou_name) VALUES ('Costa Rica');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1007,'F�d�ration du Costa Rica de football', 7);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1007);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1007);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (102,1007);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Costa Rica de football',1007);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (7,542);

INSERT INTO cou_country (cou_name) VALUES ('Guatemala');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1008,'F�d�ration du Guatemala de football', 8);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1008);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1008);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (102,1008);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Guatemala de football',1008);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (8,220);

INSERT INTO cou_country (cou_name) VALUES ('Honduras');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1009,'F�d�ration du Honduras de football', 9);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1009);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1009);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (102,1009);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Honduras de football',1009);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (9,620);

INSERT INTO cou_country (cou_name) VALUES ('Nicaragua');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1010,'F�d�ration du Nicaragua de football', 10);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1010);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1010);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (102,1010);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Nicaragua de football',1010); -- 10
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (10,75);

INSERT INTO cou_country (cou_name) VALUES ('Salvador');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1011,'F�d�ration du Salvador de football', 11);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1011);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1011);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (102,1011);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Salvador de football',1011);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (11,373);

INSERT INTO cou_country (cou_name) VALUES ('Panama');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1012,'F�d�ration du Panama de football', 12);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1012);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1012);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (102,1012);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Panama de football',1012); -- 12
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (12,482);

INSERT INTO cou_country (cou_name) VALUES ('Anguilla');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1013,'F�d�ration d''Anguilla de football', 13);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1013);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1013);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1013);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Anguilla de football',1013); -- 13
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (13,0);

INSERT INTO cou_country (cou_name) VALUES ('Antigua-et-Barbuda');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1014,'F�d�ration du Antigua-et-Barbuda de football', 14);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1014);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1014);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1014);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Antigua-et-Barbuda de football',1014); -- 14
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (14,313);

INSERT INTO cou_country (cou_name) VALUES ('Aruba');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1015,'F�d�ration d''Aruba de football', 15);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1015);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1015);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1015);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Aruba de football',1015); -- 15
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (15,7);

INSERT INTO cou_country (cou_name) VALUES ('Bahamas');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1016,'F�d�ration des Bahamas de football', 16);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1016);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1016);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1016);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des Bahamas de football',1016); -- 16
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (16,13);

INSERT INTO cou_country (cou_name) VALUES ('Barbade');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1017,'F�d�ration de la Barbade de football', 17);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1017);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1017);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1017);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de la Barbade de football',1017); -- 17
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (17,167);

INSERT INTO cou_country (cou_name) VALUES ('Bermudes');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1018,'F�d�ration des Bermudes de football', 18);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1018);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1018);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1018);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des Bermudes de football',1018); -- 18
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (18,74);

INSERT INTO cou_country (cou_name) VALUES ('Cura�ao');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1019,'F�d�ration de Cura�ao de football', 19);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1019);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1019);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1019);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Cura�ao de football',1019); -- 19
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (19,115);

INSERT INTO cou_country (cou_name) VALUES ('Cuba');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1020,'F�d�ration de Cuba de football', 20);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1020);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1020);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1020);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Cuba de football',1020); -- 20
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (20,503);

INSERT INTO cou_country (cou_name) VALUES ('Dominique');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1021,'F�d�ration de Dominique de football', 21);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1021);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1021);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1021);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Dominique de football',1021); -- 21
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (21,193);

INSERT INTO cou_country (cou_name) VALUES ('Grenade');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1022,'F�d�ration grenadienne de football', 22);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1022);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1022);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1022);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Grenade de football',1022); -- 22
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (22,360);

INSERT INTO cou_country (cou_name) VALUES ('Guadeloupe'); -- 23
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1023,'Ligue guadeloup�enne de football', 23);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1023);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1023);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Guadeloupe de football',1023); -- 23

INSERT INTO cou_country (cou_name) VALUES ('Guyana'); -- 24
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1024,'F�d�ration du Guyana de football', 24);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1024);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1024);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1024);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Guyana de football',1024); -- 24
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (24,284);

INSERT INTO cou_country (cou_name) VALUES ('Guyane'); -- 25
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1025,'Ligue de football de la Guyane', 25);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1025);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1025);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Guyane de football',1025); -- 25

INSERT INTO cou_country (cou_name) VALUES ('Ha�ti'); -- 26
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1026,'F�d�ration ha�tienne de football', 26);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1026);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1026);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1026);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Ha�ti de football',1026); -- 26
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (26,325);

INSERT INTO cou_country (cou_name) VALUES ('�les Ca�mans'); -- 27
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1027,'F�d�ration des �les Ca�mans de football', 27);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1027);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1027);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1027);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des �les Ca�mans de football',1027); -- 27
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (27,90);

INSERT INTO cou_country (cou_name) VALUES ('�les Vierges des �tats-Unis'); -- 28
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1028,'F�d�ration des �les Vierges des �tats-Unis de football', 28);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1028);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1028);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1028);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des �les Vierges des �tats-Unis de football',1028); -- 28
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (28,5);

INSERT INTO cou_country (cou_name) VALUES ('�les Vierges britanniques'); -- 29
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1029,'F�d�ration des �les Vierges britanniques de football', 29);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1029);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1029);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1029);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des �les Vierges britanniques de football',1029); -- 29
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (29,41);

INSERT INTO cou_country (cou_name) VALUES ('Jama�que'); -- 30
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1030,'F�d�ration de Jama�que de football', 30);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1030);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1030);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1030);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Jama�que de football',1030); -- 30
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (30,555);

INSERT INTO cou_country (cou_name) VALUES ('Martinique'); -- 31
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1031,'Ligue de football de la Martinique', 31);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1031);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1031);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de la Martinique de football',1031); -- 31

INSERT INTO cou_country (cou_name) VALUES ('Montserrat'); -- 32
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1032,'F�d�ration de Montserrat de football', 32);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1032);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1032);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1032);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Montserrat de football',1032); -- 32
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (32,0);

INSERT INTO cou_country (cou_name) VALUES ('Porto Rico'); -- 33
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1033,'F�d�ration de Porto Rico de football', 33);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1033);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1033);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1033);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Porto Rico de football',1033); -- 33
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (33,187);

INSERT INTO cou_country (cou_name) VALUES ('R�publique dominicaine'); -- 34
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1034,'F�d�ration de R�publique dominicaine de football', 34);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1034);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1034);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1034);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de R�publique dominicaine de football',1034); -- 34
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (34,66);

INSERT INTO cou_country (cou_name) VALUES ('Saint-Christophe-et-Ni�v�s'); -- 35
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1035,'F�d�ration de Saint-Christophe-et-Ni�v�s de football', 35);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1035);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1035);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1035);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Saint-Christophe-et-Ni�v�s de football',1035); -- 35
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (35,245);

INSERT INTO cou_country (cou_name) VALUES ('Saint-Martin (FR)'); -- 36
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1036,'Comit� de football des �les du Nord', 36);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1036);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1036);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Saint-Martin de football',1036); -- 36

INSERT INTO cou_country (cou_name) VALUES ('Sainte-Lucie'); -- 37
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1037,'F�d�ration de Sainte-Lucie de football', 37);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1037);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1037);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1037);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Sainte-Lucie de football',1037); -- 37
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (37,37);

INSERT INTO cou_country (cou_name) VALUES ('Saint-Vincent-et-les-Grenadines'); -- 38
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1038,'F�d�ration de Saint-Vincent-et-les-Grenadines de football', 38);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1038);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1038);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1038);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Saint-Vincent-et-les-Grenadines de football',1038); -- 38
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (38,113);

INSERT INTO cou_country (cou_name) VALUES ('Sint Maarten'); -- 39
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1039,'F�d�ration de Sint Maarten de football', 39);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1039);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1039);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Sint Maarten de football',1039); -- 39

INSERT INTO cou_country (cou_name) VALUES ('Suriname'); -- 40
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1040,'F�d�ration du Suriname de football', 40);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1040);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1040);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1040);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Suriname de football',1040); -- 40
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (40,257);

INSERT INTO cou_country (cou_name) VALUES ('Trinit�-et-Tobago'); -- 41
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1041,'F�d�ration de Trinit�-et-Tobago de football', 41);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1041);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1041);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1041);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Trinit�-et-Tobago de football',1041); -- 41
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (41,352);

INSERT INTO cou_country (cou_name) VALUES ('�les Turques-et-Ca�ques'); -- 42
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1042,'F�d�ration des �les Turques-et-Ca�ques de football', 42);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1042);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1042);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1042);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des �les Turques-et-Ca�ques de football',1042); -- 42
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (42,13);

INSERT INTO cou_country (cou_name) VALUES ('Argentine'); -- 43
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1043,'Association du football argentin', 43);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1043);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1043);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Argentine de football',1043); -- 43
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (43,1412);

INSERT INTO cou_country (cou_name) VALUES ('Br�sil'); -- 44
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1044,'Conf�d�ration br�silienne de football', 44);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1044);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1044);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Br�sil de football',1044); -- 44
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (44,1412);

INSERT INTO cou_country (cou_name) VALUES ('Uruguay'); -- 45
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1045,'Association uruguayenne de football', 45);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1045);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1045);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Uruguay de football',1045); -- 45
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (45,1172);

INSERT INTO cou_country (cou_name) VALUES ('Chili'); -- 46
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1046,'F�d�ration du Chili de football', 46);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1046);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1046);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Chili de football',1046); -- 46
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (46,954);

INSERT INTO cou_country (cou_name) VALUES ('Paraguay'); -- 47
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1047,'Association paraguayenne de football', 47);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1047);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1047);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Paraguay de football',1047); -- 47
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (47,835);

INSERT INTO cou_country (cou_name) VALUES ('Equateur'); -- 48
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1048,'F�d�ration �quatorienne de football', 48);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1048);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1048);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''�quateur de football',1048); -- 48
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (48,553);

INSERT INTO cou_country (cou_name) VALUES ('Colombie'); -- 49
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1049,'F�d�ration colombienne de football', 49);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1049);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1049);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Colombie de football',1049); -- 49
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (49,551);

INSERT INTO cou_country (cou_name) VALUES ('P�rou'); -- 50
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1050,'F�d�ration p�ruvienne de football', 50);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1050);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1050);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du P�rou de football',1050); -- 50
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (50,530);

INSERT INTO cou_country (cou_name) VALUES ('Venezuela'); -- 51
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1051,'F�d�ration v�n�zu�lienne de football', 51);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1051);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1051);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Venezuela de football',1051); -- 51
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (51,505);

INSERT INTO cou_country (cou_name) VALUES ('Bolivie'); -- 52
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1052,'F�d�ration bolivienne de football', 52);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1052);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1052);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Bolivie de football',1052); -- 52
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (52,332);

INSERT INTO cou_country (cou_name) VALUES ('Albanie'); -- 53
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1053,'F�d�ration albanaise de football',53);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1053);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1053);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Albanie de football',1053);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (53,464);

INSERT INTO cou_country (cou_name) VALUES ('Allemagne'); -- 54
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1054,'F�d�ration allemande de football',54);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1054);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1054);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Allemagne de football',1054);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (54,1486);

INSERT INTO cou_country (cou_name) VALUES ('Andorre'); -- 55
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1055,'F�d�ration d''Andorre de football',55);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1055);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1055);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Andorre de football',1055);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (55,0);

INSERT INTO cou_country (cou_name) VALUES ('Angleterre'); -- 56
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1056,'F�d�ration anglaise de football',56);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1056);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1056);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Angleterre de football',1056);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (56,1212);

INSERT INTO cou_country (cou_name) VALUES ('Arm�nie'); -- 57
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1057,'F�d�ration de football d''Arm�nie',57);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1057);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1057);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Arm�nie de football',1057);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (57,501);

INSERT INTO cou_country (cou_name) VALUES ('Autriche'); -- 58
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1058,'F�d�ration autrichienne de football',58);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1058);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1058);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Arm�nie de football',1058);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (58,524);

INSERT INTO cou_country (cou_name) VALUES ('Azerba�djan'); -- 59
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1059,'F�d�ration d''Azerba�djan de football',59);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1059);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1059);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Azerba�djan de football',1059);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (59,320);

INSERT INTO cou_country (cou_name) VALUES ('Belgique'); -- 60
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1060,'Union royale belge des soci�t�s de football association',60);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1060);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1060);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Belgique de football',1060);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (60,512);

INSERT INTO cou_country (cou_name) VALUES ('Bi�lorussie'); -- 61
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1061,'F�d�ration bi�lorusse de football',61);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1061);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1061);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Bi�lorussie de football',1061);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (61,634);

INSERT INTO cou_country (cou_name) VALUES ('Bosnie-Herz�govine'); -- 62
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1062,'F�d�ration de football de Bosnie-Herz�govine',62);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1062);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1062);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Bosnie-Herz�govine de football',1062);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (62,534);

INSERT INTO cou_country (cou_name) VALUES ('Bulgarie'); -- 63
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1063,'F�d�ration de Bulgarie de football',63);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1063);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1063);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Bulgarie de football',1063);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (63,557);

INSERT INTO cou_country (cou_name) VALUES ('Chypre'); -- 64
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1064,'F�d�ration chypriote de football',64);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1064);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1064);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Chypre de football',1064);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (64,376);

INSERT INTO cou_country (cou_name) VALUES ('Croatie'); -- 65
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1065,'F�d�ration croate de football',65);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1065);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1065);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Croatie de football',1065);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (65,1071);

INSERT INTO cou_country (cou_name) VALUES ('Danemark'); -- 66
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1066,'F�d�ration danoise de football',66);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1066);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1066);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Danemark de football',1066);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (66,788);

INSERT INTO cou_country (cou_name) VALUES ('�cosse'); -- 67
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1067,'F�d�ration �cossaise de football',67);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1067);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1067);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''�cosse de football',1067);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (67,551);

INSERT INTO cou_country (cou_name) VALUES ('Estonie'); -- 68
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1068,'F�d�ration estonienne de football',68);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1068);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1068);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Estonie de football',1068);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (68,407);

INSERT INTO cou_country (cou_name) VALUES ('�les F�ro�'); -- 69
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1069,'F�d�ration des �les F�ro� de football',69);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1069);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1069);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des �les F�ro� de football',1069);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (69,171);

INSERT INTO cou_country (cou_name) VALUES ('Finlande'); -- 70
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1070,'Association finlandaise de football',70);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1070);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1070);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Finlande de football',1070);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (70,427);

INSERT INTO cou_country (cou_name) VALUES ('France'); -- 71
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1071,'F�d�ration fran�aise de football',71);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1071);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1071);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de France de football',1071);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (71,913);

INSERT INTO cou_country (cou_name) VALUES ('G�orgie'); -- 72
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1072,'F�d�ration de G�orgie de football',72);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1072);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1072);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de G�orgie de football',1072);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (72,469);

INSERT INTO cou_country (cou_name) VALUES ('Gr�ce'); -- 73
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1073,'F�d�ration hell�nique de football',73);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1073);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1073);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Gr�ce de football',1073);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (73,1038);

INSERT INTO cou_country (cou_name) VALUES ('Hongrie'); -- 74
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1074,'F�d�ration hongroise de football',74);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1074);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1074);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Hongrie de football',1074);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (74,654);

INSERT INTO cou_country (cou_name) VALUES ('Irlande'); -- 75
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1075,'F�d�ration d''Irlande de football',75);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1075);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1075);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de R�publique d''Irlande de football',1075);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (75,699);

INSERT INTO cou_country (cou_name) VALUES ('Irlande Du Nord'); -- 76
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1076,'Association irlandaise de football',76);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1076);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1076);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Irlande du Nord de football',1076);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (76,605);

INSERT INTO cou_country (cou_name) VALUES ('Islande'); -- 77
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1077,'F�d�ration d''Islande de football',77);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1077);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1077);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Islande de football',1077);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (77,256);

INSERT INTO cou_country (cou_name) VALUES ('Isra�l'); -- 78
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1078,'F�d�ration d''Isra�l de football',78);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1078);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1078);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Isra�l de football',1078);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (78,532);

INSERT INTO cou_country (cou_name) VALUES ('Italie'); -- 79
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1079,'F�d�ration italienne de football',79);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1079);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1079);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Italie de football',1079);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (79,957);

INSERT INTO cou_country (cou_name) VALUES ('Kazakhstan'); -- 80
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1080,'F�d�ration du Kazakhstan de football',80);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1080);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1080);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Kazakhstan de football',1080);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (80,178);

INSERT INTO cou_country (cou_name) VALUES ('Lettonie'); -- 81
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1081,'F�d�ration de Lettonie de football',81);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1081);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1081);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Lettonie de football',1081);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (81,448);

INSERT INTO cou_country (cou_name) VALUES ('Liechtenstein'); -- 82
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1082,'F�d�ration du Liechtenstein de football',82);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1082);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1082);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipu de Liechtenstein de football',1082);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (82,134);

INSERT INTO cou_country (cou_name) VALUES ('Lituanie'); -- 83
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1083,'F�d�ration de Lituanie de football',83);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1083);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1083);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipu de Lituanie de football',1083);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (83,541);

INSERT INTO cou_country (cou_name) VALUES ('Luxembourg'); -- 84
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1084,'F�d�ration luxembourgeoise de football',84);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1084);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1084);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Luxembourg de football',1084);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (84,248);

INSERT INTO cou_country (cou_name) VALUES ('Mac�doine'); -- 85
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1085,'F�d�ration de Mac�doine de football',85);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1085);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1085);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Mac�doine de football',1085);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (85,400);

INSERT INTO cou_country (cou_name) VALUES ('Malte'); -- 86
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1086,'F�d�ration de Malte de football',86);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1086);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1086);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Malte de football',1086);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (86,91);

INSERT INTO cou_country (cou_name) VALUES ('Moldavie'); -- 87
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1087,'F�d�ration moldave de football',87);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1087);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1087);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Moldavie de football',1087);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (87,383);

INSERT INTO cou_country (cou_name) VALUES ('Mont�n�gro'); -- 88
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1088,'F�d�ration du Mont�n�gro de football',88);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1088);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1088);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Mont�n�gro de football',1088);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (88,824);

INSERT INTO cou_country (cou_name) VALUES ('Pays de Galles'); -- 89
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1089,'F�d�ration de football de Galles',89);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1089);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1089);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du pays de Galles de football',1089);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (89,251);

INSERT INTO cou_country (cou_name) VALUES ('Pologne'); -- 90
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1090,'F�d�ration polonaise de football',90);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1090);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1090);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Pologne de football',1090);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (90,474);

INSERT INTO cou_country (cou_name) VALUES ('Portugal'); -- 91
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1091,'F�d�ration portugaise de football',91);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1091);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1091);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Portugal de football',1091);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (91,1060);

INSERT INTO cou_country (cou_name) VALUES ('R�publique tch�que'); -- 92
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1092,'F�d�ration de R�publique tch�que de football',92);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1092);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1092);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de R�publique tch�que de football',1092);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (92,739);

INSERT INTO cou_country (cou_name) VALUES ('Roumanie'); -- 93
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1093,'F�d�ration roumaine de football',93);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1093);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1093);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Roumanie de football',1093);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (93,549);

INSERT INTO cou_country (cou_name) VALUES ('Russie'); -- 94
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1094,'F�d�ration de Russie de football',94);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1094);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1094);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Russie de football',1094);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (94,956);

INSERT INTO cou_country (cou_name) VALUES ('Saint-Marin'); -- 95
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1095,'F�d�ration de Saint-Marin de football',95);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1095);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1095);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Saint-Marin de football',1095);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (95,0);

INSERT INTO cou_country (cou_name) VALUES ('Serbie'); -- 96
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1096,'F�d�ration de Serbie de football',96);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1096);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1096);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Serbie de football',1096);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (96,872);

INSERT INTO cou_country (cou_name) VALUES ('Slovaquie'); -- 97
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1097,'F�d�ration slovaque de football',97);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1097);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1097);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Slovaquie de football',1097);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (97,861);

INSERT INTO cou_country (cou_name) VALUES ('Slov�nie'); -- 98
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1098,'F�d�ration de Slov�nie de football',98);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1098);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1098);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Slov�nie de football',1098);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (98,915);

INSERT INTO cou_country (cou_name) VALUES ('Su�de'); -- 99
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1099,'F�d�ration su�doise de football',99);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1099);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1099);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Su�de de football',1099);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (99,744);

INSERT INTO cou_country (cou_name) VALUES ('Suisse'); -- 100
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1100,'Association suisse de football',100);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1100);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1100);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Suisse de football',1100);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (100,839);

INSERT INTO cou_country (cou_name) VALUES ('Turquie'); -- 101
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1101,'F�d�ration de Turquie de football',101);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1101);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1101);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Turquie de football',1101);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (101,728);

INSERT INTO cou_country (cou_name) VALUES ('Ukraine'); -- 102
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1102,'F�d�ration de football d''Ukraine',102);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1102);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1102);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Ukraine de football',1102);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (102,707);

INSERT INTO cou_country (cou_name) VALUES ('Norv�ge'); -- 103
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1103,'F�d�ration de Norv�ge de football',103);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1103);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1103);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Norv�ge de football',1103);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (103,957);

INSERT INTO cou_country (cou_name) VALUES ('Alg�rie'); -- 104
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1104,'F�d�ration alg�rienne de football',104);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1104);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1104);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (104,1104);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Alg�rie de football',1104);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (104,539);

INSERT INTO cou_country (cou_name) VALUES ('�gypte'); -- 105
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1105,'F�d�ration �gyptienne de football',105);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1105);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1105);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (104,1105);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''�gypte de football',1105);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (105,685);

INSERT INTO cou_country (cou_name) VALUES ('Libye'); -- 106
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1106,'F�d�ration de Libye de football',106);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1106);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1106);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (104,1106);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Libye de football',1106);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (106,472);

INSERT INTO cou_country (cou_name) VALUES ('Maroc'); -- 107
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1107,'F�d�ration royale marocaine de football',107);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1107);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1107);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (104,1107);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Maroc de football',1107);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (107,493);

INSERT INTO cou_country (cou_name) VALUES ('Tunisie'); -- 108
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1108,'F�d�ration tunisienne de football',108);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1108);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1108);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (104,1108);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Tunisie de football',1108);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (108,571);

INSERT INTO cou_country (cou_name) VALUES ('Cap-Vert'); -- 109
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1109,'F�d�ration du Cap-Vert de football',109);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1109);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1109);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1109);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Cap-Vert de football',1109);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (109,464);

INSERT INTO cou_country (cou_name) VALUES ('Gambie'); -- 110
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1110,'F�d�ration de Gambie de football',110);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1110);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1110);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1110);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Gambie de football',1110);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (110,297);

INSERT INTO cou_country (cou_name) VALUES ('Guin�e'); -- 111
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1111,'F�d�ration guin�enne de football',111);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1111);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1111);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1111);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Guin�e de football',1111);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (111,569);

INSERT INTO cou_country (cou_name) VALUES ('Guin�e-Bissau'); -- 112
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1112,'F�d�ration de Guin�e-Bissau de football',112);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1112);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1112);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1112);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Guin�e-Bissau de football',1112);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (112,168);

INSERT INTO cou_country (cou_name) VALUES ('Liberia'); -- 113
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1113,'F�d�ration du Liberia de football',113);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1113);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1113);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1113);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Liberia de football',1113);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (113,82);

INSERT INTO cou_country (cou_name) VALUES ('Mauritanie'); -- 114
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1114,'F�d�ration de football de la R�publique islamique de Mauritanie',114);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1114);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1114);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1114);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Mauritanie de football',1114);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (114,49);

INSERT INTO cou_country (cou_name) VALUES ('S�n�gal'); -- 115
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1115,'F�d�ration s�n�galaise de football',115);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1115);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1115);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1115);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du S�n�gal de football',1115);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (115,477);

INSERT INTO cou_country (cou_name) VALUES ('Sierra Leone'); -- 116
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1116,'F�d�ration de Sierra Leone de football',116);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1116);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1116);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1116);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Sierra Leone de football',1116);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (116,233);

INSERT INTO cou_country (cou_name) VALUES ('B�nin'); -- 117
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1117,'F�d�ration b�ninoise de football',117);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1117);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1117);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1117);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du B�nin de football',1117);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (117,413);

INSERT INTO cou_country (cou_name) VALUES ('Burkina Faso'); -- 118
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1118,'F�d�ration burkinab� de football',118);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1118);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1118);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1118);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Burkina Faso de football',1118);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (118,605);

INSERT INTO cou_country (cou_name) VALUES ('C�te d''Ivoire'); -- 119
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1119,'F�d�ration ivoirienne de football',119);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1119);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1119);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1119);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de C�te d''Ivoire de football',1119);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (119,824);

INSERT INTO cou_country (cou_name) VALUES ('Ghana'); -- 120
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1120,'F�d�ration du Ghana de football',120);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1120);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1120);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1120);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Ghana de football',1120);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (120,931);

INSERT INTO cou_country (cou_name) VALUES ('Mali'); -- 121
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1121,'F�d�ration malienne de football',121);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1121);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1121);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1121);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Mali de football',1121);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (121,389);

INSERT INTO cou_country (cou_name) VALUES ('Niger'); -- 122
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1122,'F�d�ration nig�rienne de football',122);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1122);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1122);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1122);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Niger de football',1122);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (122,299);

INSERT INTO cou_country (cou_name) VALUES ('Nigeria'); -- 123
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1123,'F�d�ration du Nigeria de football',123);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1123);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1123);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1123);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Nigeria de football',1123);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (123,609);

INSERT INTO cou_country (cou_name) VALUES ('Togo'); -- 124
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1124,'F�d�ration togolaise de football',124);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1124);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1124);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1124);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Togo de football',1124);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (124,311);

INSERT INTO cou_country (cou_name) VALUES ('Cameroun'); -- 125
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1125,'F�d�ration camerounaise de football',125);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1125);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1125);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (106,1125);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Cameroun de football',1125);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (125,580);

INSERT INTO cou_country (cou_name) VALUES ('R�publique centrafricaine'); -- 126
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1126,'F�d�ration centrafricaine de football',126);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1126);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1126);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (106,1126);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de R�publique centrafricaine de football',1126);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (126,263);

INSERT INTO cou_country (cou_name) VALUES ('Congo'); -- 127
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1127,'F�d�ration congolaise de football',127);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1127);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1127);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (106,1127);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Congo de football',1127);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (127,240);

INSERT INTO cou_country (cou_name) VALUES ('RD Congo'); -- 128
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1128,'F�d�ration congolaise de football association',128);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1128);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1128);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (106,1128);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de R�publique d�mocratique du Congo de football',1128);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (128,232);

INSERT INTO cou_country (cou_name) VALUES ('Gabon'); -- 129
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1129,'F�d�ration gabonaise de football',129);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1129);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1129);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (106,1129);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Gabon de football',1129);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (129,526);

INSERT INTO cou_country (cou_name) VALUES ('Guin�e �quatoriale'); -- 130
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1130,'F�d�ration de Guin�e �quatoriale de football',130);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1130);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1130);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (106,1130);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Guin�e �quatoriale de football',1130);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (130,113);

INSERT INTO cou_country (cou_name) VALUES ('Sao Tom�-et-Principe'); -- 131
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1131,'F�d�ration de Sao Tom�-et-Principe de football',131);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1131);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1131);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (106,1131);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Sao Tom�-et-Principe de football',1131);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (131,0);

INSERT INTO cou_country (cou_name) VALUES ('Tchad'); -- 132
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1132,'F�d�ration tchadienne de football',132);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1132);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1132);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (106,1132);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Tchad de football',1132);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (132,135);

INSERT INTO cou_country (cou_name) VALUES ('Burundi'); -- 133
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1133,'F�d�ration de football du Burundi',133);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1133);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1133);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1133);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Burundi de football',1133);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (133,133);

INSERT INTO cou_country (cou_name) VALUES ('Djibouti'); -- 134
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1134,'F�d�ration djiboutienne de football',134);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1134);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1134);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1134);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Djibouti de football',1134);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (134,15);

INSERT INTO cou_country (cou_name) VALUES ('�rythr�e'); -- 135
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1135,'F�d�ration d''�rythr�e de football',135);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1135);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1135);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1135);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''�rythr�e de football',1135);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (135,40);

INSERT INTO cou_country (cou_name) VALUES ('�thiopie'); -- 136
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1136,'F�d�ration d''�thiopie de football',136);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1136);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1136);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1136);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''�thiopie de football',1136);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (136,231);

INSERT INTO cou_country (cou_name) VALUES ('Kenya'); -- 137
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1137,'F�d�ration du Kenya de football',137);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1137);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1137);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1137);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Kenya de football',1137);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (137,202);

INSERT INTO cou_country (cou_name) VALUES ('Ouganda'); -- 138
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1138,'F�d�ration d''Ouganda de football',138);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1138);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1138);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1138);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Ouganda de football',1138);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (138,385);

INSERT INTO cou_country (cou_name) VALUES ('Rwanda'); -- 139
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1139,'F�d�ration rwandaise de football amateur',139);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1139);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1139);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1139);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Rwanda de football',1139);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (139,175);

INSERT INTO cou_country (cou_name) VALUES ('Somalie'); -- 140
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1140,'F�d�ration de Somalie de football',140);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1140);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1140);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1140);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Somalie de football',1140);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (140,23);

INSERT INTO cou_country (cou_name) VALUES ('Soudan'); -- 141
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1141,'F�d�ration du Soudan de football',141);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1141);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1141);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1141);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Soudan de football',1141);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (141,298);

INSERT INTO cou_country (cou_name) VALUES ('Soudan du Sud'); -- 142
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1142,'F�d�ration de football du Soudan du Sud',142);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1142);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1142);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1142);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Soudan du Sud de football',1142);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (142,0);

INSERT INTO cou_country (cou_name) VALUES ('Tanzanie'); -- 143
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1143,'F�d�ration de Tanzanie de football',143);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1143);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1143);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1143);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Tanzanie de football',1143);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (143,235);

INSERT INTO cou_country (cou_name) VALUES ('Zanzibar'); -- 144
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1144,'F�d�ration de Zanzibar de football',144);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1144);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1144);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Zanzibar de football',1144);

INSERT INTO cou_country (cou_name) VALUES ('Afrique du Sud'); -- 145
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1145,'F�d�ration sud-africaine de football',145);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1145);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1145);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1145);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Afrique du Sud de football',1145);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (145,566);

INSERT INTO cou_country (cou_name) VALUES ('Angola'); -- 146
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1146,'F�d�ration d''Angola de football',146);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1146);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1146);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1146);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Angola de football',1146);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (146,299);

INSERT INTO cou_country (cou_name) VALUES ('Botswana'); -- 147
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1147,'F�d�ration du Botswana de football',147);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1147);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1147);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1147);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Botswana de football',1147);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (147,487);

INSERT INTO cou_country (cou_name) VALUES ('Comores'); -- 148
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1148,'F�d�ration comorienne de football',148);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1148);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1148);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1148);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des Comores de football',1148);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (148,19);

INSERT INTO cou_country (cou_name) VALUES ('Lesotho'); -- 149
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1149,'F�d�ration du Lesotho de football',149);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1149);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1149);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1149);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Lesotho de football',1149);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (149,62);

INSERT INTO cou_country (cou_name) VALUES ('Madagascar'); -- 150
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1150,'F�d�ration malgache de football',150);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1150);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1150);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1150);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Madagascar de football',1150);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (150,91);

INSERT INTO cou_country (cou_name) VALUES ('Malawi'); -- 151
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1151,'F�d�ration du Malawi de football',151);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1151);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1151);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1151);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Malawi de football',1151);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (151,381);

INSERT INTO cou_country (cou_name) VALUES ('Maurice'); -- 152
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1152,'F�d�ration de Maurice de football',152);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1152);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1152);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1152);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Maurice de football',1152);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (152,16);

INSERT INTO cou_country (cou_name) VALUES ('Mozambique'); -- 153
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1153,'F�d�ration du Mozambique de football',153);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1153);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1153);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1153);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Mozambique de football',1153);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (153,368);

INSERT INTO cou_country (cou_name) VALUES ('Namibie'); -- 154
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1154,'F�d�ration de Namibie de football',154);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1154);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1154);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1154);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Namibie de football',1154);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (154,139);

INSERT INTO cou_country (cou_name) VALUES ('Seychelles'); -- 155
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1155,'F�d�ration des Seychelles de football',155);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1155);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1155);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1155);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des Seychelles de football',1155);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (155,10);

INSERT INTO cou_country (cou_name) VALUES ('Swaziland'); -- 156
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1156,'F�d�ration du Swaziland de football',156);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1156);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1156);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1156);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Swaziland de football',1156);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (156,86);

INSERT INTO cou_country (cou_name) VALUES ('Zambie'); -- 157
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1157,'F�d�ration de Zambie de football',157);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1157);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1157);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1157);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Zambie de football',1157);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (157,333);

INSERT INTO cou_country (cou_name) VALUES ('Zimbabwe'); -- 158
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1158,'F�d�ration du Zimbabwe de football',158);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1158);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1158);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1158);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Zimbabwe de football',1158);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (158,214);

INSERT INTO cou_country (cou_name) VALUES ('R�union'); -- 159
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1159,'Ligue r�unionnaise de football',159);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1159);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1159);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de La R�union de football',1159);

INSERT INTO cou_country (cou_name) VALUES ('Afghanistan'); -- 160
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1160,'F�d�ration d''Afghanistan de football',160);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1160);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1160);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Afghanistan de football',1160);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (160,190);

INSERT INTO cou_country (cou_name) VALUES ('Arabie saoudite'); -- 161
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1161,'F�d�ration d''Arabie saoudite de football',161);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1161);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1161);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Arabie saoudite de football',1161);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (161,327);

INSERT INTO cou_country (cou_name) VALUES ('Australie'); -- 162
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1162,'F�d�ration d''Australie de football',162);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1162);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1162);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Australie de football',1162);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (162,634);

INSERT INTO cou_country (cou_name) VALUES ('Bahre�n'); -- 163
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1163,'F�d�ration de Bahre�n de football',163);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1163);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1163);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Bahre�n de football',1163);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (163,345);

INSERT INTO cou_country (cou_name) VALUES ('Bangladesh'); -- 164
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1164,'F�d�ration du Bangladesh de football',164);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1164);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1164);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Bangladesh de football',1164);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (164,49);

INSERT INTO cou_country (cou_name) VALUES ('Bhoutan'); -- 165
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1165,'F�d�ration du Bhoutan de football',165);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1165);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1165);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Bhoutan de football',1165);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (165,9);

INSERT INTO cou_country (cou_name) VALUES ('Birmanie'); -- 166
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1166,'F�d�ration de Birmanie de football',166);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1166);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1166);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Birmanie de football',1166);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (166,81);

INSERT INTO cou_country (cou_name) VALUES ('Brunei'); -- 167
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1167,'F�d�ration de Brunei de football',167);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1167);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1167);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Brunei de football',1167);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (167,9);

INSERT INTO cou_country (cou_name) VALUES ('Cambodge'); -- 168
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1168,'F�d�ration du Cambodge de football',168);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1168);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1168);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Cambodge de football',1168);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (168,94);

INSERT INTO cou_country (cou_name) VALUES ('Chine'); -- 169
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1169,'F�d�ration de Chine de football',169);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1169);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1169);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Chine de football',1169);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (169,441);

INSERT INTO cou_country (cou_name) VALUES ('Cor�e du Nord'); -- 170
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1170,'�d�ration de Cor�e du Nord de football',170);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1170);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1170);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Cor�e du Nord de football',1170);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (170,260);

INSERT INTO cou_country (cou_name) VALUES ('Cor�e du Sud'); -- 171
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1171,'F�d�ration de Cor�e du Sud de football',171);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1171);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1171);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Cor�e du Sud de football',1171);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (171,752);

INSERT INTO cou_country (cou_name) VALUES ('�mirats arabes unis'); -- 172
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1172,'F�d�ration des �mirats arabes unis de football',172);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1172);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1172);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des �mirats arabes unis de football',1172);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (172,265);

INSERT INTO cou_country (cou_name) VALUES ('Guam'); -- 173
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1173,'F�d�ration de Guam de football',173);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1173);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1173);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Guam de football',1173);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (173,17);

INSERT INTO cou_country (cou_name) VALUES ('Hong Kong'); -- 174
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1174,'F�d�ration de Hong Kong de football',174);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1174);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1174);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Hong Kong de football',1174);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (174,139);

INSERT INTO cou_country (cou_name) VALUES ('Inde'); -- 175
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1175,'�d�ration d''Inde de football',175);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1175);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1175);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Inde de football',1175);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (175,126);

INSERT INTO cou_country (cou_name) VALUES ('Indon�sie'); -- 176
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1176,'F�d�ration d''Indon�sie de football',176);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1176);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1176);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Indon�sie de football',1176);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (176,203);

INSERT INTO cou_country (cou_name) VALUES ('Irak'); -- 177
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1177,'F�d�ration d''Irak de football|F�d�ration',177);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1177);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1177);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Irak de football',1177);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (177,382);

INSERT INTO cou_country (cou_name) VALUES ('Japon'); -- 178
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1178,'F�d�ration du Japon de football',178);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1178);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1178);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Japon de football',1178);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (178,942);

INSERT INTO cou_country (cou_name) VALUES ('Iran'); -- 179
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1179,'F�d�ration d''Iran de football',179);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1179);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1179);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Iran de football',1179);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (179,577);

INSERT INTO cou_country (cou_name) VALUES ('Jordanie'); -- 180
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1180,'F�d�ration de Jordanie de football',180);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1180);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1180);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Jordanie de football',1180);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (180,413);

INSERT INTO cou_country (cou_name) VALUES ('Kirghizistan'); -- 181
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1181,'F�d�ration du Kirghizistan de football',181);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1181);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1181);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Kirghizistan de football',1181);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (181,49);

INSERT INTO cou_country (cou_name) VALUES ('Kowe�t'); -- 182
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1182,'F�d�ration du Kowe�t de football',182);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1182);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1182);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Kowe�t de football',1182);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (182,310);

INSERT INTO cou_country (cou_name) VALUES ('Laos'); -- 183
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1183,'F�d�ration du Laos de football',183);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1183);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1183);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Laos de football',1183);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (183,58);

INSERT INTO cou_country (cou_name) VALUES ('Liban'); -- 184
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1184,'F�d�ration du Liban de football',184);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1184);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1184);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Liban de football',1184);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (184,58);

INSERT INTO cou_country (cou_name) VALUES ('Macao'); -- 185
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1185,'F�d�ration de Macao de football',185);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1185);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1185);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Macao de football',1185);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (185,39);

INSERT INTO cou_country (cou_name) VALUES ('Malaisie'); -- 186
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1186,'F�d�ration de Malaisie de football',186);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1186);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1186);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Malaisie de football',1186);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (186,146);

INSERT INTO cou_country (cou_name) VALUES ('Maldives'); -- 187
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1187,'F�d�ration des Maldives de football',187);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1187);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1187);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des Maldives de football',1187);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (187,81);

INSERT INTO cou_country (cou_name) VALUES ('Mongolie'); -- 188
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1188,'F�d�ration de Mongolie de football',188);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1188);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1188);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Mongolie de football',1188);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (188,32);

INSERT INTO cou_country (cou_name) VALUES ('N�pal'); -- 189
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1189,'F�d�ration du N�pal de football',189);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1189);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1189);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du N�pal de football',1189);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (189,54);

INSERT INTO cou_country (cou_name) VALUES ('Oman'); -- 190
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1190,'F�d�ration d''Oman de football',190);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1190);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1190);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Oman de football',1190);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (190,276);

INSERT INTO cou_country (cou_name) VALUES ('Ouzb�kistan'); -- 191
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1191,'F�d�ration d''Ouzb�kistan de football',191);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1191);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1191);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe d''Ouzb�kistan de football',1191);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (191,441);

INSERT INTO cou_country (cou_name) VALUES ('Pakistan'); -- 192
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1192,'F�d�ration du Pakistan de football',192);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1192);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1192);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Pakistan de football',1192);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (192,56);

INSERT INTO cou_country (cou_name) VALUES ('Palestine'); -- 193
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1193,'F�d�ration de Palestine de football',193);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1193);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1193);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Palestine de football',1193);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (193,40);

INSERT INTO cou_country (cou_name) VALUES ('Philippines'); -- 194
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1194,'F�d�ration des Philippines de football',194);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1194);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1194);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des Philippines de football',1194);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (194,107);

INSERT INTO cou_country (cou_name) VALUES ('Qatar'); -- 195
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1195,'F�d�ration du Qatar de football',195);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1195);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1195);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Qatar de football',1195);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (195,379);

INSERT INTO cou_country (cou_name) VALUES ('Singapour'); -- 196
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1196,'F�d�ration de Singapour de football',196);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1196);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1196);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Singapour de football',1196);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (196,142);

INSERT INTO cou_country (cou_name) VALUES ('Sri Lanka'); -- 197
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1197,'F�d�ration du Sri Lanka de football',197);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1197);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1197);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Sri Lanka de football',1197);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (197,51);

INSERT INTO cou_country (cou_name) VALUES ('Syrie'); -- 198
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1198,'F�d�ration de Syrie de football',198);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1198);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1198);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Syrie de football',1198);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (198,296);

INSERT INTO cou_country (cou_name) VALUES ('Ta�wan'); -- 199
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1199,'F�d�ration de Ta�wan de football',199);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1199);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1199);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Ta�wan de football',1199);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (199,114);

INSERT INTO cou_country (cou_name) VALUES ('Tadjikistan'); -- 200
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1200,'F�d�ration du Tadjikistan de football',200);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1200);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1200);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Tadjikistan de football',1200);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (200,113);

INSERT INTO cou_country (cou_name) VALUES ('Tha�lande'); -- 201
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1201,'F�d�ration de Tha�lande de football',201);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1201);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1201);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Tha�lande de football',1201);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (201,248);

INSERT INTO cou_country (cou_name) VALUES ('Timor oriental'); -- 202
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1202,'F�d�ration du Timor oriental de football',202);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1202);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1202);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Timor oriental de football',1202);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (202,3);

INSERT INTO cou_country (cou_name) VALUES ('Turkm�nistan'); -- 203
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1203,'F�d�ration du Turkm�nistan de football',203);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1203);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1203);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Turkm�nistan de football',1203);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (203,94);

INSERT INTO cou_country (cou_name) VALUES ('Vi�t Nam'); -- 204
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1204,'F�d�ration du Vi�t Nam de football',204);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1204);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1204);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Vi�t Nam de football',1204);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (204,172);

INSERT INTO cou_country (cou_name) VALUES ('Y�men'); -- 205
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1205,'F�d�ration du Y�men de football',205);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1205);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1205);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Y�men de football',1205);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (205,219);

INSERT INTO cou_country (cou_name) VALUES ('�les Mariannes du Nord'); -- 206
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1206,'F�d�ration des �les Mariannes du Nord de football',206);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1206);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des �les Mariannes du Nord de football',1206);

INSERT INTO cou_country (cou_name) VALUES ('Fidji'); -- 207
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1207,'F�d�ration de Fidji de football',207);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1207);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1207);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Fidji de football',1207);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (207,103);

INSERT INTO cou_country (cou_name) VALUES ('�les Cook'); -- 208
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1208,'F�d�ration des �les Cook de football',208);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1208);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1208);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des �les Cook de football',1208);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (208,17);

INSERT INTO cou_country (cou_name) VALUES ('�les Salomon'); -- 209
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1209,'F�d�ration des �les Salomon de football',209);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1209);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1209);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des �les Salomon de football',1209);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (209,40);

INSERT INTO cou_country (cou_name) VALUES ('Nouvelle-Cal�donie'); -- 210
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1210,'F�d�ration cal�donienne de football',210);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1210);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1210);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Nouvelle-Cal�donie de football',1210);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (210,97);

INSERT INTO cou_country (cou_name) VALUES ('Nouvelle-Z�lande'); -- 211
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1211,'F�d�ration de Nouvelle-Z�lande de football',211);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1211);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1211);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Nouvelle-Z�lande de football',1211);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (211,534);

INSERT INTO cou_country (cou_name) VALUES ('Papouasie-Nouvelle-Guin�e'); -- 212
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1212,'F�d�ration papouane-n�o-guin�en de football',212);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1212);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1212);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Papouasie-Nouvelle-Guin�e de football',1212);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (212,0);

INSERT INTO cou_country (cou_name) VALUES ('Samoa'); -- 213
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1213,'F�d�ration des Samoa de football',213);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1213);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1213);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des Samoa de football',1213);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (213,26);

INSERT INTO cou_country (cou_name) VALUES ('Samoa am�ricaines'); -- 214
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1214,'F�d�ration des Samoa am�ricaines de football',214);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1214);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1214);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des Samoa am�ricaines de football',1214);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (214,0);

INSERT INTO cou_country (cou_name) VALUES ('Tahiti'); -- 215
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1215,'F�d�ration tahitienne de football',215);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1215);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1215);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Tahiti de football',1215);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (215,31);

INSERT INTO cou_country (cou_name) VALUES ('Tonga'); -- 216
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1216,'F�d�ration des Tonga de football',216);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1216);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1216);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des Tonga de football',1216);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (216,17);

INSERT INTO cou_country (cou_name) VALUES ('Vanuatu'); -- 217
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1217,'F�d�ration du Vanuatu de football',217);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1217);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1217);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe du Vanuatu de football',1217);
INSERT INTO init.elo_elo (elo_tea_id,elo_points) VALUES (217,76);

INSERT INTO cou_country (cou_name) VALUES ('Kiribati'); -- 218
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1218,'F�d�ration des Kiribati de football',218);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1218);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des Kiribati de football',1218);

INSERT INTO cou_country (cou_name) VALUES ('Micron�sie'); -- 219
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1219,'F�d�ration des �tats f�d�r�s de Micron�sie de football',219);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1219);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Micron�sie de football',1219);

INSERT INTO cou_country (cou_name) VALUES ('Niu�'); -- 220
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1220,'F�d�ration de Niu� de football',220);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1220);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe de Niue de football',1220);

INSERT INTO cou_country (cou_name) VALUES ('Palaos'); -- 221
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1221,'F�d�ration des Palaos de football',221);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1221);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des Palaos de football',1221);

INSERT INTO cou_country (cou_name) VALUES ('Tuvalu'); -- 222
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1222,'F�d�ration des Tuvalu de football',222);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1222);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('�quipe des Tuvalu de football',1222);

