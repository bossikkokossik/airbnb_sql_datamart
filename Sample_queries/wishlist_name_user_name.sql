SELECT
	a.name AS "wishlist_name", 
    CONCAT(b.first_name," ",b.last_name) AS "user_name"
FROM Airbnb.wishlist a
JOIN user b
ON a.user_iduser = b.iduser
LIMIT 10;


