---� ���� ������ shop � sample ������������ ���� � �� �� �������, ������� ���� ������. 
---����������� ������ id = 1 �� ������� shop.users � ������� sample.users. ����������� ����������.
START TRANSACTION;

INSERT INTO sample.users
SELECT id, name
FROM shop.users
WHERE id = 1;

DELETE FROM shop.users
WHERE id = 1;

COMMIT;



----�������� �������������, ������� ������� �������� name �������� ������� �� ������� products � ��������������� �������� 
---�������� name �� ������� catalogs.

CREATE VIEW name_and_type AS
SELECT p.name, c.name AS 'type'
FROM products p
JOIN
catalogs c
WHERE p.catalog_id = c.id

SELECT *
FROM name_and_type


------����� ������� ������� � ����������� ����� created_at. � ��� ��������� ���������� ����������� ������
 --�� ������ 2018 ���� '2018-08-01', '2016-08-04', '2018-08-16' � 2018-08-17. ��������� ������, ������� ������� ������ 
 --������ ��� �� ������, ��������� � �������� ���� �������� 1, ���� ���� ������������ � �������� ������� � 0, ���� ��� �����������.

CREATE TABLE IF NOT EXISTS tasktable (
	id serial PRIMARY KEY,
	created_at date NOT NULL
);

INSERT INTO tasktable (id, created_at) values
	(1, '2018-08-01'),
	(2, '2016-08-04'),
	(3, '2018-08-16'),
	(4, '2018-08-17');

CREATE TABLE IF NOT EXISTS august (
	id serial PRIMARY KEY,
	created_at date NOT NULL
);

INSERT INTO august (id, created_at) VALUES
	(1, '2018-08-01'),
	(2, '2018-08-02'),
	(3, '2018-08-03'),
	(4, '2018-08-04'),
	(5, '2018-08-05'),
	(6, '2018-08-06'),
	(7, '2018-08-07'),
	(8, '2018-08-08'),
	(9, '2018-08-09'),
	(10, '2018-08-10'),
	(11, '2018-08-11'),
	(12, '2018-08-12'),
	(13, '2018-08-13'),
	(14, '2018-08-14'),
	(15, '2018-08-15'),
	(16, '2018-08-16'),
	(17, '2018-08-17'),
	(18, '2018-08-18'),
	(19, '2018-08-19'),
	(20, '2018-08-20'),
	(21, '2018-08-21'),
	(22, '2018-08-22'),
	(23, '2018-08-23'),
	(24, '2018-08-24'),
	(25, '2018-08-25'),
	(26, '2018-08-26'),
	(27, '2018-08-27'),
	(28, '2018-08-28'),
	(29, '2018-08-29'),
	(30, '2018-08-30'),
	(31, '2018-08-31');

SELECT a.created_at, (
	CASE
		WHEN a.created_at = t.created_at THEN 1 ELSE 0 end) AS 'Boolean'
FROM august a
JOIN
tasktable t
GROUP BY a.created_at, 'Boolean'
	
	
	
	
----- ����� ������� ����� ������� � ����������� ����� created_at. �������� ������, ������� ������� ���������� ������ �� �������, 
--�������� ������ 5 ����� ������ �������.

DELETE FROM august
WHERE created_at NOT IN (
SELECT *
FROM (
	SELECT created_at
	FROM august
	ORDER BY created_at DESC
	LIMIT 5
) x
)
