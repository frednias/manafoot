
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
