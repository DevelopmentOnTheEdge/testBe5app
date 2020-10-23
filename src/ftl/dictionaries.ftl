DELETE FROM users WHERE user_name = 'Administrator';
DELETE FROM user_roles WHERE user_name = 'Administrator';

INSERT INTO users( user_name, user_pass ) VALUES( 'Administrator', '12345' );
INSERT INTO user_roles VALUES( 'Administrator', 'Administrator' );
INSERT INTO user_roles VALUES( 'Administrator', 'SystemDeveloper' );

DELETE FROM testtable WHERE name = 'test';
INSERT INTO testtable(name, value) VALUES ('yes', 1);
INSERT INTO testtable(name, value) VALUES ('no', 2);

DELETE FROM classifications
WHERE categoryID IN (SELECT ID FROM categories WHERE publicID LIKE 'TEST_CATEGORY%');
DELETE FROM categories
WHERE publicID LIKE 'TEST_CATEGORY%';
DELETE FROM categories
WHERE publicID = 'TEST_PARENT_CATEGORY';

INSERT INTO categories(entity, publicid, name, parentid, description)
values ('testtable', 'TEST_PARENT_CATEGORY', 'Parent test category', NULL, 'Description');

INSERT INTO categories(entity, publicid, name, parentid, description)
values ('testtable', 'TEST_CATEGORY_1', 'Test category 1',
(SELECT ID FROM categories WHERE publicID = 'TEST_PARENT_CATEGORY'), 'Description');

INSERT INTO categories(entity, publicid, name, parentid, description)
values ('testtable', 'TEST_CATEGORY_2', 'Test category 2',
(SELECT ID FROM categories WHERE publicID = 'TEST_PARENT_CATEGORY'), 'Description');

INSERT INTO classifications(recordID,categoryID)
SELECT CONCAT('testtable.', CAST(ID AS VARCHAR)),
CASE WHEN value = 1
    THEN (SELECT ID FROM categories WHERE publicID = 'TEST_CATEGORY_1')
    ELSE (SELECT ID FROM categories WHERE publicID = 'TEST_CATEGORY_2')
END
FROM testtable;
