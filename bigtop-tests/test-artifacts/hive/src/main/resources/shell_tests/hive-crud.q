DROP TABLE pokes;
DROP TABLE invites;
CREATE TABLE pokes (foo INT, bar STRING);
CREATE TABLE invites (foo INT, bar STRING) PARTITIONED BY (ds STRING);
ALTER TABLE pokes ADD COLUMNS (new_col INT);
ALTER TABLE invites ADD COLUMNS (new_col2 INT COMMENT 'a comment');
LOAD DATA LOCAL INPATH './examples/files/kv1.txt' OVERWRITE INTO TABLE pokes;
LOAD DATA LOCAL INPATH './examples/files/kv2.txt' OVERWRITE INTO TABLE invites PARTITION (ds='2008-08-15');
LOAD DATA LOCAL INPATH './examples/files/kv3.txt' OVERWRITE INTO TABLE invites PARTITION (ds='2008-08-08');

-- Finally, we now do a query...
SHOW DATABASES ; 

SELECT a.foo FROM invites a WHERE a.ds='2008-08-15';