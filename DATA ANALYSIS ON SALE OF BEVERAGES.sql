use sql_project;
# TO VIEW THE DATASET 
SELECT *FROM sales;

#ANALYSIS OF THE DATASET
#1. TOTAL SALES AND PROFIT OF EACH STATE
SELECT 
    state,
    SUM(sales) AS total_state,
    SUM(profit) AS total_profit
FROM
    sales
GROUP BY state;

#2. AVERAGE MARGIN OF EACH MARKET
SELECT 
    market, AVG(margin) AS average_margin
FROM
    sales
GROUP BY market;

#3. PRODUCT WITH HIGHEST SALES
SELECT 
    product
FROM
    sales
ORDER BY sales DESC
LIMIT 1; 

#4. TOTAL EXPENSES OF EACH PRODUCT TYPE
SELECT 
    product_type, SUM(total_expenses) AS total_expenses
FROM
    sales
GROUP BY product_type;

#5. AGGREGATE BUDGET PROFIT, BUDGET COGS, BUDGET SALES OF COFFEE OVER YEARS
SELECT 
    product_type AS coffee,
    SUM(budget_profit) AS aggregate_budget_profit,
    SUM(budget_COGS) AS aggregate_budget_COGS,
    SUM(budget_sales) AS aggregate_budget_sales
FROM
    sales
GROUP BY Product_Type;
    
#6. PRODUCT WITH INVENTORY EXPENSE GREATER THAN 4000 DOLLARS
SELECT 
    inventory, product
FROM
    sales
WHERE
    inventory > 4000;
    
#7. MARKET SIZE AND SALES OF WASHINGTON 
SELECT 
    market_size, SUM(sales)
FROM
    sales
WHERE
    state = 'Washington'
GROUP BY market_size;

#8. TOP MARKET WITH HIGHEST BUDGET MARGIN 
SELECT 
    market, SUM(budget_margin) AS budget_margin
FROM
    sales
GROUP BY market
ORDER BY SUM(budget_margin) desc limit 1;

#9. TOTAL SALES AND TOTAL PROFIT FOR ESPRESSO IN VARIOUS MARKET
SELECT 
    product_type,
    market,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM
    sales
WHERE
    product_type = 'espresso'
GROUP BY product_type , market;

#10. AVERAGE COGS OF EACH PRODUCT TYPE IN SOUTH MARKET
SELECT 
    product_type, market, AVG(COGS)
FROM
    sales
WHERE
    market = 'South'
GROUP BY product_type;

#11. TOTAL MARKETING EXPENSE AND TOTAL INVENTORY FOR EACH STATE
SELECT 
    state,
    SUM(marketing) AS total_marketing_expenses,
    SUM(inventory) AS total_inventory_expenses
FROM
    sales
GROUP BY state;

#12. DATE WITH HIGHEST SALE AND THE CORRESPONDING MARKET
SELECT 
    `date`, market, sales
FROM
    sales
WHERE
    sales = (SELECT 
            MAX(sales)
        FROM
            sales); 
            
#13. PRODUCTS WITH ACTUAL PROFIT GREATER THAN BUDGETED PROFIT
SELECT 
    product,
    SUM(budget_profit) AS total_budget_profit,
    SUM(profit) AS total_actual_profit
FROM
    sales
GROUP BY product
HAVING total_actual_profit > total_budget_profit;

#14. TOTAL AND ACTUAL BUDGET SALES OF EACH MARKET
SELECT 
    Market,
    SUM(budget_sales) AS total_budget_sales,
    SUM(sales) AS total_actual_sales
FROM
    sales
    group by market;

#15. PRODUCTS WITH ACTUAL MARGIN GREATER THAN BUDGETED MARGIN
SELECT 
    product,
    SUM(budget_margin) AS total_budget_margin,
    SUM(margin) AS total_actual_margin
FROM
    sales
GROUP BY product
HAVING total_actual_margin > total_budget_margin;

#16. TOP 5 STATES WITH HIGHEST SALES
SELECT 
    State, SUM(sales) AS total_sales
FROM
    sales
GROUP BY state
ORDER BY SUM(sales) desc limit 5;

#17. AVERAGE PROFIT MARGIN FOR EACH MARKET SIZE
SELECT 
    market_size,
    AVG((profit / sales) * 100) AS average_profit_margin
FROM
    sales
GROUP BY market_size;

#18. TOTAL MARKETING EXPENSES AS % OF SALES OF EACH PRODUCT TYPE
SELECT 
    product_type,
    (SUM(marketing) / SUM(sales)) * 100 AS marketing_expense_percentage
FROM
    sales
GROUP BY product_type;

#19. SHARE OF INVENTORY EXPENSES IN TOTAL EXPENSES OF EACH PRODUCT 
SELECT 
    product,
    (SUM(inventory) / SUM(total_expenses)) AS inventory_expenses_percentage
FROM
    sales
GROUP BY product;

#20. PRODUCT WITH HIGHEST BUDGET MARGIN
SELECT 
    product, `date`, state, budget_margin
FROM
    sales
ORDER BY budget_margin DESC
LIMIT 1;
 
