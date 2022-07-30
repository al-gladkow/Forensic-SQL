---------------------------------------------------------
------------ Create view for joined tables --------------
---------------------------------------------------------
create view txn_list as
select txn_id, amount, txns_noname.card, ch.name, ch_id, id_merchant
from (
	select id txn_id, amount, t.card, cardholder_id ch_id, id_merchant
	from "transaction" t
	join credit_card cc
	on t.card = cc.card
) txns_noname
join card_holder ch 
on txns_noname.ch_id = ch.id

---------------------------------------------------------
-- Lists people with the most transactions less than $2 -
---------------------------------------------------------
create view small_txns as

select  ch_id, name, count(txn_id) num_txns
from txn_list
where txn_list.amount < 2.00
group by name, ch_id
order by num_txns desc;

---------------------------------------------------------
---- Lists transactions made between 07:00 and 09:00 ----
--------------------------------------------------------- 
create view early_txns as

select id, "date"::time
from "transaction" t
where date::time >= '07:00:00'::time
and date::time < '09:00:00'::time

---------------------------------------------------------
-------------- Lists anomalous transactions -------------
---------------------------------------------------------


---------------------------------------------------------
--- Are there more anomalous txns between 7am and 9am? --
--------------------------------------------------------- 


---------------------------------------------------------
------------ Top 5 merchants prone to hacking -----------
--------------------------------------------------------- 






