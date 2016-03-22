# 客户基本信息表——风险风险要素分布查询（按季度）
select RISKFACTOR,COUNT(1) FROM t_ods_t51_custbaseinfo WHERE busi_date>='2015-07-01' and busi_date<='2015-09-31' GROUP BY RISKFACTOR;

# Market 交易市场
select MARKET,COUNT(1) FROM t_ods_t51_secuid WHERE busi_date>='2015-10-01' and busi_date<='2015-12-31' GROUP BY MARKET;

# FUNDASSET	客户货币资产表——FUNDBAL	到帐余额——今日余额
select SUM(FUNDBAL),COUNT(1), COUNT(distinct CUSTID) FROM t_ods_t51_fundasset WHERE busi_date>='2015-01-05' and busi_date<='2015-03-31' and moneytype='0';

# FUNDASSET	客户货币资产表——FUNDAVL	可用资金
select SUM(FUNDAVL),COUNT(1), COUNT(distinct CUSTID) FROM t_ods_t51_fundasset WHERE busi_date>='2015-04-01' and busi_date<='2015-06-31' and moneytype='0';

# FUNDASSET	客户货币资产表	MARKETVALUE	证券市值
select SUM(MARKETVALUE),avg(MARKETVALUE), COUNT(1),COUNT(distinct FUNDID), COUNT(distinct CUSTID) FROM t_ods_t51_fundasset WHERE busi_date>='2015-10-01' and busi_date<='2015-12-31' and moneytype='0'

#FUNDASSET	客户货币资产表	FUNDFRZ	冻结总金额 、交易冻结金额
select SUM(FUNDTRDFRZ),avg(FUNDTRDFRZ),sum(FUNDFRZ),avg(FUNDFRZ), COUNT(FUNDFRZ),COUNT(1),COUNT(distinct FUNDID), COUNT(distinct CUSTID) FROM t_ods_t51_fundasset WHERE busi_date>='2015-07-01' and busi_date<='2015-09-31' and moneytype='0'

# LOGASSET	资金流水表	MATCHQTY 成交数量 成交金额 成交笔数 成交价格 （总和与均值，以及次数）
select SUM(MATCHAMT),avg(MATCHAMT),sum(MATCHQTY),avg(MATCHQTY), sum(MATCHTIMES),avg(MATCHTIMES), sum(MATCHPRICE),avg(MATCHPRICE),COUNT(MATCHAMT),COUNT(MATCHTIMES),COUNT(MATCHPRICE),COUNT(distinct FUNDID), COUNT(distinct CUSTID) FROM t_ods_t51_logasset WHERE busi_date>='2015-10-01' and busi_date<='2015-12-31' and moneytype='0'

# LOGASSET	佣金  净佣金  
select SUM(FEE_SXF),avg(FEE_SXF),sum(FEE_JSXF),avg(FEE_JSXF), COUNT(FEE_SXF),COUNT(distinct FUNDID), COUNT(distinct CUSTID) FROM t_ods_t51_logasset WHERE busi_date>='2015-07-01' and busi_date<='2015-09-31' and moneytype='0'

# LOGASSET	资金流水表/委托单   MATCHQTY 成交金额的分布
select count (case when matchamt<10000 then 0 
                   when matchamt>10000 and matchamt<50000 then 1 
                   when matchamt>50000 and matchamt<100000 then 2 
                   when matchamt>100000 and matchamt<500000 then 3 
                   when matchamt>500000 and matchamt<1000000 then 4 
                   when matchamt>1000000 and matchamt<10000000 then 5 
                    else 6 end ) 
                    from t_ods_t51_ORDERREC where busi_date>='2015-01-05' and busi_date<='2015-12-31' and moneytype='0' group by 
                    (case when matchamt<10000 then 0 
                          when matchamt>10000 and matchamt<=50000 then 1 
                          when matchamt>50000 and matchamt<=100000 then 2 
                          when matchamt>100000 and matchamt<=500000 then 3 
                          when matchamt>500000 and matchamt<=1000000 then 4 
                          when matchamt>1000000 and matchamt<=10000000 then 5 
                     else 6 end)
					 
# LOGASSET	资金流水表   MATCHQTY 佣金的分布
select count (case when FEE_SXF<=10 then 0 
                   when FEE_SXF>10 and FEE_SXF<=100 then 1 
                   when FEE_SXF>100 and FEE_SXF<=500 then 2 
                   when FEE_SXF>500 and FEE_SXF<=1000 then 3 
                   when FEE_SXF>1000 and FEE_SXF<=5000 then 4 
                   when FEE_SXF>5000 and FEE_SXF<=10000 then 5 
                    else 6 end ) 
                    from t_ods_t51_logasset where busi_date>='2015-01-05' and busi_date<='2015-12-31' and moneytype='0' group by 
                    (case when FEE_SXF<=10 then 0 
                         when FEE_SXF>10 and FEE_SXF<=100 then 1 
                         when FEE_SXF>100 and FEE_SXF<=500 then 2 
                         when FEE_SXF>500 and FEE_SXF<=1000 then 3 
                         when FEE_SXF>1000 and FEE_SXF<=5000 then 4 
                         when FEE_SXF>5000 and FEE_SXF<=10000 then 5 
                     else 6 end)

# LOGASSET	资金流水表   MATCHQTY 净佣金的分布					 
select count (case when FEE_JSXF<=10 then 0 
                   when FEE_JSXF>10 and FEE_JSXF<=100 then 1 
                   when FEE_JSXF>100 and FEE_JSXF<=500 then 2 
                   when FEE_JSXF>500 and FEE_JSXF<=1000 then 3 
                   when FEE_JSXF>1000 and FEE_JSXF<=5000 then 4 
                   when FEE_JSXF>5000 and FEE_JSXF<=10000 then 5 
                    else 6 end ) 
                    from t_ods_t51_logasset where busi_date>='2015-01-05' and busi_date<='2015-12-31' and moneytype='0' group by 
                    (case when FEE_JSXF<=10 then 0 
                         when FEE_JSXF>10 and FEE_JSXF<=100 then 1 
                         when FEE_JSXF>100 and FEE_JSXF<=500 then 2 
                         when FEE_JSXF>500 and FEE_JSXF<=1000 then 3 
                         when FEE_JSXF>1000 and FEE_JSXF<=5000 then 4 
                         when FEE_JSXF>5000 and FEE_JSXF<=10000 then 5 
                     else 6 end)

# 创建净佣金的表格 包含FundId 和 FEE_JSXF.							 
create table if not exists fundid_trade_byShu as
select 
	fundid as fundid, 
	sum(FEE_JSXF) as FEE_JSXF
from odsuser.t_ods_t51_logasset where moneytype='0' and busi_date='2015-01-05' group by fundid;	

#  MATCHQTY 净佣金的分布(次数对应为每个FUNDID)	
select count (case when FEE_JSXF<=10 then 0 
                   when FEE_JSXF>10 and FEE_JSXF<=100 then 1 
                   when FEE_JSXF>100 and FEE_JSXF<=500 then 2 
                   when FEE_JSXF>500 and FEE_JSXF<=1000 then 3 
                   when FEE_JSXF>1000 and FEE_JSXF<=5000 then 4 
                            else 5 end ) 
                    from FUNDID_TRADE_BYSHU group by 
                    (case when FEE_JSXF<=10 then 0 
                         when FEE_JSXF>10 and FEE_JSXF<=100 then 1 
                         when FEE_JSXF>100 and FEE_JSXF<=500 then 2 
                         when FEE_JSXF>500 and FEE_JSXF<=1000 then 3 
                         when FEE_JSXF>1000 and FEE_JSXF<=5000 then 4 
                     else 5 end)