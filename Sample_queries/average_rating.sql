SELECT 
	b.first_name,
    b.last_name, 
    ROUND(AVG(a.rating),2) AS "Average_rating"
FROM Airbnb.review_rating a
JOIN user b ON a.user_id = b.user_id
GROUP BY a.user_id
ORDER BY AVG(a.rating) DESC
LIMIT 10;

