-- DATA


INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1,'FIFA',NULL);

INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (11,'UEFA',NULL);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (12,'CAF',NULL);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (13,'AFC',NULL);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (14,'OFC',NULL);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (15,'CONMABOL',NULL);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (16,'CONCACAF',NULL);

INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (101,'Union nord-américaine de football',NULL);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,101);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (102,'Union centre-américaine de football',NULL);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,102);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (103,'Union caribéenne de football',NULL);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,103);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (104,'Union nord-africaine de football',NULL);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,104);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (105,'Union des fédérations ouest-africaines de football',NULL);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,105);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (106,'Union des fédérations de football d''Afrique centrale',NULL);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,106);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (107,'Council for East and Central Africa Football Association',NULL);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,107);
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (108,'Council of Southern Africa Football Associations',NULL);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,108);


INSERT INTO cou_country (cou_name) VALUES ('Espagne'); -- 1
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1001,'Fédération royale espagnole de football',1);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1001);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1001);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Espagne de football',1001); -- 1

INSERT INTO cou_country (cou_name) VALUES ('Pays-Bas');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1002,'Fédération royale néerlandaise de football',2);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1002);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1002);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Pays-Bas de football',1002);

INSERT INTO cou_country (cou_name) VALUES ('Mexique');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1003,'Fédération du Mexique de football', 3);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1003);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1003);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (101,1003);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Mexique de football',1003);

INSERT INTO cou_country (cou_name) VALUES ('États-Unis');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1004,'Fédération des États-Unis de soccer', 4);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1004);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1004);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (101,1004);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des États-Unis de soccer',1004);

INSERT INTO cou_country (cou_name) VALUES ('Canada');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1005,'Association canadienne de soccer', 5);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1005);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1005);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (101,1005);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Canada de soccer',1005); -- 5

INSERT INTO cou_country (cou_name) VALUES ('Bélize');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1006,'Fédération du Bélize de football', 6);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1006);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1006);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (102,1006);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Belize de football',1006);

INSERT INTO cou_country (cou_name) VALUES ('Costa Rica');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1007,'Fédération du Costa Rica de football', 7);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1007);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1007);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (102,1007);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Costa Rica de football',1007);

INSERT INTO cou_country (cou_name) VALUES ('Guatemala');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1008,'Fédération du Guatemala de football', 8);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1008);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1008);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (102,1008);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Guatemala de football',1008);

INSERT INTO cou_country (cou_name) VALUES ('Honduras');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1009,'Fédération du Honduras de football', 9);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1009);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1009);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (102,1009);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Honduras de football',1009);

INSERT INTO cou_country (cou_name) VALUES ('Nicaragua');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1010,'Fédération du Nicaragua de football', 10);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1010);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1010);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (102,1010);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Nicaragua de football',1010); -- 10

INSERT INTO cou_country (cou_name) VALUES ('Salvador');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1011,'Fédération du Salvador de football', 11);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1011);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1011);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (102,1011);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Salvador de football',1011);

INSERT INTO cou_country (cou_name) VALUES ('Panama');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1012,'Fédération du Panama de football', 12);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1012);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1012);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (102,1012);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Panama de football',1012); -- 12

INSERT INTO cou_country (cou_name) VALUES ('Anguilla');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1013,'Fédération d''Anguilla de football', 13);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1013);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1013);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1013);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Anguilla de football',1013); -- 13

INSERT INTO cou_country (cou_name) VALUES ('Antigua-et-Barbuda');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1014,'Fédération du Antigua-et-Barbuda de football', 14);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1014);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1014);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1014);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Antigua-et-Barbuda de football',1014); -- 14

INSERT INTO cou_country (cou_name) VALUES ('Aruba');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1015,'Fédération d''Aruba de football', 15);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1015);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1015);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1015);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Aruba de football',1015); -- 15

INSERT INTO cou_country (cou_name) VALUES ('Bahamas');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1016,'Fédération des Bahamas de football', 16);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1016);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1016);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1016);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Bahamas de football',1016); -- 16

INSERT INTO cou_country (cou_name) VALUES ('Barbade');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1017,'Fédération de la Barbade de football', 17);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1017);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1017);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1017);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de la Barbade de football',1017); -- 17

INSERT INTO cou_country (cou_name) VALUES ('Bermudes');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1018,'Fédération des Bermudes de football', 18);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1018);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1018);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1018);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Bermudes de football',1018); -- 18

INSERT INTO cou_country (cou_name) VALUES ('Curaçao');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1019,'Fédération de Curaçao de football', 19);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1019);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1019);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1019);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Curaçao de football',1019); -- 19

INSERT INTO cou_country (cou_name) VALUES ('Cuba');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1020,'Fédération de Cuba de football', 20);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1020);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1020);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1020);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Cuba de football',1020); -- 20

INSERT INTO cou_country (cou_name) VALUES ('Dominique');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1021,'Fédération de Dominique de football', 21);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1021);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1021);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1021);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Dominique de football',1021); -- 21

INSERT INTO cou_country (cou_name) VALUES ('Grenade');
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1022,'Fédération grenadienne de football', 22);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1022);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1022);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1022);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Grenade de football',1022); -- 22

INSERT INTO cou_country (cou_name) VALUES ('Guadeloupe'); -- 23
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1023,'Ligue guadeloupéenne de football', 23);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1023);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1023);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Guadeloupe de football',1023); -- 23

INSERT INTO cou_country (cou_name) VALUES ('Guyana'); -- 24
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1024,'Fédération du Guyana de football', 24);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1024);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1024);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1024);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Guyana de football',1024); -- 24

INSERT INTO cou_country (cou_name) VALUES ('Guyane'); -- 25
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1025,'Ligue de football de la Guyane', 25);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1025);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1025);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Guyane de football',1025); -- 25

INSERT INTO cou_country (cou_name) VALUES ('Haïti'); -- 26
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1026,'Fédération haïtienne de football', 26);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1026);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1026);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1026);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Haïti de football',1026); -- 26

INSERT INTO cou_country (cou_name) VALUES ('Ïles Caïmans'); -- 27
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1027,'Fédération des Ïles Caïmans de football', 27);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1027);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1027);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1027);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Ïles Caïmans de football',1027); -- 27

INSERT INTO cou_country (cou_name) VALUES ('Ïles Vierges des États-Unis'); -- 28
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1028,'Fédération des Ïles Vierges des États-Unis de football', 28);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1028);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1028);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1028);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Ïles Vierges des États-Unis de football',1028); -- 28

INSERT INTO cou_country (cou_name) VALUES ('Ïles Vierges britanniques'); -- 29
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1029,'Fédération des Ïles Vierges britanniques de football', 29);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1029);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1029);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1029);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Ïles Vierges britanniques de football',1029); -- 29

INSERT INTO cou_country (cou_name) VALUES ('Jamaïque'); -- 30
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1030,'Fédération de Jamaïque de football', 30);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1030);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1030);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1030);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Jamaïque de football',1030); -- 30

INSERT INTO cou_country (cou_name) VALUES ('Martinique'); -- 31
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1031,'Ligue de football de la Martinique', 31);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1031);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1031);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de la Martinique de football',1031); -- 31

INSERT INTO cou_country (cou_name) VALUES ('Montserrat'); -- 32
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1032,'Fédération de Montserrat de football', 32);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1032);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1032);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1032);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Montserrat de football',1032); -- 32

INSERT INTO cou_country (cou_name) VALUES ('Porto Rico'); -- 33
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1033,'Fédération de Porto Rico de football', 33);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1033);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1033);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1033);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Porto Rico de football',1033); -- 33

INSERT INTO cou_country (cou_name) VALUES ('République dominicaine'); -- 34
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1034,'Fédération de République dominicaine de football', 34);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1034);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1034);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1034);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de République dominicaine de football',1034); -- 34

INSERT INTO cou_country (cou_name) VALUES ('Saint-Christophe-et-Nièvès'); -- 35
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1035,'Fédération de Saint-Christophe-et-Nièvès de football', 35);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1035);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1035);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1035);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Saint-Christophe-et-Nièvès de football',1035); -- 35

INSERT INTO cou_country (cou_name) VALUES ('Saint-Martin (FR)'); -- 36
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1036,'Comité de football des Ïles du Nord', 36);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1036);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1036);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Saint-Martin de football',1036); -- 36

INSERT INTO cou_country (cou_name) VALUES ('Sainte-Lucie'); -- 37
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1037,'Fédération de Sainte-Lucie de football', 37);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1037);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1037);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1037);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Sainte-Lucie de football',1037); -- 37

INSERT INTO cou_country (cou_name) VALUES ('Saint-Vincent-et-les-Grenadines'); -- 38
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1038,'Fédération de Saint-Vincent-et-les-Grenadines de football', 38);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1038);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1038);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1038);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Saint-Vincent-et-les-Grenadines de football',1038); -- 38

INSERT INTO cou_country (cou_name) VALUES ('Sint Maarten'); -- 39
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1039,'Fédération de Sint Maarten de football', 39);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1039);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1039);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Sint Maarten de football',1039); -- 39

INSERT INTO cou_country (cou_name) VALUES ('Suriname'); -- 40
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1040,'Fédération du Suriname de football', 40);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1040);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1040);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1040);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Suriname de football',1040); -- 40

INSERT INTO cou_country (cou_name) VALUES ('Trinité-et-Tobago'); -- 41
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1041,'Fédération de Trinité-et-Tobago de football', 41);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1041);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1041);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1041);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Trinité-et-Tobago de football',1041); -- 41

INSERT INTO cou_country (cou_name) VALUES ('Ïles Turques-et-Caïques'); -- 42
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1042,'Fédération des Ïles Turques-et-Caïques de football', 42);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1042);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (16,1042);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (103,1042);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Ïles Turques-et-Caïques de football',1042); -- 42

INSERT INTO cou_country (cou_name) VALUES ('Argentine'); -- 43
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1043,'Association du football argentin', 43);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1043);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1043);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Argentine de football',1043); -- 43

INSERT INTO cou_country (cou_name) VALUES ('Brésil'); -- 44
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1044,'Confédération brésilienne de football', 44);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1044);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1044);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Brésil de football',1044); -- 44

INSERT INTO cou_country (cou_name) VALUES ('Uruguay'); -- 45
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1045,'Association uruguayenne de football', 45);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1045);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1045);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Uruguay de football',1045); -- 45

INSERT INTO cou_country (cou_name) VALUES ('Chili'); -- 46
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1046,'Fédération du Chili de football', 46);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1046);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1046);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Chili de football',1046); -- 46

INSERT INTO cou_country (cou_name) VALUES ('Paraguay'); -- 47
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1047,'Association paraguayenne de football', 47);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1047);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1047);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Paraguay de football',1047); -- 47

INSERT INTO cou_country (cou_name) VALUES ('Equateur'); -- 48
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1048,'Fédération équatorienne de football', 48);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1048);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1048);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Équateur de football',1048); -- 48

INSERT INTO cou_country (cou_name) VALUES ('Colombie'); -- 49
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1049,'Fédération colombienne de football', 49);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1049);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1049);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Colombie de football',1049); -- 49

INSERT INTO cou_country (cou_name) VALUES ('Pérou'); -- 50
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1050,'Fédération péruvienne de football', 50);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1050);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1050);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Pérou de football',1050); -- 50

INSERT INTO cou_country (cou_name) VALUES ('Venezuela'); -- 51
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1051,'Fédération vénézuélienne de football', 51);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1051);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1051);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Venezuela de football',1051); -- 51

INSERT INTO cou_country (cou_name) VALUES ('Bolivie'); -- 52
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1052,'Fédération bolivienne de football', 52);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1052);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (15,1052);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Bolivie de football',1052); -- 52

INSERT INTO cou_country (cou_name) VALUES ('Albanie'); -- 53
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1053,'Fédération albanaise de football',53);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1053);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1053);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Albanie de football',1053);

INSERT INTO cou_country (cou_name) VALUES ('Allemagne'); -- 54
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1054,'Fédération allemande de football',54);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1054);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1054);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Allemagne de football',1054);

INSERT INTO cou_country (cou_name) VALUES ('Andorre'); -- 55
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1055,'Fédération d''Andorre de football',55);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1055);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1055);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Andorre de football',1055);

INSERT INTO cou_country (cou_name) VALUES ('Angleterre'); -- 56
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1056,'Fédération anglaise de football',56);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1056);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1056);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Angleterre de football',1056);

INSERT INTO cou_country (cou_name) VALUES ('Arménie'); -- 57
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1057,'Fédération de football d''Arménie',57);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1057);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1057);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Arménie de football',1057);

INSERT INTO cou_country (cou_name) VALUES ('Autriche'); -- 58
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1058,'Fédération autrichienne de football',58);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1058);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1058);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Arménie de football',1058);

INSERT INTO cou_country (cou_name) VALUES ('Azerbaïdjan'); -- 59
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1059,'Fédération d''Azerbaïdjan de football',59);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1059);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1059);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Azerbaïdjan de football',1059);

INSERT INTO cou_country (cou_name) VALUES ('Belgique'); -- 60
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1060,'Union royale belge des sociétés de football association',60);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1060);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1060);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Belgique de football',1060);

INSERT INTO cou_country (cou_name) VALUES ('Biélorussie'); -- 61
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1061,'Fédération biélorusse de football',61);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1061);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1061);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Biélorussie de football',1061);

INSERT INTO cou_country (cou_name) VALUES ('Bosnie-Herzégovine'); -- 62
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1062,'Fédération de football de Bosnie-Herzégovine',62);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1062);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1062);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Bosnie-Herzégovine de football',1062);

INSERT INTO cou_country (cou_name) VALUES ('Bulgarie'); -- 63
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1063,'Fédération de Bulgarie de football',63);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1063);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1063);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Bulgarie de football',1063);

INSERT INTO cou_country (cou_name) VALUES ('Chypre'); -- 64
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1064,'Fédération chypriote de football',64);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1064);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1064);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Chypre de football',1064);

INSERT INTO cou_country (cou_name) VALUES ('Croatie'); -- 65
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1065,'Fédération croate de football',65);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1065);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1065);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Croatie de football',1065);

INSERT INTO cou_country (cou_name) VALUES ('Danemark'); -- 66
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1066,'Fédération danoise de football',66);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1066);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1066);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Danemark de football',1066);

INSERT INTO cou_country (cou_name) VALUES ('Écosse'); -- 67
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1067,'Fédération écossaise de football',67);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1067);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1067);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Écosse de football',1067);

INSERT INTO cou_country (cou_name) VALUES ('Estonie'); -- 68
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1068,'Fédération estonienne de football',68);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1068);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1068);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Estonie de football',1068);

INSERT INTO cou_country (cou_name) VALUES ('Ïles Féroé'); -- 69
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1069,'Fédération des Ïles Féroé de football',69);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1069);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1069);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Ïles Féroé de football',1069);

INSERT INTO cou_country (cou_name) VALUES ('Finlande'); -- 70
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1070,'Association finlandaise de football',70);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1070);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1070);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Finlande de football',1070);

INSERT INTO cou_country (cou_name) VALUES ('France'); -- 71
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1071,'Fédération française de football',71);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1071);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1071);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de France de football',1071);

INSERT INTO cou_country (cou_name) VALUES ('Géorgie'); -- 72
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1072,'Fédération de Géorgie de football',72);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1072);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1072);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Géorgie de football',1072);

INSERT INTO cou_country (cou_name) VALUES ('Grèce'); -- 73
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1073,'Fédération hellénique de football',73);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1073);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1073);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Grèce de football',1073);

INSERT INTO cou_country (cou_name) VALUES ('Hongrie'); -- 74
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1074,'Fédération hongroise de football',74);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1074);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1074);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Hongrie de football',1074);

INSERT INTO cou_country (cou_name) VALUES ('Irlande'); -- 75
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1075,'Fédération d''Irlande de football',75);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1075);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1075);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de République d''Irlande de football',1075);

INSERT INTO cou_country (cou_name) VALUES ('Irlande Du Nord'); -- 76
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1076,'Association irlandaise de football',76);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1076);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1076);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Irlande du Nord de football',1076);

INSERT INTO cou_country (cou_name) VALUES ('Islande'); -- 77
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1077,'Fédération d''Islande de football',77);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1077);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1077);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Islande de football',1077);

INSERT INTO cou_country (cou_name) VALUES ('Israël'); -- 78
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1078,'Fédération d''Israël de football',78);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1078);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1078);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Israël de football',1078);

INSERT INTO cou_country (cou_name) VALUES ('Italie'); -- 79
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1079,'Fédération italienne de football',79);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1079);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1079);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Italie de football',1079);

INSERT INTO cou_country (cou_name) VALUES ('Kazakhstan'); -- 80
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1080,'Fédération du Kazakhstan de football',80);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1080);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1080);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Kazakhstan de football',1080);

INSERT INTO cou_country (cou_name) VALUES ('Lettonie'); -- 81
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1081,'Fédération de Lettonie de football',81);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1081);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1081);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Lettonie de football',1081);

INSERT INTO cou_country (cou_name) VALUES ('Liechtenstein'); -- 82
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1082,'Fédération du Liechtenstein de football',82);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1082);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1082);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Liechtenstein de football',1082);

INSERT INTO cou_country (cou_name) VALUES ('Lituanie'); -- 83
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1083,'Fédération de Lituanie de football',83);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1083);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1083);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Lituanie de football',1083);

INSERT INTO cou_country (cou_name) VALUES ('Luxembourg'); -- 84
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1084,'Fédération luxembourgeoise de football',84);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1084);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1084);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Luxembourg de football',1084);

INSERT INTO cou_country (cou_name) VALUES ('Macédoine'); -- 85
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1085,'Fédération de Macédoine de football',85);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1085);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1085);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Macédoine de football',1085);

INSERT INTO cou_country (cou_name) VALUES ('Malte'); -- 86
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1086,'Fédération de Malte de football',86);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1086);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1086);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Malte de football',1086);

INSERT INTO cou_country (cou_name) VALUES ('Moldavie'); -- 87
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1087,'Fédération moldave de football',87);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1087);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1087);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Moldavie de football',1087);

INSERT INTO cou_country (cou_name) VALUES ('Monténégro'); -- 88
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1088,'Fédération du Monténégro de football',88);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1088);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1088);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Monténégro de football',1088);

INSERT INTO cou_country (cou_name) VALUES ('Pays de Galles'); -- 89
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1089,'Fédération de football de Galles',89);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1089);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1089);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du pays de Galles de football',1089);

INSERT INTO cou_country (cou_name) VALUES ('Pologne'); -- 90
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1090,'Fédération polonaise de football',90);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1090);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1090);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Pologne de football',1090);

INSERT INTO cou_country (cou_name) VALUES ('Portugal'); -- 91
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1091,'Fédération portugaise de football',91);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1091);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1091);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Portugal de football',1091);

INSERT INTO cou_country (cou_name) VALUES ('République tchèque'); -- 92
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1092,'Fédération de République tchèque de football',92);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1092);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1092);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de République tchèque de football',1092);

INSERT INTO cou_country (cou_name) VALUES ('Roumanie'); -- 93
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1093,'Fédération roumaine de football',93);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1093);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1093);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Roumanie de football',1093);

INSERT INTO cou_country (cou_name) VALUES ('Russie'); -- 94
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1094,'Fédération de Russie de football',94);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1094);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1094);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Russie de football',1094);

INSERT INTO cou_country (cou_name) VALUES ('Saint-Marin'); -- 95
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1095,'Fédération de Saint-Marin de football',95);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1095);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1095);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Saint-Marin de football',1095);

INSERT INTO cou_country (cou_name) VALUES ('Serbie'); -- 96
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1096,'Fédération de Serbie de football',96);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1096);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1096);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Serbie de football',1096);

INSERT INTO cou_country (cou_name) VALUES ('Slovaquie'); -- 97
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1097,'Fédération slovaque de football',97);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1097);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1097);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Slovaquie de football',1097);

INSERT INTO cou_country (cou_name) VALUES ('Slovénie'); -- 98
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1098,'Fédération de Slovénie de football',98);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1098);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1098);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Slovénie de football',1098);

INSERT INTO cou_country (cou_name) VALUES ('Suède'); -- 99
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1099,'Fédération suèdoise de football',99);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1099);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1099);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Suède de football',1099);

INSERT INTO cou_country (cou_name) VALUES ('Suisse'); -- 100
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1100,'Association suisse de football',100);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1100);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1100);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Suisse de football',1100);

INSERT INTO cou_country (cou_name) VALUES ('Turquie'); -- 101
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1101,'Fédération de Turquie de football',101);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1101);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1101);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Turquie de football',1101);

INSERT INTO cou_country (cou_name) VALUES ('Ukraine'); -- 102
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1102,'Fédération de football d''Ukraine',102);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1102);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1102);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Ukraine de football',1102);

INSERT INTO cou_country (cou_name) VALUES ('Norvège'); -- 103
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1103,'Fédération de Norvège de football',103);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1103);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (11,1103);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Norvège de football',1103);

INSERT INTO cou_country (cou_name) VALUES ('Algérie'); -- 104
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1104,'Fédération algérienne de football',104);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1104);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1104);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (104,1104);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Algérie de football',1104);

INSERT INTO cou_country (cou_name) VALUES ('Égypte'); -- 105
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1105,'Fédération égyptienne de football',105);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1105);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1105);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (104,1105);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Égypte de football',1105);

INSERT INTO cou_country (cou_name) VALUES ('Libye'); -- 106
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1106,'Fédération de Libye de football',106);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1106);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1106);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (104,1106);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Libye de football',1106);

INSERT INTO cou_country (cou_name) VALUES ('Maroc'); -- 107
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1107,'Fédération royale marocaine de football',107);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1107);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1107);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (104,1107);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Maroc de football',1107);

INSERT INTO cou_country (cou_name) VALUES ('Tunisie'); -- 108
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1108,'Fédération tunisienne de football',108);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1108);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1108);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (104,1108);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Tunisie de football',1108);

INSERT INTO cou_country (cou_name) VALUES ('Cap-Vert'); -- 109
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1109,'Fédération du Cap-Vert de football',109);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1109);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1109);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1109);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Cap-Vert de football',1109);

INSERT INTO cou_country (cou_name) VALUES ('Gambie'); -- 110
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1110,'Fédération de Gambie de football',110);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1110);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1110);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1110);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Gambie de football',1110);

INSERT INTO cou_country (cou_name) VALUES ('Guinée'); -- 111
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1111,'Fédération guinéenne de football',111);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1111);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1111);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1111);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Guinée de football',1111);

INSERT INTO cou_country (cou_name) VALUES ('Guinée-Bissau'); -- 112
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1112,'Fédération de Guinée-Bissau de football',112);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1112);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1112);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1112);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Guinée-Bissau de football',1112);

INSERT INTO cou_country (cou_name) VALUES ('Liberia'); -- 113
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1113,'Fédération du Liberia de football',113);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1113);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1113);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1113);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Liberia de football',1113);

INSERT INTO cou_country (cou_name) VALUES ('Mauritanie'); -- 114
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1114,'Fédération de football de la République islamique de Mauritanie',114);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1114);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1114);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1114);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Mauritanie de football',1114);

INSERT INTO cou_country (cou_name) VALUES ('Sénégal'); -- 115
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1115,'Fédération sénégalaise de football',115);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1115);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1115);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1115);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Sénégal de football',1115);

INSERT INTO cou_country (cou_name) VALUES ('Sierra Leone'); -- 116
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1116,'Fédération de Sierra Leone de football',116);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1116);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1116);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1116);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Sierra Leone de football',1116);

INSERT INTO cou_country (cou_name) VALUES ('Bénin'); -- 117
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1117,'Fédération béninoise de football',117);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1117);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1117);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1117);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Bénin de football',1117);

INSERT INTO cou_country (cou_name) VALUES ('Burkina Faso'); -- 118
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1118,'Fédération burkinabé de football',118);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1118);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1118);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1118);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Burkina Faso de football',1118);

INSERT INTO cou_country (cou_name) VALUES ('Côte d''Ivoire'); -- 119
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1119,'Fédération ivoirienne de football',119);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1119);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1119);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1119);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Côte d''Ivoire de football',1119);

INSERT INTO cou_country (cou_name) VALUES ('Ghana'); -- 120
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1120,'Fédération du Ghana de football',120);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1120);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1120);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1120);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Ghana de football',1120);

INSERT INTO cou_country (cou_name) VALUES ('Mali'); -- 121
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1121,'Fédération malienne de football',121);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1121);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1121);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1121);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Mali de football',1121);

INSERT INTO cou_country (cou_name) VALUES ('Niger'); -- 122
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1122,'Fédération nigérienne de football',122);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1122);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1122);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1122);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Niger de football',1122);

INSERT INTO cou_country (cou_name) VALUES ('Nigeria'); -- 123
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1123,'Fédération du Nigeria de football',123);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1123);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1123);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1123);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Nigeria de football',1123);

INSERT INTO cou_country (cou_name) VALUES ('Togo'); -- 124
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1124,'Fédération togolaise de football',124);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1124);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1124);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (105,1124);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Togo de football',1124);

INSERT INTO cou_country (cou_name) VALUES ('Cameroun'); -- 125
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1125,'Fédération camerounaise de football',125);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1125);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1125);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (106,1125);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Cameroun de football',1125);

INSERT INTO cou_country (cou_name) VALUES ('République centrafricaine'); -- 126
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1126,'Fédération centrafricaine de football',126);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1126);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1126);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (106,1126);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de République centrafricaine de football',1126);

INSERT INTO cou_country (cou_name) VALUES ('Congo'); -- 127
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1127,'Fédération congolaise de football',127);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1127);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1127);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (106,1127);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Congo de football',1127);

INSERT INTO cou_country (cou_name) VALUES ('RD Congo'); -- 128
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1128,'Fédération congolaise de football association',128);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1128);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1128);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (106,1128);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de République démocratique du Congo de football',1128);

INSERT INTO cou_country (cou_name) VALUES ('Gabon'); -- 129
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1129,'Fédération gabonaise de football',129);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1129);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1129);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (106,1129);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Gabon de football',1129);

INSERT INTO cou_country (cou_name) VALUES ('Guinée Équatoriale'); -- 130
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1130,'Fédération de Guinée Équatoriale de football',130);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1130);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1130);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (106,1130);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Guinée Équatoriale de football',1130);

INSERT INTO cou_country (cou_name) VALUES ('Sao Tomé-et-Principe'); -- 131
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1131,'Fédération de Sao Tomé-et-Principe de football',131);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1131);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1131);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (106,1131);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Sao Tomé-et-Principe de football',1131);

INSERT INTO cou_country (cou_name) VALUES ('Tchad'); -- 132
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1132,'Fédération tchadienne de football',132);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1132);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1132);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (106,1132);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Tchad de football',1132);

INSERT INTO cou_country (cou_name) VALUES ('Burundi'); -- 133
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1133,'Fédération de football du Burundi',133);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1133);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1133);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1133);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Burundi de football',1133);

INSERT INTO cou_country (cou_name) VALUES ('Djibouti'); -- 134
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1134,'Fédération djiboutienne de football',134);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1134);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1134);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1134);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Djibouti de football',1134);

INSERT INTO cou_country (cou_name) VALUES ('Érythrée'); -- 135
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1135,'Fédération d''Érythrée de football',135);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1135);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1135);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1135);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Érythrée de football',1135);

INSERT INTO cou_country (cou_name) VALUES ('Éthiopie'); -- 136
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1136,'Fédération d''Éthiopie de football',136);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1136);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1136);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1136);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Éthiopie de football',1136);

INSERT INTO cou_country (cou_name) VALUES ('Kenya'); -- 137
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1137,'Fédération du Kenya de football',137);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1137);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1137);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1137);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Kenya de football',1137);

INSERT INTO cou_country (cou_name) VALUES ('Ouganda'); -- 138
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1138,'Fédération d''Ouganda de football',138);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1138);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1138);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1138);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Ouganda de football',1138);

INSERT INTO cou_country (cou_name) VALUES ('Rwanda'); -- 139
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1139,'Fédération rwandaise de football amateur',139);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1139);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1139);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1139);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Rwanda de football',1139);

INSERT INTO cou_country (cou_name) VALUES ('Somalie'); -- 140
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1140,'Fédération de Somalie de football',140);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1140);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1140);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1140);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Somalie de football',1140);

INSERT INTO cou_country (cou_name) VALUES ('Soudan'); -- 141
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1141,'Fédération du Soudan de football',141);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1141);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1141);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1141);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Soudan de football',1141);

INSERT INTO cou_country (cou_name) VALUES ('Soudan du Sud'); -- 142
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1142,'Fédération de football du Soudan du Sud',142);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1142);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1142);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1142);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Soudan du Sud de football',1142);

INSERT INTO cou_country (cou_name) VALUES ('Tanzanie'); -- 143
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1143,'Fédération de Tanzanie de football',143);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1143);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1143);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1143);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Tanzanie de football',1143);

INSERT INTO cou_country (cou_name) VALUES ('Zanzibar'); -- 144
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1144,'Fédération de Zanzibar de football',144);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1144);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (107,1144);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Zanzibar de football',1144);

INSERT INTO cou_country (cou_name) VALUES ('Afrique du Sud'); -- 145
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1145,'Fédération sud-africaine de football',145);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1145);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1145);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1145);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Afrique du Sud de football',1145);

INSERT INTO cou_country (cou_name) VALUES ('Angola'); -- 146
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1146,'Fédération d''Angola de football',146);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1146);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1146);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1146);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Angola de football',1146);

INSERT INTO cou_country (cou_name) VALUES ('Botswana'); -- 147
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1147,'Fédération du Botswana de football',147);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1147);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1147);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1147);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Botswana de football',1147);

INSERT INTO cou_country (cou_name) VALUES ('Comores'); -- 148
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1148,'Fédération comorienne de football',148);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1148);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1148);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1148);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Comores de football',1148);

INSERT INTO cou_country (cou_name) VALUES ('Lesotho'); -- 149
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1149,'Fédération du Lesotho de football',149);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1149);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1149);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1149);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Lesotho de football',1149);

INSERT INTO cou_country (cou_name) VALUES ('Madagascar'); -- 150
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1150,'Fédération malgache de football',150);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1150);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1150);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1150);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Madagascar de football',1150);

INSERT INTO cou_country (cou_name) VALUES ('Malawi'); -- 151
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1151,'Fédération du Malawi de football',151);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1151);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1151);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1151);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Malawi de football',1151);

INSERT INTO cou_country (cou_name) VALUES ('Maurice'); -- 152
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1152,'Fédération de Maurice de football',152);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1152);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1152);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1152);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Maurice de football',1152);

INSERT INTO cou_country (cou_name) VALUES ('Mozambique'); -- 153
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1153,'Fédération du Mozambique de football',153);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1153);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1153);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1153);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Mozambique de football',1153);

INSERT INTO cou_country (cou_name) VALUES ('Namibie'); -- 154
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1154,'Fédération de Namibie de football',154);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1154);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1154);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1154);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Namibie de football',1154);

INSERT INTO cou_country (cou_name) VALUES ('Seychelles'); -- 155
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1155,'Fédération des Seychelles de football',155);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1155);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1155);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1155);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Seychelles de football',1155);

INSERT INTO cou_country (cou_name) VALUES ('Swaziland'); -- 156
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1156,'Fédération du Swaziland de football',156);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1156);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1156);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1156);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Swaziland de football',1156);

INSERT INTO cou_country (cou_name) VALUES ('Zambie'); -- 157
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1157,'Fédération de Zambie de football',157);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1157);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1157);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1157);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Zambie de football',1157);

INSERT INTO cou_country (cou_name) VALUES ('Zimbabwe'); -- 158
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1158,'Fédération du Zimbabwe de football',158);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1158);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1158);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1158);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Zimbabwe de football',1158);

INSERT INTO cou_country (cou_name) VALUES ('Réunion'); -- 159
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1159,'Ligue réunionnaise de football',159);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (12,1159);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (108,1159);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de La Réunion de football',1159);

INSERT INTO cou_country (cou_name) VALUES ('Afghanistan'); -- 160
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1160,'Fédération d''Afghanistan de football',160);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1160);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1160);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Afghanistan de football',1160);

INSERT INTO cou_country (cou_name) VALUES ('Arabie saoudite'); -- 161
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1161,'Fédération d''Arabie saoudite de football',161);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1161);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1161);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Arabie saoudite de football',1161);

INSERT INTO cou_country (cou_name) VALUES ('Australie'); -- 162
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1162,'Fédération d''Australie de football',162);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1162);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1162);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Australie de football',1162);

INSERT INTO cou_country (cou_name) VALUES ('Bahreïn'); -- 163
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1163,'Fédération de Bahreïn de football',163);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1163);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1163);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Bahreïn de football',1163);

INSERT INTO cou_country (cou_name) VALUES ('Bangladesh'); -- 164
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1164,'Fédération du Bangladesh de football',164);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1164);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1164);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Bangladesh de football',1164);

INSERT INTO cou_country (cou_name) VALUES ('Bhoutan'); -- 165
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1165,'Fédération du Bhoutan de football',165);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1165);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1165);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Bhoutan de football',1165);

INSERT INTO cou_country (cou_name) VALUES ('Birmanie'); -- 166
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1166,'Fédération de Birmanie de football',166);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1166);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1166);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Birmanie de football',1166);

INSERT INTO cou_country (cou_name) VALUES ('Brunei'); -- 167
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1167,'Fédération de Brunei de football',167);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1167);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1167);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Brunei de football',1167);

INSERT INTO cou_country (cou_name) VALUES ('Cambodge'); -- 168
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1168,'Fédération du Cambodge de football',168);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1168);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1168);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Cambodge de football',1168);

INSERT INTO cou_country (cou_name) VALUES ('Chine'); -- 169
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1169,'Fédération de Chine de football',169);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1169);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1169);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Chine de football',1169);

INSERT INTO cou_country (cou_name) VALUES ('Corée du Nord'); -- 170
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1170,'Fédération de Corée du Nord de football',170);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1170);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1170);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Corée du Nord de football',1170);

INSERT INTO cou_country (cou_name) VALUES ('Corée du Sud'); -- 171
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1171,'Fédération de Corée du Sud de football',171);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1171);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1171);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Corée du Sud de football',1171);

INSERT INTO cou_country (cou_name) VALUES ('Émirats arabes unis'); -- 172
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1172,'Fédération des Émirats arabes unis de football',172);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1172);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1172);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Émirats arabes unis de football',1172);

INSERT INTO cou_country (cou_name) VALUES ('Guam'); -- 173
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1173,'Fédération de Guam de football',173);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1173);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1173);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Guam de football',1173);

INSERT INTO cou_country (cou_name) VALUES ('Hong Kong'); -- 174
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1174,'Fédération de Hong Kong de football',174);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1174);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1174);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Hong Kong de football',1174);

INSERT INTO cou_country (cou_name) VALUES ('Inde'); -- 175
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1175,'Fédération d''Inde de football',175);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1175);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1175);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Inde de football',1175);

INSERT INTO cou_country (cou_name) VALUES ('Indonésie'); -- 176
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1176,'Fédération d''Indonésie de football',176);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1176);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1176);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Indonésie de football',1176);

INSERT INTO cou_country (cou_name) VALUES ('Irak'); -- 177
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1177,'Fédération d''Irak de football|Fédération',177);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1177);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1177);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Irak de football',1177);

INSERT INTO cou_country (cou_name) VALUES ('Japon'); -- 178
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1178,'Fédération du Japon de football',178);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1178);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1178);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Japon de football',1178);

INSERT INTO cou_country (cou_name) VALUES ('Iran'); -- 179
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1179,'Fédération d''Iran de football',179);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1179);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1179);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Iran de football',1179);

INSERT INTO cou_country (cou_name) VALUES ('Jordanie'); -- 180
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1180,'Fédération de Jordanie de football',180);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1180);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1180);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Jordanie de football',1180);

INSERT INTO cou_country (cou_name) VALUES ('Kirghizistan'); -- 181
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1181,'Fédération du Kirghizistan de football',181);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1181);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1181);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Kirghizistan de football',1181);

INSERT INTO cou_country (cou_name) VALUES ('Koweït'); -- 182
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1182,'Fédération du Koweït de football',182);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1182);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1182);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Koweït de football',1182);

INSERT INTO cou_country (cou_name) VALUES ('Laos'); -- 183
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1183,'Fédération du Laos de football',183);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1183);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1183);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Laos de football',1183);

INSERT INTO cou_country (cou_name) VALUES ('Liban'); -- 184
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1184,'Fédération du Liban de football',184);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1184);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1184);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Liban de football',1184);

INSERT INTO cou_country (cou_name) VALUES ('Macao'); -- 185
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1185,'Fédération de Macao de football',185);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1185);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1185);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Macao de football',1185);

INSERT INTO cou_country (cou_name) VALUES ('Malaisie'); -- 186
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1186,'Fédération de Malaisie de football',186);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1186);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1186);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Malaisie de football',1186);

INSERT INTO cou_country (cou_name) VALUES ('Maldives'); -- 187
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1187,'Fédération des Maldives de football',187);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1187);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1187);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Maldives de football',1187);

INSERT INTO cou_country (cou_name) VALUES ('Mongolie'); -- 188
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1188,'Fédération de Mongolie de football',188);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1188);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1188);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Mongolie de football',1188);

INSERT INTO cou_country (cou_name) VALUES ('Népal'); -- 189
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1189,'Fédération du Népal de football',189);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1189);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1189);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Népal de football',1189);

INSERT INTO cou_country (cou_name) VALUES ('Oman'); -- 190
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1190,'Fédération d''Oman de football',190);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1190);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1190);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Oman de football',1190);

INSERT INTO cou_country (cou_name) VALUES ('Ouzbékistan'); -- 191
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1191,'Fédération d''Ouzbékistan de football',191);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1191);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1191);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe d''Ouzbékistan de football',1191);

INSERT INTO cou_country (cou_name) VALUES ('Pakistan'); -- 192
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1192,'Fédération du Pakistan de football',192);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1192);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1192);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Pakistan de football',1192);

INSERT INTO cou_country (cou_name) VALUES ('Palestine'); -- 193
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1193,'Fédération de Palestine de football',193);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1193);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1193);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Palestine de football',1193);

INSERT INTO cou_country (cou_name) VALUES ('Philippines'); -- 194
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1194,'Fédération des Philippines de football',194);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1194);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1194);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Philippines de football',1194);

INSERT INTO cou_country (cou_name) VALUES ('Qatar'); -- 195
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1195,'Fédération du Qatar de football',195);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1195);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1195);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Qatar de football',1195);

INSERT INTO cou_country (cou_name) VALUES ('Singapour'); -- 196
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1196,'Fédération de Singapour de football',196);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1196);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1196);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Singapour de football',1196);

INSERT INTO cou_country (cou_name) VALUES ('Sri Lanka'); -- 197
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1197,'Fédération du Sri Lanka de football',197);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1197);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1197);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Sri Lanka de football',1197);

INSERT INTO cou_country (cou_name) VALUES ('Syrie'); -- 198
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1198,'Fédération de Syrie de football',198);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1198);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1198);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Syrie de football',1198);

INSERT INTO cou_country (cou_name) VALUES ('Taïwan'); -- 199
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1199,'Fédération de Taïwan de football',199);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1199);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1199);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Taïwan de football',1199);

INSERT INTO cou_country (cou_name) VALUES ('Tadjikistan'); -- 200
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1200,'Fédération du Tadjikistan de football',200);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1200);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1200);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Tadjikistan de football',1200);

INSERT INTO cou_country (cou_name) VALUES ('Thaïlande'); -- 201
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1201,'Fédération de Thaïlande de football',201);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1201);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1201);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Thaïlande de football',1201);

INSERT INTO cou_country (cou_name) VALUES ('Timor oriental'); -- 202
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1202,'Fédération du Timor oriental de football',202);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1202);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1202);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Timor oriental de football',1202);

INSERT INTO cou_country (cou_name) VALUES ('Turkménistan'); -- 203
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1203,'Fédération du Turkménistan de football',203);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1203);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1203);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Turkménistan de football',1203);

INSERT INTO cou_country (cou_name) VALUES ('Viêt Nam'); -- 204
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1204,'Fédération du Viêt Nam de football',204);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1204);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1204);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Viêt Nam de football',1204);

INSERT INTO cou_country (cou_name) VALUES ('Yémen'); -- 205
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1205,'Fédération du Yémen de football',205);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1205);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1205);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Yémen de football',1205);

INSERT INTO cou_country (cou_name) VALUES ('Ïles Mariannes du Nord'); -- 206
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1206,'Fédération des Ïles Mariannes du Nord de football',206);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (13,1206);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Ïles Mariannes du Nord de football',1206);

INSERT INTO cou_country (cou_name) VALUES ('Fidji'); -- 207
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1207,'Fédération de Fidji de football',207);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1207);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1207);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Fidji de football',1207);

INSERT INTO cou_country (cou_name) VALUES ('Ïles Cook'); -- 208
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1208,'Fédération des Ïles Cook de football',208);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1208);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1208);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Ïles Cook de football',1208);

INSERT INTO cou_country (cou_name) VALUES ('Ïles Salomon'); -- 209
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1209,'Fédération des Ïles Salomon de football',209);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1209);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1209);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Ïles Salomon de football',1209);

INSERT INTO cou_country (cou_name) VALUES ('Nouvelle-Calédonie'); -- 210
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1210,'Fédération calédonienne de football',210);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1210);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1210);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Nouvelle-Calédonie de football',1210);

INSERT INTO cou_country (cou_name) VALUES ('Nouvelle-Zélande'); -- 211
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1211,'Fédération de Nouvelle-Zélande de football',211);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1211);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1211);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Nouvelle-Zélande de football',1211);

INSERT INTO cou_country (cou_name) VALUES ('Papouasie-Nouvelle-Guinée'); -- 212
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1212,'Fédération papouane-néo-guinéen de football',212);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1212);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1212);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Papouasie-Nouvelle-Guinée de football',1212);

INSERT INTO cou_country (cou_name) VALUES ('Samoa'); -- 213
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1213,'Fédération des Samoa de football',213);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1213);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1213);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Samoa de football',1213);

INSERT INTO cou_country (cou_name) VALUES ('Samoa américaines'); -- 214
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1214,'Fédération des Samoa américaines de football',214);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1214);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1214);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Samoa américaines de football',1214);

INSERT INTO cou_country (cou_name) VALUES ('Tahiti'); -- 215
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1215,'Fédération tahitienne de football',215);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1215);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1215);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Tahiti de football',1215);

INSERT INTO cou_country (cou_name) VALUES ('Tonga'); -- 216
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1216,'Fédération des Tonga de football',216);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1216);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1216);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Tonga de football',1216);

INSERT INTO cou_country (cou_name) VALUES ('Vanuatu'); -- 217
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1217,'Fédération du Vanuatu de football',217);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (1,1217);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1217);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe du Vanuatu de football',1217);

INSERT INTO cou_country (cou_name) VALUES ('Kiribati'); -- 218
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1218,'Fédération des Kiribati de football',218);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1218);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Kiribati de football',1218);

INSERT INTO cou_country (cou_name) VALUES ('Micronésie'); -- 219
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1219,'Fédération des États fédérés de Micronésie de football',219);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1219);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Micronésie de football',1219);

INSERT INTO cou_country (cou_name) VALUES ('Niué'); -- 220
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1220,'Fédération de Niué de football',220);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1220);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe de Niue de football',1220);

INSERT INTO cou_country (cou_name) VALUES ('Palaos'); -- 221
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1221,'Fédération des Palaos de football',221);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1221);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Palaos de football',1221);

INSERT INTO cou_country (cou_name) VALUES ('Tuvalu'); -- 222
INSERT INTO ass_association (ass_id,ass_name,ass_cou_id) values (1222,'Fédération des Tuvalu de football',222);
INSERT INTO lk_mbr_ass (mbr_ass_id__master,mbr_ass_id__slave) values (14,1222);
INSERT INTO tea_team (tea_name,tea_ass_id) VALUES ('Équipe des Tuvalu de football',1222);

