/*
  Warnings:

  - You are about to drop the column `chr_source_id` on the `FamilyRelationship` table. All the data in the column will be lost.
  - You are about to drop the column `chr_target_id` on the `FamilyRelationship` table. All the data in the column will be lost.
  - You are about to drop the column `relationship_type` on the `FamilyRelationship` table. All the data in the column will be lost.
  - The primary key for the `FamilyUnion` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `chr_1_id` on the `FamilyUnion` table. All the data in the column will be lost.
  - You are about to drop the column `chr_2_id` on the `FamilyUnion` table. All the data in the column will be lost.
  - You are about to drop the column `union_id` on the `FamilyUnion` table. All the data in the column will be lost.
  - You are about to drop the column `union_type` on the `FamilyUnion` table. All the data in the column will be lost.
  - You are about to drop the column `usr_image` on the `User` table. All the data in the column will be lost.
  - Added the required column `chr_archmage` to the `Character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rel_chr_child_id` to the `FamilyRelationship` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rel_chr_parent_id` to the `FamilyRelationship` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rel_type` to the `FamilyRelationship` table without a default value. This is not possible if the table is not empty.
  - Added the required column `uni_first_chr_id` to the `FamilyUnion` table without a default value. This is not possible if the table is not empty.
  - The required column `uni_id` was added to the `FamilyUnion` table with a prisma-level default value. This is not possible if the table is not empty. Please add this column as optional, then populate it before making it required.
  - Added the required column `uni_second_chr_id` to the `FamilyUnion` table without a default value. This is not possible if the table is not empty.
  - Added the required column `uni_type` to the `FamilyUnion` table without a default value. This is not possible if the table is not empty.
  - Added the required column `org_created_by_usr_id` to the `Organization` table without a default value. This is not possible if the table is not empty.
  - Added the required column `org_foundation_date` to the `Organization` table without a default value. This is not possible if the table is not empty.
  - Added the required column `org_observations` to the `Organization` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_chr_sch_id_fkey";

-- DropForeignKey
ALTER TABLE "FamilyRelationship" DROP CONSTRAINT "FamilyRelationship_chr_source_id_fkey";

-- DropForeignKey
ALTER TABLE "FamilyRelationship" DROP CONSTRAINT "FamilyRelationship_chr_target_id_fkey";

-- DropForeignKey
ALTER TABLE "FamilyUnion" DROP CONSTRAINT "FamilyUnion_chr_1_id_fkey";

-- DropForeignKey
ALTER TABLE "FamilyUnion" DROP CONSTRAINT "FamilyUnion_chr_2_id_fkey";

-- AlterTable
ALTER TABLE "Character" ADD COLUMN     "chr_archmage" BOOLEAN NOT NULL,
ADD COLUMN     "chr_archmage_date" TEXT,
ADD COLUMN     "chr_archmage_plc_id" TEXT,
ALTER COLUMN "chr_sch_id" DROP NOT NULL;

-- AlterTable
ALTER TABLE "FamilyRelationship" DROP COLUMN "chr_source_id",
DROP COLUMN "chr_target_id",
DROP COLUMN "relationship_type",
ADD COLUMN     "rel_chr_child_id" TEXT NOT NULL,
ADD COLUMN     "rel_chr_parent_id" TEXT NOT NULL,
ADD COLUMN     "rel_type" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "FamilyUnion" DROP CONSTRAINT "FamilyUnion_pkey",
DROP COLUMN "chr_1_id",
DROP COLUMN "chr_2_id",
DROP COLUMN "union_id",
DROP COLUMN "union_type",
ADD COLUMN     "uni_first_chr_id" TEXT NOT NULL,
ADD COLUMN     "uni_id" TEXT NOT NULL,
ADD COLUMN     "uni_second_chr_id" TEXT NOT NULL,
ADD COLUMN     "uni_type" TEXT NOT NULL,
ADD CONSTRAINT "FamilyUnion_pkey" PRIMARY KEY ("uni_id");

-- AlterTable
ALTER TABLE "Organization" ADD COLUMN     "org_created_by_usr_id" TEXT NOT NULL,
ADD COLUMN     "org_foundation_date" TEXT NOT NULL,
ADD COLUMN     "org_observations" TEXT NOT NULL,
ADD COLUMN     "org_plc_id" TEXT;

-- AlterTable
ALTER TABLE "Place" ADD COLUMN     "plc_parent_id" TEXT;

-- AlterTable
ALTER TABLE "Title" ADD COLUMN     "ttl_org_id" TEXT;

-- AlterTable
ALTER TABLE "User" DROP COLUMN "usr_image";

-- CreateTable
CREATE TABLE "CampaignUser" (
    "csr_cmp_id" TEXT NOT NULL,
    "csr_usr_id" TEXT NOT NULL,
    "csr_chr_id" TEXT,
    "csr_joined_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CampaignUser_pkey" PRIMARY KEY ("csr_cmp_id","csr_usr_id")
);

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_chr_sch_id_fkey" FOREIGN KEY ("chr_sch_id") REFERENCES "School"("sch_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_chr_archmage_plc_id_fkey" FOREIGN KEY ("chr_archmage_plc_id") REFERENCES "Place"("plc_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Place" ADD CONSTRAINT "Place_plc_parent_id_fkey" FOREIGN KEY ("plc_parent_id") REFERENCES "Place"("plc_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Title" ADD CONSTRAINT "Title_ttl_org_id_fkey" FOREIGN KEY ("ttl_org_id") REFERENCES "Organization"("org_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CampaignUser" ADD CONSTRAINT "CampaignUser_csr_chr_id_fkey" FOREIGN KEY ("csr_chr_id") REFERENCES "Character"("chr_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CampaignUser" ADD CONSTRAINT "CampaignUser_csr_cmp_id_fkey" FOREIGN KEY ("csr_cmp_id") REFERENCES "Campaign"("cmp_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CampaignUser" ADD CONSTRAINT "CampaignUser_csr_usr_id_fkey" FOREIGN KEY ("csr_usr_id") REFERENCES "User"("usr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FamilyRelationship" ADD CONSTRAINT "FamilyRelationship_rel_chr_parent_id_fkey" FOREIGN KEY ("rel_chr_parent_id") REFERENCES "Character"("chr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FamilyRelationship" ADD CONSTRAINT "FamilyRelationship_rel_chr_child_id_fkey" FOREIGN KEY ("rel_chr_child_id") REFERENCES "Character"("chr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FamilyUnion" ADD CONSTRAINT "FamilyUnion_uni_first_chr_id_fkey" FOREIGN KEY ("uni_first_chr_id") REFERENCES "Character"("chr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FamilyUnion" ADD CONSTRAINT "FamilyUnion_uni_second_chr_id_fkey" FOREIGN KEY ("uni_second_chr_id") REFERENCES "Character"("chr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organization" ADD CONSTRAINT "Organization_org_plc_id_fkey" FOREIGN KEY ("org_plc_id") REFERENCES "Place"("plc_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organization" ADD CONSTRAINT "Organization_org_created_by_usr_id_fkey" FOREIGN KEY ("org_created_by_usr_id") REFERENCES "User"("usr_id") ON DELETE RESTRICT ON UPDATE CASCADE;
