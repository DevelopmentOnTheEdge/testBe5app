DELETE FROM users WHERE user_name = 'Administrator';
DELETE FROM user_roles WHERE user_name = 'Administrator';

INSERT INTO users( user_name, user_pass ) VALUES( 'Administrator', '12345' );
INSERT INTO user_roles VALUES( 'Administrator', 'Administrator' );
INSERT INTO user_roles VALUES( 'Administrator', 'SystemDeveloper' );

DELETE FROM testtable WHERE name = 'test';
INSERT INTO testtable(name, value) VALUES ('test', 1);
INSERT INTO testtable(name, value) VALUES ('test', 2);
