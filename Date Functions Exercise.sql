-- Databricks notebook source

--QUESTION 1 
--Return each order with the day name of the order date.

SELECT
order_id,
customer_id,
order_date,
DAYNAME(order_date) AS day_name
FROM date.sqldate.orders12;

--QUESTION 2
--Return each customer with the name of the month in which they signed up.
SELECT
    customer_id,
    customer_name,
    signup_date,
    MONTHNAME(signup_date) AS signup_month_name
FROM date.sqldate.customer_signups6;

--QUESTION 3
--Return each sale with the month number extracted from sale_date.

SELECT
    sale_id,
    product_name,
    sale_date,
    MONTH(sale_date) AS sale_month
FROM date.sqldate.sales16;

--QUESTION 4
--Return each transaction with the year extracted from transaction_date.
SELECT
    transaction_id,
    customer_id,
    transaction_date,
    YEAR(transaction_date) AS transaction_year
FROM date.sqldate.transactions19;

--QUESTION 5
--Return each delivery with the day of the month extracted from delivery_date.

SELECT
    delivery_id,
    customer_id,
    delivery_date,
    DAY(delivery_date) AS day_of_month
FROM date.sqldate.deliveries7;

--QUESTION 6
--Return all employees and add a column showing today's date.
SELECT
    employee_id,
    employee_name,
    department,
    CURRENT_DATE() AS today_date
FROM date.sqldate.employees8;

--QUESTION 7
--Convert the order_date_text string column into a proper date column.
SELECT
    order_id,
    customer_id,
    order_date_text,
    TO_DATE(order_date_text) AS order_date
FROM date.sqldate.online_orders11;

--QUESTION 8
--Format payment_date as a text string in the format YYYY-MM-DD.

SELECT
    payment_id,
    customer_id,
    payment_date,
    TO_CHAR(payment_date,'YYYY-MM-DD') AS formatted_payment_date
FROM date.sqldate.payment_dates13;

--QUESTION 9
--Calculate how many days have passed since each customer's last purchase. Use today's 

SELECT
    customer_id,
    customer_name,
    last_purchase_date,
    DATEDIFF(CURRENT_DATE(), last_purchase_date)
        AS days_since_last_purchase
FROM date.sqldate.customer_purchases4;

--QUESTION 10
--Calculate the expected delivery date by adding 7 days to the order_date.
SELECT
    order_id,
    customer_id,
    order_date,
    DATEADD(DAY,7,order_date)
        AS expected_delivery_date
FROM date.sqldate.shipping_orders17;

--QUESTION 11
--Extract the year, month number, and day from booking_date into three separate columns.
SELECT
    booking_id,
    customer_id,
    booking_date,
    YEAR(booking_date) AS booking_year,
    MONTH(booking_date) AS booking_month,
    DAY(booking_date) AS booking_day
FROM date.sqldate.bookings1;

--QUESTION 12
--Return only orders from the year 2026.
SELECT
    order_id,
    customer_id,
    order_date,
    YEAR(order_date) AS order_year,
    amount
FROM date.sqldate.yearly_orders21
WHERE YEAR(order_date)=2026;

--QUESTION 13
--Return only orders placed in March (month number 3).
SELECT
    order_id,
    customer_id,
    order_date,
    MONTH(order_date) AS order_month,
    amount
FROM date.sqldate.monthly_orders10
WHERE MONTH(order_date)=3;

--QUESTION 14
--Return the last day of the month for each subscription start date.
SELECT
    subscription_id,
    customer_id,
    start_date,
    LAST_DAY(start_date) AS month_end_date
FROM date.sqldate.subscriptions18;

--QUESTION 15
--Return the first day of the month for each campaign send date.
SELECT
    send_id,
    customer_id,
    send_date,
    DATE_TRUNC('MONTH',send_date) AS month_start_date
FROM date.sqldate.campaign_sends2;

--QUESTION 16
--Format invoice_date as a text string showing month name and year. Example: January 
2026

SELECT
    invoice_id,
    customer_id,
    invoice_date,
    TO_CHAR(invoice_date,'Month-YYYY')
        AS invoice_month_year
FROM date.sqldate.invoice_dates9;

--QUESTION 17
--Calculate each customer's age in years using their date of birth and today's date.
SELECT
    customer_id,
    customer_name,
    date_of_birth,
    FLOOR(DATEDIFF(CURRENT_DATE(),date_of_birth)/365.25)
        AS customer_age
FROM date.sqldate.customer_birthdays3;

--QUESTION 18
--Classify each order as Weekend or Weekday based on the day name of the order date. 
Saturday and Sunday = Weekend. All others = Weekday.

SELECT
    order_id,
    customer_id,
    order_date,
    DAYNAME(order_date) AS day_name,
    CASE
        WHEN DAYNAME(order_date) IN ('Saturday','Sunday')
        THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type
FROM date.sqldate.weekend_orders20;

--QUESTION 19
--Extract the quarter number from each transaction date.
SELECT
    transaction_id,
    customer_id,
    transaction_date,
    QUARTER(transaction_date) AS transaction_quarter,
    amount
FROM date.sqldate.quarterly_transactions14;

--QUESTION 20
--Return only orders that are more than 30 days old from today. Calculate days_since_order 
using today's date.

SELECT
    order_id,
    customer_id,
    order_date,
    DATEDIFF(CURRENT_DATE(),order_date)
        AS days_since_order,
    amount
FROM date.sqldate.recent_orders15
WHERE DATEDIFF(CURRENT_DATE(),order_date) > 30;

