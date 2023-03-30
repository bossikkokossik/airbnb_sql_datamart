CREATE VIEW `sender_receiver_message` AS
	SELECT 
		CONCAT(b.first_name," ",b.last_name) AS "sender_name",
		CONCAT(c.first_name," ",c.last_name) AS "receiver_name",
		a.content
	FROM messages a
	JOIN user b ON a.sender = b.iduser
	JOIN user c ON a.receiver = c.iduser



