-- create projects table
CREATE TABLE "out_project"
(
  "project_id" TEXT NOT NULL,
	"project" TEXT,
  "created_at" TEXT,
  "due_date" TEXT,
  "workspace" TEXT,
  "url"  TEXT,
  "owner"  TEXT,
  "owner_type" TEXT,
  "status"  TEXT,
  "status_text" TEXT,
  "archived" BOOLEAN,
  "public" BOOLEAN
);

INSERT INTO "out_project"
  SELECT p."id" AS "project_id",
          p."name" AS "project",
          null AS "created_at",
          null AS "due_date",
          null AS "workspace",
          null AS "url",
          null AS "owner",
          null AS "owner_type",
          null AS "status",
          null AS "status_text",
          iff(p."archived" = 'True', TRUE, FALSE) AS "archived",
          iff(p."is_private" = TRUE,FALSE,TRUE) AS "public"
  FROM "projects" p;

-- creates table of users
CREATE TABLE "out_user"
(
  "user_id" TEXT NOT NULL,
  "user" TEXT,
  "email" TEXT,
  "email_domain" TEXT,
  "user_type" TEXT
);

INSERT INTO "out_user"
  SELECT "account_id" AS "user_id", 
          "display_name" AS "user", 
          "email_address" as "email",
          split_part("email_address", '@', 2) AS "email_domain",
          "account_type" AS "user_type"
  FROM "users";

-- create join table of users working on a project

CREATE TABLE "out_project_user"
(
  "user_id" TEXT NOT NULL,
  "project_id" TEXT NOT NULL
);

INSERT INTO "out_project_user"
  SELECT DISTINCT
      c."author_account_id" AS "user_id",
      p."id" AS "project_id"


  FROM "issues-changelogs" c
      LEFT JOIN "issues" i
          ON i."id" = c."issue_id"
      LEFT JOIN "projects" p
          ON p."key" = i."project_key";
