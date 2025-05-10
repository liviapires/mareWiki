/*
  Warnings:

  - You are about to drop the column `chr_epithet` on the `Character` table. All the data in the column will be lost.
  - You are about to drop the column `chr_first_appeared_cmp_id` on the `Character` table. All the data in the column will be lost.
  - You are about to drop the column `chr_last_appeared_cmp_id` on the `Character` table. All the data in the column will be lost.
  - You are about to drop the column `chr_umal_student` on the `Character` table. All the data in the column will be lost.
  - Added the required column `chr_first_appeared_eps_id` to the `Character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `chr_last_appeared_eps_id` to the `Character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `chr_student` to the `Character` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_chr_cmp_id_fkey";

-- AlterTable
ALTER TABLE "Character" DROP COLUMN "chr_epithet",
DROP COLUMN "chr_first_appeared_cmp_id",
DROP COLUMN "chr_last_appeared_cmp_id",
DROP COLUMN "chr_umal_student",
ADD COLUMN     "chr_first_appeared_eps_id" TEXT NOT NULL,
ADD COLUMN     "chr_last_appeared_eps_id" TEXT NOT NULL,
ADD COLUMN     "chr_student" BOOLEAN NOT NULL,
ALTER COLUMN "chr_cmp_id" DROP NOT NULL;

-- CreateTable
CREATE TABLE "Epithet" (
    "ept_id" TEXT NOT NULL,
    "ept_name" TEXT NOT NULL,
    "ept_chr_id" TEXT NOT NULL,
    "ept_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ept_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Epithet_pkey" PRIMARY KEY ("ept_id")
);

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_chr_cmp_id_fkey" FOREIGN KEY ("chr_cmp_id") REFERENCES "Campaign"("cmp_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_chr_first_appeared_eps_id_fkey" FOREIGN KEY ("chr_first_appeared_eps_id") REFERENCES "Episode"("eps_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_chr_last_appeared_eps_id_fkey" FOREIGN KEY ("chr_last_appeared_eps_id") REFERENCES "Episode"("eps_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Epithet" ADD CONSTRAINT "Epithet_ept_chr_id_fkey" FOREIGN KEY ("ept_chr_id") REFERENCES "Character"("chr_id") ON DELETE RESTRICT ON UPDATE CASCADE;
