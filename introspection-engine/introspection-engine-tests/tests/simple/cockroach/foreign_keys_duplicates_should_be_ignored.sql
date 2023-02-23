-- tags=cockroachdb

CREATE TABLE "User" (
    id INT4 GENERATED BY DEFAULT AS IDENTITY,
    CONSTRAINT "User_pkey" PRIMARY KEY (id)
);

CREATE TABLE "Post" (
    id INT4 GENERATED BY DEFAULT AS IDENTITY,
    user_id INT4 REFERENCES "User"(id),
    CONSTRAINT "Post_pkey" PRIMARY KEY (id)
);

ALTER TABLE "Post"
    ADD CONSTRAINT "second_fk"
        FOREIGN KEY (user_id)
        REFERENCES "User"(id);


/*
generator js {
  provider = "prisma-client-js"
}

datasource db {
  provider = "cockroachdb"
  url      = env("DATABASE_URL")
}

model Post {
  id      Int   @id @default(sequence())
  user_id Int?
  User    User? @relation(fields: [user_id], references: [id], onDelete: NoAction, onUpdate: NoAction)
}

model User {
  id   Int    @id @default(sequence())
  Post Post[]
}
*/
