/*
  Warnings:

  - You are about to drop the column `sebasBarId` on the `Credentials` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Credentials" DROP CONSTRAINT "Credentials_sebasBarId_fkey";

-- AlterTable
ALTER TABLE "Credentials" DROP COLUMN "sebasBarId";
