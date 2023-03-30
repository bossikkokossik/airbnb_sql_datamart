SELECT b.property_id, b.title, a.type_of_place
FROM type_of_place a
JOIN property b
ON a.type_of_place_id = b.property_id
WHERE type_of_place = "apartment" OR type_of_place = "hotel"
ORDER BY property_id



