SELECT 
	ROUND(AVG(rooms_beds.bedrooms),1)  AS "Avergage bedrooms",
    ROUND(AVG(rooms_beds.beds),1)  AS "Avergage beds",
    ROUND(AVG(rooms_beds.bathrooms),1)  AS "Avergage bathrooms"
FROM rooms_beds

