CREATE TABLE T1 (
    id integer NOT NULL,
    well character varying(100),
    name character varying(100),
);


CREATE TABLE T2 (
    id integer NOT NULL,
    well character varying(100),
    name character varying(100),
);

CREATE TABLE T3 (
    id integer NOT NULL,
    well character varying(100),
    name character varying(100),
);

CREATE TABLE T_can_link (
    can_id integer NOT NULL,
    can_prov INTEGER NOT NULL,
    id1 INTEGER,
    id2 INTEGER,
    id3 INTEGER
);

INSERT INTO T1 VALUES (1, 'GreenPeace', 'w11');
INSERT INTO T1 VALUES (3, 'BigBucks', 'w13');
INSERT INTO T1 VALUES (6, 'HealthyWell', 'w16');
INSERT INTO T1 VALUES (7, 'NoMore', 'w17');

INSERT INTO T2 VALUES (3, null, 'w23');
INSERT INTO T2 VALUES (4, 'BucksBig', 'w24');
INSERT INTO T2 VALUES (7, 'FilthyRich', 'w27');

INSERT INTO T3 VALUES (5, 'OtherWell', 'w35');
INSERT INTO T3 VALUES (6, 'TiredOne', 'w36');
INSERT INTO T3 VALUES (10, 'ColdBridge', 'w310');
INSERT INTO T3 VALUES (7, 'Heather', 'w37');


INSERT INTO T_can_link VALUES (1,1,1,3,5) ;
INSERT INTO T_can_link VALUES (4,2,null,4,6) ;
INSERT INTO T_can_link VALUES (1,3,3,null,null) ;
INSERT INTO T_can_link VALUES (6,1,6,null, 10) ;
INSERT INTO T_can_link VALUES (7,1,7,7,7) ;



ALTER TABLE T1
    ADD CONSTRAINT T1_pkey PRIMARY KEY (id);

ALTER TABLE T2
    ADD CONSTRAINT T2_pkey PRIMARY KEY (id);

ALTER TABLE T3
    ADD CONSTRAINT T3_pkey PRIMARY KEY (id);

ALTER TABLE T_can_link
    ADD CONSTRAINT T_can_link_pkey PRIMARY KEY (can_id,can_prov);

ALTER TABLE T_can_link
ADD CONSTRAINT T_can_pkey_12 UNIQUE (id1, id2);

ALTER TABLE T_can_link
ADD CONSTRAINT T_can_pkey_23 UNIQUE (id2, id3);

ALTER TABLE T_can_link
ADD CONSTRAINT T_can_pkey_13 UNIQUE (id1, id3);

ALTER TABLE T1 ADD FOREIGN KEY ( id ) REFERENCES T_can_link(id1) ;
ALTER TABLE T2 ADD FOREIGN KEY ( id ) REFERENCES T_can_link(id2) ;
ALTER TABLE T3 ADD FOREIGN KEY ( id ) REFERENCES T_can_link(id3) ;
