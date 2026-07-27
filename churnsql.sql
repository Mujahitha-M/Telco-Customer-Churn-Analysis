CREATE TABLE public.customer_churn (
    customerID VARCHAR(50),
    gender VARCHAR(20),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(30),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges NUMERIC(10,2),
    TotalCharges NUMERIC(10,2),
    Churn VARCHAR(10)
);
--Query 1 - Total Customers
SELECT COUNT(*) AS total_customers
FROM customer_churn;

--Query 2 - Churn Rate
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn;

--Query 3 - Contract Type vs Churn
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_customers,
    ROUND(
        SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate
FROM customer_churn;

--Query 4: Gender-wise Customer Distribution
SELECT
    Gender,
    COUNT(*) AS total_customers
FROM customer_churn
GROUP BY Gender;

--Query 5: Internet Service Distribution
SELECT
    InternetService,
    COUNT(*) AS total_customers
FROM customer_churn
GROUP BY InternetService
ORDER BY total_customers DESC;