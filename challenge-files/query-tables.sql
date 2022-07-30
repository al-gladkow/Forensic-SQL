/*select id
from card_holder
where id in (
	
	select cardholder_id 
	from credit_card
	where card in (
	
		select transaction.card from
	
	)
);
group by card_holder.id;*/



/*select count(id)
from t
where id in (

	select id
	from "transaction" t 
	where t.amount < 2

);*/


/*
--
select count(id), id
from "transaction" t 
where t.amount < 2
group by id;*/

/*-- How many cards does each card holder have?
select cardholder_id, count(card)
from  credit_card cc 
group by cardholder_id;


-- Transaction IDs for transactions less than $2.00
select id
from "transaction" t 
where amount < 2;*/

/*select cardholder_id as holder_id
from card_holder ch
where holder_id in (

	select card, count(id) as "potential fraud txns"
	from "transaction"
	where amount < 2.00
	group by card
	order by count(id) desc

);*/

/*select card, count(id) as "#txns"
from "transaction"
where amount < 2.00
group by card;*/


/*select card
from "transaction" t 
where amount < 2.00*/

/*select credit_card.cardholder_id as ccid
from credit_card
where card in (
	select card
	from "transaction" t 
	where amount < 2.00
)
group by ccid*/

/*	select card, id, amount
	from "transaction"
	where amount < 2.00*/


/*where amount < 2.00
group by card
order by count(id) desc

select cardholder_id, txns.card
from credit_card cc
full outer join(
	select card, count(id) as "#txns"
	from "transaction"
	where amount < 2.00
	group by card
	order by count(id) desc
) txns
on cc.card = txns.card
group by cardholder_id;*/


select id as "txn_id", "date", amount, t.card, cardholder_id
from "transaction" t
inner join credit_card cc
on t.card = cc.card










