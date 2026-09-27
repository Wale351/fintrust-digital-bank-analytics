-- Q1 - Transactions by Customer Segment
SELECT
            c.Customer_Segment,
            COUNT(*) AS Transaction_Count
        FROM transactions t
        JOIN customers c
            ON t.Customer_ID = c.Customer_ID
        GROUP BY c.Customer_Segment
        ORDER BY Transaction_Count DESC;

-- Q2 - Transaction Value by Customer Segment
SELECT
            c.Customer_Segment,
            ROUND(SUM(t.Amount_NGN), 2) AS Total_Transaction_Value
        FROM transactions t
        JOIN customers c
            ON t.Customer_ID = c.Customer_ID
        GROUP BY c.Customer_Segment
        ORDER BY Total_Transaction_Value DESC;

-- Q3 - Transactions by Channel
SELECT
            Channel,
            COUNT(*) AS Transaction_Count
        FROM transactions
        GROUP BY Channel
        ORDER BY Transaction_Count DESC;

-- Q4 - Transaction Status Distribution
SELECT
            Transaction_Status,
            COUNT(*) AS Transaction_Count,
            ROUND(
                COUNT(*) * 100.0 /
                (SELECT COUNT(*) FROM transactions), 2
            ) AS Percentage
        FROM transactions
        GROUP BY Transaction_Status
        ORDER BY Transaction_Count DESC;

-- Q5 - Transactions by Type
SELECT
            Transaction_Type,
            COUNT(*) AS Transaction_Count
        FROM transactions
        GROUP BY Transaction_Type
        ORDER BY Transaction_Count DESC;

-- Q6 - Average Transaction Value by Segment
SELECT
            c.Customer_Segment,
            ROUND(AVG(t.Amount_NGN), 2) AS Average_Transaction_Value
        FROM transactions t
        JOIN customers c
            ON t.Customer_ID = c.Customer_ID
        GROUP BY c.Customer_Segment
        ORDER BY Average_Transaction_Value DESC;

-- Q7 - Risk Review Distribution
SELECT
            Risk_Review_Flag,
            COUNT(*) AS Transaction_Count,
            ROUND(
                COUNT(*) * 100.0 /
                (SELECT COUNT(*) FROM transactions), 2
            ) AS Percentage
        FROM transactions
        GROUP BY Risk_Review_Flag
        ORDER BY Transaction_Count DESC;

-- Q8 - International Transaction Distribution
SELECT
            International_Transaction,
            COUNT(*) AS Transaction_Count,
            ROUND(
                COUNT(*) * 100.0 /
                (SELECT COUNT(*) FROM transactions), 2
            ) AS Percentage
        FROM transactions
        GROUP BY International_Transaction
        ORDER BY Transaction_Count DESC;

