SELECT 
	images.property_id,
	COUNT(images.image) AS "Number of pictures"
FROM images
WHERE images.property_id IN (
	SELECT property.idproperty
	FROM property
	JOIN rooms_beds
	ON property.idproperty = rooms_beds.idrooms_beds
	WHERE rooms_beds.beds > 3)
GROUP BY images.property_id

