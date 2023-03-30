SELECT receiver_name, COUNT(*) AS "count"
FROM Airbnb.sender_receiver_message
GROUP BY receiver_name
ORDER BY "count" DESC
LIMIT 3;

