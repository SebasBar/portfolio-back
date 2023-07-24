-- CreateTable
CREATE TABLE "SebasBar" (
    "id" SERIAL NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "picture" TEXT NOT NULL,
    "profile" TEXT,
    "github_page" TEXT NOT NULL,

    CONSTRAINT "SebasBar_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Credentials" (
    "id" SERIAL NOT NULL,
    "user" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "Credentials_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Phones" (
    "id" SERIAL NOT NULL,
    "number" TEXT NOT NULL,
    "sebasBarId" INTEGER,

    CONSTRAINT "Phones_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Emails" (
    "id" SERIAL NOT NULL,
    "address" TEXT NOT NULL,
    "sebasBarId" INTEGER,

    CONSTRAINT "Emails_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Social_Networks" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "sebasBarId" INTEGER,

    CONSTRAINT "Social_Networks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Documents" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "document" TEXT NOT NULL,
    "sebasBarId" INTEGER,

    CONSTRAINT "Documents_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Education" (
    "id" SERIAL NOT NULL,
    "degree" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "time" TEXT,
    "sebasBarId" INTEGER,

    CONSTRAINT "Education_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Special_Knowledge" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "sebasBarId" INTEGER,

    CONSTRAINT "Special_Knowledge_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Work_Experience" (
    "id" SERIAL NOT NULL,
    "company_name" TEXT NOT NULL,
    "position" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "time" TEXT NOT NULL,
    "sebasBarId" INTEGER,

    CONSTRAINT "Work_Experience_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Projects" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "description2" TEXT,
    "description3" TEXT,
    "github_link" TEXT NOT NULL,
    "deployed_link" TEXT,
    "sebasBarId" INTEGER,

    CONSTRAINT "Projects_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Pictures" (
    "id" SERIAL NOT NULL,
    "picture" TEXT NOT NULL,
    "projectsId" INTEGER,

    CONSTRAINT "Pictures_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tech_Lang" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "Tech_Lang_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Clients" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "description" TEXT NOT NULL,

    CONSTRAINT "Clients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Teamates" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "github_link" TEXT,

    CONSTRAINT "Teamates_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ProjectsToTech_Lang" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ProjectsToTeamates" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ClientsToProjects" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_ProjectsToTech_Lang_AB_unique" ON "_ProjectsToTech_Lang"("A", "B");

-- CreateIndex
CREATE INDEX "_ProjectsToTech_Lang_B_index" ON "_ProjectsToTech_Lang"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ProjectsToTeamates_AB_unique" ON "_ProjectsToTeamates"("A", "B");

-- CreateIndex
CREATE INDEX "_ProjectsToTeamates_B_index" ON "_ProjectsToTeamates"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ClientsToProjects_AB_unique" ON "_ClientsToProjects"("A", "B");

-- CreateIndex
CREATE INDEX "_ClientsToProjects_B_index" ON "_ClientsToProjects"("B");

-- AddForeignKey
ALTER TABLE "Phones" ADD CONSTRAINT "Phones_sebasBarId_fkey" FOREIGN KEY ("sebasBarId") REFERENCES "SebasBar"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Emails" ADD CONSTRAINT "Emails_sebasBarId_fkey" FOREIGN KEY ("sebasBarId") REFERENCES "SebasBar"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Social_Networks" ADD CONSTRAINT "Social_Networks_sebasBarId_fkey" FOREIGN KEY ("sebasBarId") REFERENCES "SebasBar"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Documents" ADD CONSTRAINT "Documents_sebasBarId_fkey" FOREIGN KEY ("sebasBarId") REFERENCES "SebasBar"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Education" ADD CONSTRAINT "Education_sebasBarId_fkey" FOREIGN KEY ("sebasBarId") REFERENCES "SebasBar"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Special_Knowledge" ADD CONSTRAINT "Special_Knowledge_sebasBarId_fkey" FOREIGN KEY ("sebasBarId") REFERENCES "SebasBar"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Work_Experience" ADD CONSTRAINT "Work_Experience_sebasBarId_fkey" FOREIGN KEY ("sebasBarId") REFERENCES "SebasBar"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Projects" ADD CONSTRAINT "Projects_sebasBarId_fkey" FOREIGN KEY ("sebasBarId") REFERENCES "SebasBar"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Pictures" ADD CONSTRAINT "Pictures_projectsId_fkey" FOREIGN KEY ("projectsId") REFERENCES "Projects"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProjectsToTech_Lang" ADD CONSTRAINT "_ProjectsToTech_Lang_A_fkey" FOREIGN KEY ("A") REFERENCES "Projects"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProjectsToTech_Lang" ADD CONSTRAINT "_ProjectsToTech_Lang_B_fkey" FOREIGN KEY ("B") REFERENCES "Tech_Lang"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProjectsToTeamates" ADD CONSTRAINT "_ProjectsToTeamates_A_fkey" FOREIGN KEY ("A") REFERENCES "Projects"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ProjectsToTeamates" ADD CONSTRAINT "_ProjectsToTeamates_B_fkey" FOREIGN KEY ("B") REFERENCES "Teamates"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClientsToProjects" ADD CONSTRAINT "_ClientsToProjects_A_fkey" FOREIGN KEY ("A") REFERENCES "Clients"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ClientsToProjects" ADD CONSTRAINT "_ClientsToProjects_B_fkey" FOREIGN KEY ("B") REFERENCES "Projects"("id") ON DELETE CASCADE ON UPDATE CASCADE;
