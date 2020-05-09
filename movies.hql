use mydb;

create table if not exists ratings 
(userId int,
movieId int,
rating int,
time bigint
)
row format delimited
fields terminated by ','
lines terminated by '\n'
tblproperties ("skip.header.line.count" = "1")
;

load data local inpath '/home/vagrant/ml-latest-small/ratings.csv' overwrite into table ratings;

create table if not exists links 
(movieId int,
imdbId int,
tmdbId int
)
row format delimited
fields terminated by ','
lines terminated by '\n'
tblproperties ("skip.header.line.count" = "1")
;

load data local inpath '/home/vagrant/ml-latest-small/links.csv' overwrite into table links;


create table if not exists tags
(userId int,
movieId int,
tag string,
time bigint
)
row format delimited
fields terminated by ','
lines terminated by '\n'
tblproperties ("skip.header.line.count" = "1")
;

load data local inpath '/home/vagrant/ml-latest-small/tags.csv' overwrite into table tags;


create table if not exists users 
(userId int,
sex char(1),
age int,
occupationId int,
zipCode int
)
row format delimited
fields terminated by ','
lines terminated by '\n'
;

load data local inpath '/home/vagrant/ml-latest-small/users_new.csv' overwrite into table users;