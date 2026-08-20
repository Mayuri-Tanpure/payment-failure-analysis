USE payment_analysis;
SHOW TABLES;
SELECT * FROM payment_transactions LIMIT 5;
SELECT COUNT(*) FROM payment_transactions;
SELECT status, COUNT(*) AS total_transactions
FROM payment_transactions
GROUP BY status; 
SELECT 
    COUNT(CASE WHEN status = 'Failed' THEN 1 END) * 100.0 / COUNT(*) AS failure_rate
FROM payment_transactions; 
SELECT payment_method, COUNT(*) AS failed_transactions
FROM payment_transactions
WHERE status = 'Failed'
GROUP BY payment_method
ORDER BY failed_transactions DESC;
SELECT
    payment_method,
    COUNT(*) AS total_transactions,
    SUM(status = 'Failed') AS failed_transactions,
    ROUND(SUM(status = 'Failed') * 100.0 / COUNT(*), 2) AS failure_rate
FROM payment_transactions
GROUP BY payment_method
ORDER BY failure_rate DESC;
SELECT MAX(amount) AS highest_transaction
FROM payment_transactions;
SELECT ROUND(AVG(amount), 2) AS average_transaction
FROM payment_transactions;
SELECT ROUND(SUM(amount), 2) AS total_transaction_amount
FROM payment_transactions;
SELECT 
    status,
    ROUND(SUM(amount), 2) AS total_amount
FROM payment_transactions
GROUP BY status;
SELECT 
    payment_method,
    COUNT(*) AS total_transactions
FROM payment_transactions
GROUP BY payment_method
ORDER BY total_transactions DESC;