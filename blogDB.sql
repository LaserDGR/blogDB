CREATE TABLE "user" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "age" int
);

CREATE TABLE "category" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "post" (
  "id" SERIAL PRIMARY KEY,
  "title" varchar NOT NULL,
  "content" text,
  "author" int
);

CREATE TABLE "coment" (
  "id" SERIAL PRIMARY KEY,
  "comment" text,
  "post_id" int,
  "author" int
);

CREATE TABLE "post_category" (
  "id" SERIAL PRIMARY KEY,
  "post_id" int,
  "category_id" int
);

ALTER TABLE "post" ADD CONSTRAINT "fk_user_post" FOREIGN KEY ("author") REFERENCES "user" ("id");

ALTER TABLE "coment" ADD CONSTRAINT "fk_post_coment" FOREIGN KEY ("post_id") REFERENCES "post" ("id");

ALTER TABLE "coment" ADD CONSTRAINT "fk_user_coment" FOREIGN KEY ("author") REFERENCES "user" ("id");

ALTER TABLE "post_category" ADD CONSTRAINT "fk_post__post_category" FOREIGN KEY ("post_id") REFERENCES "post" ("id");

ALTER TABLE "post_category" ADD CONSTRAINT "fk_category__post_category" FOREIGN KEY ("category_id") REFERENCES "category" ("id");



insert into "user" (name, email, password, age)
values 
('Hector','hector@gmail.com','password',24),
('Mauricio','maurico@gmail.com','password',24),
('Jose','jose@gmail.com','password',55),
('Maria','maria@hotmail.com','password',40);

insert into "category" (name)
values
('Generico'),
('Anuncio'),
('Personal'),
('Noticia'),
('Trend'),
('Politica'),
('Deporte'),
('Economia'),
('Internacional'),
('Cultura'),
('Musica');

insert into "post" ("title","content" ,"author")
values 
('Concierto De Inspector','Este año se realizo un concierto gratuito donde el cantante principal fue inspetor',4);

insert into "post_category" ("post_id","category_id")
values
(1,11),
(1,2);

insert into "coment" ("comment","post_id","author")
values
('Si fue excelente el concierto',1,1),
('Conto con mucha asistecia de la gente',1,2);