-- AlterTable
ALTER TABLE "Projects" ADD COLUMN     "sebasBarId" INTEGER;

-- AddForeignKey
ALTER TABLE "Projects" ADD FOREIGN KEY ("sebasBarId") REFERENCES "SebasBar"("id") ON DELETE SET NULL ON UPDATE CASCADE;
