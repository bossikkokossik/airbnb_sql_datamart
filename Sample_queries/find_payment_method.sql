SELECT 
	CONCAT(b.first_name," ",b.last_name) AS "user_name",
    a.payment_method
FROM Airbnb.payment_method a
JOIN user b ON a.payment_method_id = b.user_id
WHERE CONCAT(b.first_name," ",b.last_name) = "Destiny Armstrong";

