create table if not exists fundid_trade as
select 
	custid as custid, 
	count(1) as tradefreq,
	sum(matchamt) as tradeamt,
	sum(fee_jsxf) as commission 
from odsuser.t_ods_t51_logasset where moneytype='0' and busi_date>='2015-01-01' and busi_date<='2015-12-31' group by custid;
--(custid=fundid)

create table if not exists fundid_asset as 
select 
	custid as custid,
	fundid as fundid,
	moneytype as moneytype,
	(fundbal+fundsale+funduncomesale+fundunfrz) as totalcash,
	marketvalue as stkval,
	(fundbal+fundsale+funduncomesale+fundunfrz+marketvalue) as totalasset
	busi_date as busidate
from odsuser.t_ods_t51_fundasset where moneytype='0' and busi_date in('2015-01-05','2015-03-31','2015-12-31','2015-06-30','2015-09-30');

create table if not exists custid_asset_avg as 
select 
	custid as custid,	
	avg(totalasset) as asset
from fundid_asset group by custid;


create table if not exists custid_fundamental as 
select 
	custid as custid,
	if(substr(idno,17,1) in ('0','1','2','3','4','5','6','7','8','9'),substr(idno,17,1),null) as sex,
	if(substr(idno,9,1) in ('0','1','2','3','4','5','6','7','8','9'),substr(idno,9,1),null) as age,
	if(substr(idno,1,2) in ('11','12','13','14','15','21','22','23','31','32','33','34','35','36','37','41','42','43','44','45','46','50','54','53','52','51','61','62','63','64','65'),substr(idno,1,2),null) as area,
	opendate as opendate
from odsuser.t_ods_t51_custbaseinfo where busi_date='2015-12-31' and idtype='0' and length(idno)=18;

create table if not exists custid_brhid as 
select 
	custid as custid,
	brhid as branchid
from odsuser.t_ods_t51_customer where busi_date='2015-12-31' and status !='*';

create table if not exists custid_commission as
select
	a.custid,
	a.branchid,
	b.sex,
	b.age,
	b.area,
	c.asset,
	d.tradefreq,
	d.tradeamt,
	d.commission 
from custid_brhid a join custid_fundamental b on a.custid=b.custid
join custid_asset_avg c on a.custid=c.custid
join fundid_trade d on a.custid=d.custid;