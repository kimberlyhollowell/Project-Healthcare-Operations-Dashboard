-- =========================================
-- Healthcare Operations Dashboard
-- SQL Analysis Queries
-- =========================================

-- 1. Total requests by service category
SELECT
    service_category,
    COUNT(*) AS total_requests
FROM operations_data
GROUP BY service_category
ORDER BY total_requests DESC;


-- 2. Average resolution time by department
SELECT
    department,
    ROUND(AVG(resolution_hours), 2) AS avg_resolution_hours
FROM operations_data
GROUP BY department
ORDER BY avg_resolution_hours DESC;


-- 3. Request volume by department and service category
SELECT
    department,
    service_category,
    COUNT(*) AS request_count
FROM operations_data
GROUP BY department, service_category
ORDER BY department, request_count DESC;


-- 4. Monthly request trends
SELECT
    strftime('%Y-%m', date_opened) AS month,
    COUNT(*) AS total_requests
FROM operations_data
GROUP BY month
ORDER BY month;


-- 5. Requests exceeding SLA threshold (example: > 48 hours)
SELECT
    request_id,
    service_category,
    department,
    resolution_hours
FROM operations_data
WHERE resolution_hours > 48
ORDER BY resolution_hours DESC;


-- 6. Average resolution time by service category
SELECT
    service_category,
    ROUND(AVG(resolution_hours), 2) AS avg_resolution_hours
FROM operations_data
GROUP BY service_category
ORDER BY avg_resolution_hours DESC;


-- 7. Status distribution
SELECT
    status,
    COUNT(*) AS total_requests
FROM operations_data
GROUP BY status
ORDER BY total_requests DESC;
