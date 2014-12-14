-- create cluster tables
-- %1$s default user

create table CLUSTER_SESSIONS (
	ID INT SIGNED NOT NULL,
	NAME VARCHAR(255)) ENGINE = BRIGHTHOUSE;


create table CLUSTER_SESSIONS_WRITABLE (
	ID INT SIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	NAME VARCHAR(255)) ENGINE = MYISAM;

	
create table CLUSTERS (
	ID INT SIGNED NOT NULL,
	USERNAME VARCHAR(50) NOT NULL,
  	SESSION_ID INT SIGNED NOT NULL,
  	SESSION_LOCAL_ID INT SIGNED,
  	LABEL VARCHAR (255),
  	CHILD_SESSION INT SIGNED,
  	AVG_ERROR FLOAT,
  	CLUSTER_SIZE INT SIGNED,
  	PARTITIONNAME VARCHAR (255) NOT NULL DEFAULT 'maintable') ENGINE = BRIGHTHOUSE;

create table CLUSTERS_WRITABLE (
	ID INT SIGNED NOT NULL AUTO_INCREMENT,
	USERNAME VARCHAR(50) NOT NULL DEFAULT '%1$s',
  	SESSION_ID INT SIGNED NOT NULL,
  	SESSION_LOCAL_ID INT SIGNED,
  	LABEL VARCHAR (255),
  	CHILD_SESSION INT SIGNED,
  	AVG_ERROR FLOAT,
  	CLUSTER_SIZE INT SIGNED,
  	PARTITIONNAME VARCHAR (255) NOT NULL DEFAULT 'maintable',
  	primary key (ID, USERNAME),
  	foreign key (SESSION_ID) references CLUSTER_SESSIONS (ID) on delete cascade) ENGINE = MYISAM;
  	
create table CLUSTER_SUBJECTS (
	CLUSTER_ID INT SIGNED NOT NULL,
	subject_id INT SIGNED NOT NULL) ENGINE = BRIGHTHOUSE;
	
create table CLUSTER_SUBJECTS_WRITABLE (
	CLUSTER_ID INT SIGNED NOT NULL,
	subject_id INT SIGNED NOT NULL,
	primary key (CLUSTER_ID, subject_id)
	) ENGINE = MYISAM;
--	, foreign key (CLUSTER_ID) references CLUSTERS(ID) on delete cascade
	
create table CLUSTER_MEANSCHEMA (
	CLUSTER_ID INT SIGNED NOT NULL,
	predicate_id INT SIGNED NOT NULL,
	RANK INT SIGNED) ENGINE = BRIGHTHOUSE;

create table CLUSTER_MEANSCHEMA_WRITABLE (
	CLUSTER_ID INT SIGNED NOT NULL,
	predicate_id INT SIGNED NOT NULL,
	RANK INT SIGNED
	) ENGINE = MYISAM;
--	, foreign key (CLUSTER_ID) references CLUSTERS(ID) on delete cascade
