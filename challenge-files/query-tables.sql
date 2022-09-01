---------------------------------------------------------
------------ Create view for joined tables --------------
---------------------------------------------------------
create view txn_list as

select txn_id, "date", amount, txns_noname.card, ch.name, ch_id, id_merchant
from (
	select id txn_id, "date", amount, t.card, cardholder_id ch_id, id_merchant
	from "transaction" t
	join credit_card cc
	on t.card = cc.card
) txns_noname
join card_holder ch 
on txns_noname.ch_id = ch.id

---------------------------------------------------------
---------- Lists transactions valued under $2 -----------
---------------------------------------------------------
create view small_txns as

select  *
from txn_list
where txn_list.amount < 2.00;

---------------------------------------------------------
-------- Lists those with the most txns under $2 --------
---------------------------------------------------------
create view small_txns_summary as

select name, count(txn_id) num_txns
from small_txns
group by name
order by num_txns desc;

---------------------------------------------------------
---- Lists transactions made between 07:00 and 09:00 ----
--------------------------------------------------------- 
create view early_txns as

select *
from txn_list
where "date"::time >= '07:00:00'::time
and "date"::time < '09:00:00'::time

---------------------------------------------------------
---- Lists those with the most txns early in the day ----
---------------------------------------------------------
create view early_txns_summary as

select name, count(txn_id) num_txns
from early_txns
group by name
order by num_txns desc;

---------------------------------------------------------
------ Lists 100 most expensive txns between 9 & 7 ------
---------------------------------------------------------
create view early_expensive_txns as

select *
from early_txns
order by amount desc
limit 100;

---------------------------------------------------------
-------------- Lists anomalous transactions -------------
---------------------------------------------------------
select ch_id
from early_expensive_txns eet 

---------------------------------------------------------
--- Are there more anomalous txns between 7am and 9am? --
--------------------------------------------------------- 


---------------------------------------------------------
------------ Top 5 merchants prone to hacking -----------
--------------------------------------------------------- 






