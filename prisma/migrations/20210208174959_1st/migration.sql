-- CreateTable
CREATE TABLE "SebasBar" (
    "id" SERIAL NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "picture" TEXT NOT NULL,
    "github_page" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Credentials" (
    "id" SERIAL NOT NULL,
    "user" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "sebasBarId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Phones" (
    "id" SERIAL NOT NULL,
    "number" TEXT NOT NULL,
    "sebasBarId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Emails" (
    "id" SERIAL NOT NULL,
    "address" TEXT NOT NULL,
    "sebasBarId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Social_Networks" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "sebasBarId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Documents" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "document" TEXT NOT NULL,
    "sebasBarId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Education" (
    "id" SERIAL NOT NULL,
    "degree" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "time" TEXT,
    "sebasBarId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Special_Knowledge" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "sebasBarId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Work_Experience" (
    "id" SERIAL NOT NULL,
    "company_name" TEXT NOT NULL,
    "position" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "time" TEXT NOT NULL,
    "sebasBarId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Projects" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "github_link" TEXT NOT NULL,
    "deployed_link" TEXT,
    "sebasBarId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Pictures" (
    "id" SERIAL NOT NULL,
    "picture" TEXT NOT NULL,
    "projectsId" INTEGER,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tech_Lang" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Clients" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Teamates" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "github_link" TEXT,

    PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ProjectsToTech_Lang" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ClientsToProjects" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ProjectsToTeamates" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ProjectsToTech_Lang_AB_unique" ON "_ProjectsToTech_Lang"("A", "B");

-- CreateIndex
CREATE INDEX "_ProjectsToTech_Lang_B_index" ON "_ProjectsToTech_Lang"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ClientsToProjects_AB_unique" ON "_ClientsToProjects"("A", "B");

-- CreateIndex
CREATE INDEX "_ClientsToProjects_B_index" ON "_ClientsToProjects"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ProjectsToTeamates_AB_unique" ON "_ProjectsToTeamates"("A", "B");

-- CreateIndex
CREATE INDEX "_ProjectsToTeamates_B_index" ON "_ProjectsToTeamates"("B");

-- AddForeignKey
ALTER TABLE "Credentials" ADD FOREIGN KEY ("sebasBarId") REFERENCES "SebasBar"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Phones" ADD FOREIGN KEY ("sebasBarId") REFERENCES "SebasBar"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Emails" ADD FOREIGN KEY ("sebasBarId") REFERENCES "SebasBar"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Social_Networks" ADD FOREIGN KEY ("sebasBarId") REFERENCES "SebasBar"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Documents" ADD FOREIGN KEY ("sebasBarId") REFERENCES "SebasBar"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Education" ADD FOREIGN KEY ("sebasBarId") REFERENCES "SebasBar"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Special_Knowledge" ADD FOREIGN KEY ("sebasBarId") REFERENCES "SebasBar"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Work_Experience" ADD FOREIGN KEY ("sebasBarId") REFERENCES "SebasBar"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Projects" ADD FOREIGN KEY ("sebasBarId") REFERENCES "SebasBar"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pictures" ADD FOREIGN KEY ("projectsId") REFERENCES "Projects"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProjectsToTech_Lang" ADD FOREIGN KEY ("A") REFERENCES "Projects"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProjectsToTech_Lang" ADD FOREIGN KEY ("B") REFERENCES "Tech_Lang"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClientsToProjects" ADD FOREIGN KEY ("A") REFERENCES "Clients"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClientsToProjects" ADD FOREIGN KEY ("B") REFERENCES "Projects"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProjectsToTeamates" ADD FOREIGN KEY ("A") REFERENCES "Projects"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProjectsToTeamates" ADD FOREIGN KEY ("B") REFERENCES "Teamates"("id") ON DELETE CASCADE ON UPDATE CASCADE;
