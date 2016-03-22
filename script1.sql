select count(1), count (distinct custid) from t_ods_t51_customer where busi_date='2015-12-31' and status!='*' ;


select case when length(idno)=15 then substr(idno,15,1) else substr(idno,17,1) end, count(1) from t_ods_t51_custbaseinfo b
where b.busi_date='2015-12-31' and b.idtype='0' and b.custid in 
(select a.custid from t_ods_t51_customer a where a.busi_date='2015-12-31' and status!='*')
group by case when length(idno)=15 then substr(idno,15,1) else substr(idno,17,1) end;


select substr(a.opendate,1,4),count (1) from t_ods_t51_custbaseinfo a where a.busi_date='2015-12-31' and a.custid in 
(select b.custid from t_ods_t51_customer b where b.busi_date='2015-12-31' and b.status!='*')
group by substr(a.opendate,1,4);


select substr(a.opendate,1,6),count (1) from t_ods_t51_custbaseinfo a where a.busi_date='2015-12-31' and substr(a.opendate,1,4)='2015' and a.custid in 
(select b.custid from t_ods_t51_customer b where b.busi_date='2015-12-31' and b.status!='*')
group by substr(a.opendate,1,6);


select a.edu ,count(1) from t_ods_t51_custbaseinfo a where a.busi_date='2015-12-31' and a.custid in 
(select b.custid from t_ods_t51_customer b where b.busi_date='2015-12-31' and b.status!='*')
group by a.edu;


select case when length(a.idno)=18 then substr(a.idno,9,1) else substr(a.idno,7,1) end, count (1) 
from t_ods_t51_custbaseinfo a 
where a.busi_date='2015-12-31' and a.idtype='0' and a.custid in 
(select b.custid from t_ods_t51_customer b where b.busi_date='2015-12-31' and b.status!='*')
group by case when length(a.idno)=18 then substr(a.idno,9,1) else substr(a.idno,7,1) end;


select substr(a.idno,1,2) as id,count(1) as fre from t_ods_t51_custbaseinfo a
where a.busi_date='2015-12-31' and a.idtype='0' and a.custid in 
(select b.custid from t_ods_t51_customer b where b.busi_date='2015-12-31' and b.status!='*')
group by substr(a.idno,1,2)


select substr(a.idno,1,2), count(1) from t_ods_t51_custbaseinfo a where a.busi_date='2015-12-31' and a.opendate>20150101 and a.idtype='0' and a.custid in 
(select b.custid from t_ods_t51_customer b where b.busi_date='2015-12-31' and b.status !='*')
group by substr(a.idno,1,2)


select substr(a.idno,9,1), count(1) from t_ods_t51_custbaseinfo a where a.busi_date='2015-12-31' and a.idtype='0' and a.opendate>20150101 and substr(a.idno,7,2)='19' and a.custid in 
(select b.custid from t_ods_t51_customer b where b.busi_date='2015-12-31' and b.status!='*')
group by substr(a.idno,9,1)

















