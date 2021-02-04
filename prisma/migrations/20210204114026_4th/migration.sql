/*
  Warnings:

  - You are about to drop the column `description` on the `Teamates` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Teamates" DROP COLUMN "description",
ADD COLUMN     "github_link" TEXT;
