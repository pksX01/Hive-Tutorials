create database if not exists newDb;
use newDb;

create table if not exists newOrders (oid string,cid string, pid string, quantity int, price int, zipcode int, state string)
row format delimited
fields terminated by ','
lines terminated by '\n'
stored as textfile;

set hive.exec.dynamic.partition = true;
set hive.exec.dynamic.partition.mode = nonstrict;
set hive.enforce.bucketing = true;

create external table newOrders_part_buck (oid string,cid string, pid string, quantity int, price int, zipcode int)
partitioned by (state string)
clustered by (oid) into 3 buckets
row format delimited
fields terminated by ','
location '/user/vagrant/ext_db';

from newOrders
insert into newOrders_part_buck
partition (state)
select oid,cid,pid,quantity,price,zipcode,state;