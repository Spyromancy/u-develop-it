use election;

drop table if exists candidates;
drop table if exists parties; 
drop table if exists voters;

create table parties (
    id integer auto_increment primary key,
    name varchar(50) not null,
    description text
);

create table candidates (
    id integer auto_increment primary key,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    party_id integer,
    industry_connected boolean not null,
    CONSTRAINT fk_party FOREIGN KEY (party_id) REFERENCES parties(id) ON DELETE SET NULL
);

create table voters (
    id integer auto_increment primary key,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    email varchar(50) not null,
    created_at datetime default current_timestamp
);