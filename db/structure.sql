CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "addresses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "street_number" integer, "city" varchar(255), "state" varchar(255), "zip" varchar(255), "created_at" datetime, "updated_at" datetime, "order_id" integer);
CREATE TABLE "categorisations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "category_id" integer, "item_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255), "full_name" varchar(255), "display_name" varchar(255), "password_digest" varchar(255), "created_at" datetime, "updated_at" datetime, "admin" boolean DEFAULT 'f');
CREATE TABLE "line_items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "cart_id" integer, "item_id" integer, "quantity" integer DEFAULT 1, "created_at" datetime, "updated_at" datetime, "order_id" integer);
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "index_users_on_full_name_and_display_name" ON "users" ("full_name", "display_name");
CREATE TABLE "carts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "description" text, "price" float, "created_at" datetime, "updated_at" datetime, "retired" boolean, "photo_file_name" varchar(255), "photo_content_type" varchar(255), "photo_file_size" integer, "photo_updated_at" datetime);
CREATE UNIQUE INDEX "index_items_on_title" ON "items" ("title");
CREATE UNIQUE INDEX "index_categories_on_title" ON "categories" ("title");
CREATE TABLE "orders" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "pickup_or_delivery" boolean, "created_at" datetime, "updated_at" datetime, "user_id" integer, "ordered" boolean, "cancelled" boolean, "completed" boolean, "paid" boolean, "completed_at" datetime, "cancelled_at" datetime);
INSERT INTO schema_migrations (version) VALUES ('20141120205529');

INSERT INTO schema_migrations (version) VALUES ('20141121100818');

INSERT INTO schema_migrations (version) VALUES ('20141121101029');

INSERT INTO schema_migrations (version) VALUES ('20141121161836');

INSERT INTO schema_migrations (version) VALUES ('20141121192934');

INSERT INTO schema_migrations (version) VALUES ('20141122190922');

INSERT INTO schema_migrations (version) VALUES ('20141122211757');

INSERT INTO schema_migrations (version) VALUES ('20141124073649');

INSERT INTO schema_migrations (version) VALUES ('20141124140031');

INSERT INTO schema_migrations (version) VALUES ('20141124140148');

INSERT INTO schema_migrations (version) VALUES ('20141124185950');

INSERT INTO schema_migrations (version) VALUES ('20141127175628');

INSERT INTO schema_migrations (version) VALUES ('20141129142542');

INSERT INTO schema_migrations (version) VALUES ('20141201160546');

INSERT INTO schema_migrations (version) VALUES ('20141203095711');

INSERT INTO schema_migrations (version) VALUES ('20141209171608');

INSERT INTO schema_migrations (version) VALUES ('20141210085741');

INSERT INTO schema_migrations (version) VALUES ('20141222120330');

INSERT INTO schema_migrations (version) VALUES ('20150103193321');

INSERT INTO schema_migrations (version) VALUES ('20150108173952');

INSERT INTO schema_migrations (version) VALUES ('20150112190745');

INSERT INTO schema_migrations (version) VALUES ('20150112190904');

INSERT INTO schema_migrations (version) VALUES ('20150114091311');

INSERT INTO schema_migrations (version) VALUES ('20150116185226');

INSERT INTO schema_migrations (version) VALUES ('20150128081628');
