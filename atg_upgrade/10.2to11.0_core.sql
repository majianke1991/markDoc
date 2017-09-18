
 -- /10.2to11.0/DAS/sql/db_components/oracle/usage_tracking_ddl.sql



--  @version $Id: //product/DAS/main/release/migration/10.2to11.0/DAS/sql/db_components/oracle/usage_tracking_ddl.sql#1 $$Change: 832136 $
-- This file contains create table statements, which will configureyour database for usage tracking

create table das_usage_metric (
	usage_metric_id	number(19)	not null,
	server_identifier	varchar2(100)	not null,
	usage_date	timestamp	not null,
	usage_hour_of_day	number(3)	not null,
	usage_value	number(10)	default 0 not null
,constraint das_usage_metric_p primary key (usage_metric_id));





 -- /10.2to11.0/DAS/sql/db_components/oracle/create_staff_ddl.sql

alter table das_account
	add password_kdf	varchar2(250)	null;


 -- /10.2to11.0/DAF/Endeca/Index/sql/db_components/oracle/endeca_ddl.sql



--  @version $Id: //product/DAS/main/release/migration/10.2to11.0/DAF/Endeca/Index/sql/db_components/oracle/endeca_ddl.sql#1 $$Change: 832136 $
-- This file contains create table statements, which will configure your database for use with the new search schema.
-- Set up tables to store Endeca indexing state and history.

create table srch_end_state (
	config_path	varchar2(254)	not null,
	schedule	varchar2(254)	null
,constraint srche_state_p primary key (config_path));


create table srch_end_job (
	repository_id	varchar2(254)	not null,
	config_path	varchar2(254)	not null,
	server_id	varchar2(254)	not null,
	status	number(10)	null,
	start_time	timestamp	not null,
	end_time	timestamp	null,
	success	number(1)	null
,constraint srch_state_p primary key (repository_id)
,constraint srch_jb_end_ste_f1 foreign key (config_path) references srch_end_state (config_path));

create index srch_end_job_x on srch_end_job (config_path);
create index search_end_job_idx on srch_end_job (config_path,start_time desc);



 -- /10.2to11.0/DPS/sql/db_components/oracle/user_ddl.sql
alter table dps_user
		add password_kdf	varchar2(40)	null;

alter table dps_user
		modify password_salt	varchar2(250);
	


 -- /10.2to11.0/DSS/sql/db_components/oracle/scenario_ddl.sql

alter table dss_coll_trans
	modify server_id	varchar2(80);
	
alter table dss_ind_trans
	modify server_id	varchar2(80);

alter table dss_server_id
	modify server_id	varchar2(80);
	
alter table dss_server_id drop constraint dss_server_id_p drop index;	
alter table dss_server_id add constraint dss_server_id_p primary key (server_id);	

	
 -- /10.2to11.0/DCS/sql/db_components/oracle/order_ddl.sql

alter table dcspp_price_adjust
	add pricing_model_group_index	number(10)	null;

 -- /10.2to11.0/DCS/Search/Versioned/sql/db_components/oracle/versioned_commerce_refinement_ddl_cleanup.sql
--------------------------------
-- drop these table in future.
--------------------------------
/*
drop table dcs_cat_refcfg;
drop table dcs_refcfg_genels;
drop table dcs_refine_config;
*/
 -- /10.2to11.0/DCS/Search/Versioned/sql/db_components/oracle/versioned_custom_catalog_refinement_ddl_cleanup.sql
--------------------------------
-- drop these table in future.
--------------------------------
/*
drop table dcs_catalog_refcfg;
drop table dcs_catinfo_refcfg;
drop table dcs_refcfg_custom;
*/
 -- /10.2to11.0/DAF/Search/Topics/sql/db_components/oracle/search_topics_ddl_cleanup.sql
--------------------------------
-- drop these table in future.
--------------------------------
/*
drop table src_topic_label;
drop table src_topic_pat_seq;
drop table src_topic_pattern;
drop table src_global_macro;
drop table src_topicmacro_seq;
drop table src_topic_macro;
drop table src_roottopics_seq;
drop table src_topicchild_seq;
drop table src_topic;
drop table src_topic_set;
*/
-----------------------------------------------------------------------
-- add for Ashford
-----------------------------------------------------------------------

-- /10.2to11.0/DAF/TextSearch/Index/sql/install/oracle/search_pre_install.sql



-- 
-- This file contains SQL statements which will initialize the search lexer needed for text searching.


-- PLS-00904: insufficient privilege to access object CTXSYS.CTX_DDL
-- ALTER USER CTXSYS ACCOUNT UNLOCK;
-- GRANT EXECUTE ON "CTXSYS"."CTX_DDL" TO "QAB_CORE";

BEGIN
  ctx_ddl.create_preference('atgSearchLexer', 'BASIC_LEXER');
  ctx_ddl.set_attribute('atgSearchLexer', 'printjoins', '_-.');
EXCEPTION
  WHEN OTHERS THEN
      DBMS_OUTPUT.put_line('atgSearchLexer already exists!');
END;
/




 -- /10.2to11.0/DAF/TextSearch/Index/sql/install/oracle/search_ddl.sql



-- 	This file contains create table statements, which will configure your database for use with the new search schema.	
-- 	Add the srch_order_tokens... used to populate with properties from order that are text indexed.	

create table srch_order_tokens (
	id	varchar2(40)	not null,
	creation_date	timestamp	not null,
	last_modified_date	timestamp	null,
	tokens	clob	not null
,constraint srch_order_tokens_p primary key (id));

create index srch_ord_tokens_x1 on srch_order_tokens (last_modified_date);
--   Add the srch_order_modified... used to track changes to orders  

create table srch_order_modified (
	id	varchar2(40)	not null,
	last_modified_date	timestamp	not null
,constraint srch_order_modified_p primary key (id));

create index srch_order_mod_x1 on srch_order_modified (last_modified_date);
-- 	Add the srch_order_tokens... used to populate with properties from order that are text indexed.	

create table srch_profile_tokens (
	id	varchar2(40)	not null,
	creation_date	timestamp	not null,
	last_modified_date	timestamp	null,
	tokens	clob	not null
,constraint srch_profile_tokens_p primary key (id));

create index srch_pro_tokens_x1 on srch_profile_tokens (last_modified_date);
--   Add the srch_order_modified... used to track changes to orders  

create table srch_profile_modified (
	id	varchar2(40)	not null,
	last_modified_date	timestamp	not null
,constraint srch_profile_modified_p primary key (id));

create index srch_profile_mod_x1 on srch_profile_modified (last_modified_date);




 -- /10.2to11.0/DAF/TextSearch/Index/sql/install/oracle/search_post_install.sql



-- 
-- This file contains SQL statements which will create a text index on the search tables.

BEGIN
  EXECUTE IMMEDIATE 'CREATE INDEX SRCH_SEARCH_ORDER_IDX  ON SRCH_ORDER_TOKENS(tokens) INDEXTYPE IS CTXSYS.CONTEXT PARAMETERS (''SYNC (ON COMMIT) LEXER ATGSEARCHLEXER'')';
  EXECUTE IMMEDIATE 'CREATE INDEX SRCH_SEARCH_PROFILE_IDX  ON SRCH_PROFILE_TOKENS(tokens) INDEXTYPE IS CTXSYS.CONTEXT PARAMETERS (''SYNC (ON COMMIT) LEXER ATGSEARCHLEXER'')';
EXCEPTION
  WHEN OTHERS THEN
      DBMS_OUTPUT.put_line('Indexes already exist!');
END;
/


commit;