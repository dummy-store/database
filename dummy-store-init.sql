CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE accounts(
	account_id uuid NOT NULL DEFAULT uuid_generate_v4(),
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	email VARCHAR NOT NULL,
	username VARCHAR NOT NULL,
	password VARCHAR NOT NULL,
	address VARCHAR,
	privileged BOOLEAN NOT NULL DEFAULT FALSE,
	CONSTRAINT pk_account PRIMARY KEY (account_id)
);

CREATE TABLE orders(
	order_id uuid NOT NULL DEFAULT uuid_generate_v4(),
	account_id uuid NOT NULL,
	CONSTRAINT pk_order PRIMARY KEY (order_id),
	CONSTRAINT fk_account FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);

CREATE TABLE items(
	item_id uuid NOT NULL DEFAULT uuid_generate_v4(),
	CONSTRAINT pk_item PRIMARY KEY (item_id),
	title VARCHAR NOT NULL,
	description VARCHAR NOT NULL,
	price DECIMAL(10,2) NOT NULL,
	amount_in_stock INTEGER NOT NULL DEFAULT 0,
	image VARCHAR
);

CREATE TABLE categories(
	category_id uuid NOT NULL DEFAULT uuid_generate_v4(),
	CONSTRAINT pk_category PRIMARY KEY (category_id),
	title VARCHAR NOT NULL,
	description VARCHAR NOT NULL
);

CREATE TABLE items_categories(
	item_id uuid NOT NULL,
	category_id uuid NOT NULL,
	CONSTRAINT pk_item_categories PRIMARY KEY (item_id, category_id),
	CONSTRAINT fk_item FOREIGN KEY (item_id) REFERENCES items(item_id),
	CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

