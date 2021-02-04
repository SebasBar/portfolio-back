/*
  Warnings:

  - Added the required column `name` to the `Social_Networks` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Social_Networks" ADD COLUMN     "name" TEXT NOT NULL;
