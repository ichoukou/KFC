ALTER TABLE T_LM_COREHOTELGROUP_DETAIL ADD GTYPE NVARCHAR2(1);

update T_LM_COREHOTELGROUP_DETAIL set GTYPE = '0'