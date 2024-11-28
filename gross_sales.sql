#Module: Stored Procedures: Monthly Gross Sales Report
--  month 
-- total gross sales amount  to croma india this month 

select 
		s.date , sum(g.gross_price * s.sold_quantity) as gross_price_total
        from fact_sales_monthly s
join fact_gross_price g
on  g.product_code = s.product_code and 
	g.fiscal_year = get_fiscal_year(s.date)
 where customer_code = 90002002
group by s.date
ORDER BY s.date asc
