SELECT 
	a.property_id,
    a.title,
    b.base_price
FROM property a
JOIN price b ON a.property_id = b.price_id
WHERE b.base_price < 100 AND b.base_price > 50
ORDER BY b.base_price ASC;

