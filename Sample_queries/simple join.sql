SELECT b.name AS "wishlist_name", c.title AS "property_title"
FROM Airbnb.wishlist_has_property a
JOIN wishlist b USING(wishlist_id)
JOIN property c USING(property_id)
LIMIT 10;
