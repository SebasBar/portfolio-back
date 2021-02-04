/*
  Warnings:

  - You are about to drop the column `number` on the `Social_Networks` table. All the data in the column will be lost.
  - Added the required column `address` to the `Social_Networks` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Social_Networks" DROP COLUMN "number",
ADD COLUMN     "address" TEXT NOT NULL;
