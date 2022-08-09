use election;

drop table if exists candidates;
drop table if exists parties; 
drop table if exists voters;
drop table if exists votes;

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
    constraint fk_party foreign key (party_id) references parties(id) on delete set null
);

create table voters (
    id integer auto_increment primary key,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    email varchar(50) not null,
    created_at datetime default current_timestamp
);

create table votes (
    id integer auto_increment primary key,
    voter_id integer not null,
    candidate_id integer not null,
    created_at datetime default current_timestamp,
    constraint uc_voter unique (voter_id),
    constraint fk_voter foreign key (voter_id) references voters(id) on delete cascade,
    constraint fk_candidate foreign key (candidate_id) references candidates(id) on delete cascade
);