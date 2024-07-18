CREATE DATABASE BANKNIFTY;
USE BANKNIFTY;

SELECT * FROM BNF;

-- 1. Daily Average Price
    
    SELECT date, (open + close) / 2 AS daily_avg_price FROM BNF limit 10;
    

-- 2. Highest Closing Price
    
    SELECT MAX(close) AS highest_closing_price FROM BNF;
    

-- 3. Lowest Closing Price
    
    SELECT MIN(close) AS lowest_closing_price FROM BNF;
    

-- 4. Total Volume Traded Per Year
    
    SELECT YEAR(date) AS year, SUM(volume) AS total_volume FROM BNF GROUP BY year;
    

-- 5. Average Daily Volume Traded Per Year
    
    SELECT YEAR(date) AS year, AVG(volume) AS avg_daily_volume FROM BNF GROUP BY year;
    

-- 6. Monthly Average Closing Price
    
    SELECT YEAR(date) AS year, MONTH(date) AS month, AVG(close) AS avg_closing_price FROM BNF GROUP BY year, month;
    

-- 7. Days with Closing Price Above a Certain Value
    
    SELECT COUNT(Close) AS days_above_value FROM BNF WHERE close > 15000;
    

-- 8. Percentage Change Between Open and Close
    
    SELECT date, ((close - open) / open) * 100 AS percentage_change FROM BNF;
    

-- 9. Total Number of Trading Days Per Year
    
    SELECT YEAR(date) AS year, COUNT(*) AS trading_days FROM BNF GROUP BY year;
    

-- 10. Maximum Intraday Range (High - Low)
    
    SELECT date, (high - low) AS intraday_range FROM BNF ORDER BY intraday_range DESC LIMIT 1;
    

-- 11. Average Intraday Range Per Year
    
    SELECT YEAR(date) AS year, AVG(high - low) AS avg_intraday_range FROM BNF GROUP BY year;
    

-- 12. Monthly High and Low Prices
    
    SELECT YEAR(date) AS year, MONTH(date) AS month, MAX(high) AS monthly_high, MIN(low) AS monthly_low FROM BNF GROUP BY year, month;
    

-- 13. Days with Volume Above Average
    
    SELECT COUNT(*) AS days_above_avg_volume FROM BNF WHERE volume > (SELECT AVG(volume) FROM BNF);
    

-- 14. Daily Price Change (Close - Open)
    
    SELECT date, (close - open) AS price_change FROM BNF;
    

-- 15. Cumulative Volume Traded Over Time
    
    SELECT date, SUM(volume) OVER (ORDER BY date) AS cumulative_volume FROM BNF;
    

-- 16. Top 10 Days with Highest Volume
    
    SELECT date, volume FROM BNF ORDER BY volume DESC LIMIT 10;
    

-- 17. Average Opening Price Per Month
    
    SELECT YEAR(date) AS year, MONTH(date) AS month, AVG(open) AS avg_opening_price FROM BNF GROUP BY year, month;
    

-- 18. Days with Closing Price Higher Than Opening Price
    
    SELECT COUNT(*) AS days_close_higher_than_open FROM BNF WHERE close > open;
    

-- 19. Yearly High and Low Prices
    
    SELECT YEAR(date) AS year, MAX(high) AS yearly_high, MIN(low) AS yearly_low FROM BNF GROUP BY year;
    

-- 20. Days with Maximum Price Change
    
    SELECT date, (close - open) AS price_change FROM BNF ORDER BY price_change DESC LIMIT 1;
    

-- 21. Daily Volume Percentage Change
    
    SELECT date, ((volume - LAG(volume) OVER (ORDER BY date)) / LAG(volume) OVER (ORDER BY date)) * 100 AS volume_percentage_change FROM BNF;
    

-- 22. Total Volume Traded Each Month
    
    SELECT YEAR(date) AS year, MONTH(date) AS month, SUM(volume) AS total_monthly_volume FROM BNF GROUP BY year, month;
    

-- 23. Average Daily Closing Price Per Year
    
    SELECT YEAR(date) AS year, AVG(close) AS avg_daily_closing_price FROM BNF GROUP BY year;
    

-- 24. Days with Price Movement Greater Than a Threshold
    
    SELECT COUNT(*) AS days_price_movement_gt_threshold FROM BNF WHERE ABS(close - open) > 500;
    

-- 25. Top 5 Days with Lowest Closing Price
    
    SELECT date, close FROM BNF ORDER BY close ASC LIMIT 5;
    

-- 26. Average Daily High and Low Difference Per Month
    
    SELECT YEAR(date) AS year, MONTH(date) AS month, AVG(high - low) AS avg_high_low_diff FROM BNF GROUP BY year, month;
    

-- 27. Yearly Volume Traded on Average
    
    SELECT YEAR(date) AS year, AVG(volume) AS avg_yearly_volume FROM BNF GROUP BY year;
    

-- 28. Days with Highest Percentage Gain
    
    SELECT date, ((close - open) / open) * 100 AS percentage_gain FROM BNF ORDER BY percentage_gain DESC LIMIT 1;
    

-- 29. Monthly Volume Percentage Change
    
    SELECT YEAR(date) AS year, MONTH(date) AS month, ((SUM(volume) - LAG(SUM(volume)) OVER (ORDER BY YEAR(date), MONTH(date))) / LAG(SUM(volume)) OVER (ORDER BY YEAR(date), MONTH(date))) * 100 AS monthly_volume_percentage_change FROM BNF GROUP BY year, month;
    

-- 30. Top 5 Days with Highest Closing Price
    
    SELECT date, close FROM BNF ORDER BY close DESC LIMIT 5;
    

-- 31. Average Daily Volume for Each Year
    
    SELECT YEAR(date) AS year, AVG(volume) AS avg_daily_volume FROM BNF GROUP BY year;
    

-- 32. Total Trading Volume for Each Month
    
    SELECT YEAR(date) AS year, MONTH(date) AS month, SUM(volume) AS total_monthly_volume FROM BNF GROUP BY year, month;
    

-- 33. Average Daily Price Change Per Year
    
    SELECT YEAR(date) AS year, AVG(close - open) AS avg_daily_price_change FROM BNF GROUP BY year;
    

-- 34. Days with Low Price Equal to High Price
    
    SELECT COUNT(*) AS days_low_equals_high FROM BNF WHERE low = high;
    

-- 35. Days with Maximum Percentage Loss
    
    SELECT date, ((close - open) / open) * 100 AS percentage_loss FROM BNF ORDER BY percentage_loss ASC LIMIT 1;
    

-- 36. Yearly Average High and Low Prices
    
    SELECT YEAR(date) AS year, AVG(high) AS avg_yearly_high, AVG(low) AS avg_yearly_low FROM BNF GROUP BY year;
    

-- 37. Monthly Price Change Average
    
    SELECT YEAR(date) AS year, MONTH(date) AS month, AVG(close - open) AS avg_monthly_price_change FROM BNF GROUP BY year, month;
    

-- 38. Days with Closing Price Lower Than Opening Price
    
    SELECT COUNT(*) AS days_close_lower_than_open FROM BNF WHERE close < open;
    

-- 39. Monthly Highest Volume Traded
    
    SELECT YEAR(date) AS year, MONTH(date) AS month, MAX(volume) AS highest_monthly_volume FROM BNF GROUP BY year, month;
    

-- 40. Cumulative Closing Price Over Time
    
    SELECT date, SUM(close) OVER (ORDER BY date) AS cumulative_closing_price FROM BNF;


-- This analysis aims to provide a comprehensive overview of the Banknifty dataset from 2014 to 2024 by examining various financial metrics.
-- It includes evaluating daily, monthly, and yearly price movements, trading volumes, and significant market events.
-- By performing these SQL queries, we can identify trends, volatility, and key performance indicators, which are crucial for making informed trading and investment decisions. 
-- This analysis serves as a foundation for more advanced financial modeling and strategy development.