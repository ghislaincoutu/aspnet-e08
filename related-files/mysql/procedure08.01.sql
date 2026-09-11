USE aspnet08;
DELIMITER $$
CREATE PROCEDURE reset_database()
BEGIN
    TRUNCATE TABLE addresses;
    INSERT INTO aspnet08.addresses (id, cat_id, title, url, enterprise)
    SELECT id, cat_id, title, url, enterprise
    FROM webaddresses.addresses;
END $$
DELIMITER ;
