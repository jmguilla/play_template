# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table brand (
  id                        bigint not null,
  name                      varchar(255),
  thumbnail                 varchar(255),
  constraint uq_brand_name unique (name),
  constraint pk_brand primary key (id))
;

create table item (
  id                        bigint not null,
  name                      varchar(255),
  brand_id                  bigint,
  thumbnail                 varchar(255),
  constraint pk_item primary key (id))
;

create table product_type (
  id                        integer not null,
  description               varchar(255),
  constraint pk_product_type primary key (id))
;

create table size (
  id                        bigint not null,
  product_type_id           integer,
  constraint pk_size primary key (id))
;

create table user (
  email                     varchar(255) not null,
  first_name                varchar(255),
  last_name                 varchar(255),
  full_name                 varchar(255),
  user_id                   varchar(255),
  provider_id               varchar(255),
  constraint pk_user primary key (email))
;


create table product_type_item (
  product_type_id                integer not null,
  item_id                        bigint not null,
  constraint pk_product_type_item primary key (product_type_id, item_id))
;
create sequence brand_seq;

create sequence item_seq;

create sequence product_type_seq;

create sequence size_seq;

create sequence user_seq;

alter table item add constraint fk_item_brand_1 foreign key (brand_id) references brand (id) on delete restrict on update restrict;
create index ix_item_brand_1 on item (brand_id);
alter table size add constraint fk_size_productType_2 foreign key (product_type_id) references product_type (id) on delete restrict on update restrict;
create index ix_size_productType_2 on size (product_type_id);



alter table product_type_item add constraint fk_product_type_item_product__01 foreign key (product_type_id) references product_type (id) on delete restrict on update restrict;

alter table product_type_item add constraint fk_product_type_item_item_02 foreign key (item_id) references item (id) on delete restrict on update restrict;

# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists brand;

drop table if exists item;

drop table if exists product_type;

drop table if exists product_type_item;

drop table if exists size;

drop table if exists user;

SET REFERENTIAL_INTEGRITY TRUE;

drop sequence if exists brand_seq;

drop sequence if exists item_seq;

drop sequence if exists product_type_seq;

drop sequence if exists size_seq;

drop sequence if exists user_seq;

