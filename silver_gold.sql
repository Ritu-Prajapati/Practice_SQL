# total sales quantity > 5 m the market is considered gold else it is silver 
#my input : market ; fy
# output : market badge 
-- select if(gross_price_total>5000000,'Gold', 'Silver') as market from (
select 
		 g.fiscal_year, c.market , sum(g.gross_price * s.sold_quantity) as gross_price_total
        from fact_sales_monthly s
join dim_customer c 
on s.customer_code = c.customer_code 
join fact_gross_price g
on  g.product_code = s.product_code and 
	g.fiscal_year = get_fiscal_year(s.date)
where c.market = 'Canada'
and g.fiscal_year = 2018
group by g.fiscal_year, c.market
ORDER BY g.fiscal_year asc
-- ) tt
