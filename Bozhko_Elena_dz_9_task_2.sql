---������������ ������� �� ���� ��������� ��������� � �������, ��������"
--1
DROP FUNCTION IF EXISTS hello;

delimiter $$
$$
CREATE FUNCTION hello()
RETURNS text DETERMINISTIC
BEGIN
		DECLARE time int;
		SET time = hour(now());
		CASE
			WHEN time BETWEEN 0 AND 5 THEN
				RETURN '������ ����!';
			WHEN time BETWEEN 6 AND 11 THEN
				RETURN '������ ����!';
			WHEN time BETWEEN 12 AND 17 THEN
				RETURN '������ ����!';
			WHEN time BETWEEN 18 AND 23 THEN
				RETURN '������ �����!';
		END CASE;
end$$
delimiter;

SELECT hello()


--2
delimiter $$

DROP TRIGGER IF EXISTS not_null $$


CREATE TRIGGER not_null BEFORE INSERT ON products
FOR EACH ROW
BEGIN
		IF NEW.name IS NULL AND NEW.description IS NULL THEN
			signal SQLSTATE '45000' SET message_text = '��� �������� �� ����� ���� NULL';
		END IF;
END $$

DELIMITTER;

