TRUNCATE TABLE mktOrders;
ALTER TABLE mktOrders auto_increment = 1;
TRUNCATE TABLE mktTransactions;
ALTER TABLE mktTransactions auto_increment = 1;


TRUNCATE TABLE mktData;
TRUNCATE TABLE mktHistory;
TRUNCATE TABLE mktUpdates;

DROP TABLE seed_migrations; 