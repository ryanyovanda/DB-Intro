-- DROP SCHEMA ecommerce;

CREATE SCHEMA ecommerce AUTHORIZATION myuser;

-- DROP SEQUENCE ecommerce.address_id_seq;

CREATE SEQUENCE ecommerce.address_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.cart_id_seq;

CREATE SEQUENCE ecommerce.cart_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;
-- DROP SEQUENCE ecommerce.user_id_seq;

CREATE SEQUENCE ecommerce.user_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;-- ecommerce."user" definition

-- Drop table

-- DROP TABLE ecommerce."user";

CREATE TABLE ecommerce."user" (
	id serial4 NOT NULL,
	"name" varchar NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
	CONSTRAINT user_pk PRIMARY KEY (id)
);


-- ecommerce.address definition

-- Drop table

-- DROP TABLE ecommerce.address;

CREATE TABLE ecommerce.address (
	id serial4 NOT NULL,
	user_id int4 NOT NULL,
	city varchar(255) NOT NULL,
	street varchar(255) NOT NULL,
	phone_number int4 NOT NULL,
	created_at timestamptz DEFAULT CURRENT_TIMESTAMP NOT NULL,
	updated_at timestamptz NOT NULL,
	deleted_at timestamptz NOT NULL,
	CONSTRAINT address_pk PRIMARY KEY (id),
	CONSTRAINT user_id FOREIGN KEY (user_id) REFERENCES ecommerce."user"(id)
);