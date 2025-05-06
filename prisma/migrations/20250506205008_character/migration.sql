/*
  Warnings:

  - You are about to drop the `Person` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Quotes` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Person" DROP CONSTRAINT "Person_per_anc_id_fkey";

-- DropForeignKey
ALTER TABLE "Person" DROP CONSTRAINT "Person_per_cls_id_fkey";

-- DropForeignKey
ALTER TABLE "Person" DROP CONSTRAINT "Person_per_cmp_id_fkey";

-- DropForeignKey
ALTER TABLE "Person" DROP CONSTRAINT "Person_per_plc_id_fkey";

-- DropForeignKey
ALTER TABLE "Person" DROP CONSTRAINT "Person_per_sch_id_fkey";

-- DropForeignKey
ALTER TABLE "Quotes" DROP CONSTRAINT "Quotes_qts_per_id_fkey";

-- DropTable
DROP TABLE "Person";

-- DropTable
DROP TABLE "Quotes";

-- CreateTable
CREATE TABLE "Character" (
    "chr_id" TEXT NOT NULL,
    "chr_name" TEXT NOT NULL,
    "chr_epithet" TEXT NOT NULL,
    "chr_physical_description" TEXT NOT NULL,
    "chr_height" TEXT NOT NULL,
    "chr_occupation" TEXT NOT NULL,
    "chr_birthday" TEXT NOT NULL,
    "chr_observations" TEXT NOT NULL,
    "chr_pronouns" "Pronouns" NOT NULL,
    "chr_status" "Status" NOT NULL,
    "chr_anc_id" TEXT NOT NULL,
    "chr_cls_id" TEXT NOT NULL,
    "chr_sch_id" TEXT NOT NULL,
    "chr_plc_id" TEXT NOT NULL,
    "chr_cmp_id" TEXT NOT NULL,
    "chr_first_appeared_cmp_id" TEXT NOT NULL,
    "chr_last_appeared_cmp_id" TEXT NOT NULL,
    "chr_written_by_usr_id" TEXT NOT NULL,
    "chr_created_by_usr_id" TEXT NOT NULL,
    "chr_updated_by_usr_id" TEXT NOT NULL,
    "chr_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "chr_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Character_pkey" PRIMARY KEY ("chr_id")
);

-- CreateTable
CREATE TABLE "Title" (
    "ttl_id" TEXT NOT NULL,
    "ttl_name" TEXT NOT NULL,
    "ttl_description" TEXT NOT NULL,
    "ttl_created_at" TIMESTAMP(3) NOT NULL,
    "ttl_updated_at" TIMESTAMP(3) NOT NULL,
    "ttl_chr_id" TEXT NOT NULL,

    CONSTRAINT "Title_pkey" PRIMARY KEY ("ttl_id")
);

-- CreateTable
CREATE TABLE "Quote" (
    "qte_id" TEXT NOT NULL,
    "qte_quote" TEXT NOT NULL,
    "qte_chr_id" TEXT NOT NULL,
    "qte_source" TEXT NOT NULL,
    "qte_source_url" TEXT NOT NULL,
    "qte_first_quote" BOOLEAN NOT NULL,
    "qte_last_quote" BOOLEAN NOT NULL,
    "qte_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "qte_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Quote_pkey" PRIMARY KEY ("qte_id")
);

-- CreateTable
CREATE TABLE "FamilyRelationship" (
    "rel_id" TEXT NOT NULL,
    "relationship_type" TEXT NOT NULL,
    "chr_source_id" TEXT NOT NULL,
    "chr_target_id" TEXT NOT NULL,

    CONSTRAINT "FamilyRelationship_pkey" PRIMARY KEY ("rel_id")
);

-- CreateTable
CREATE TABLE "FamilyUnion" (
    "union_id" TEXT NOT NULL,
    "union_type" TEXT NOT NULL,
    "chr_1_id" TEXT NOT NULL,
    "chr_2_id" TEXT NOT NULL,

    CONSTRAINT "FamilyUnion_pkey" PRIMARY KEY ("union_id")
);

-- CreateTable
CREATE TABLE "Organization" (
    "org_id" TEXT NOT NULL,
    "org_name" TEXT NOT NULL,
    "org_description" TEXT NOT NULL,
    "org_created_at" TIMESTAMP(3) NOT NULL,
    "org_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Organization_pkey" PRIMARY KEY ("org_id")
);

-- CreateTable
CREATE TABLE "Affiliation" (
    "aff_id" TEXT NOT NULL,
    "aff_role" TEXT NOT NULL,
    "aff_chr_id" TEXT NOT NULL,
    "aff_plc_id" TEXT,
    "aff_org_id" TEXT,

    CONSTRAINT "Affiliation_pkey" PRIMARY KEY ("aff_id")
);

-- CreateTable
CREATE TABLE "User" (
    "usr_id" TEXT NOT NULL,
    "usr_name" TEXT NOT NULL,
    "usr_username" TEXT NOT NULL,
    "usr_password" TEXT NOT NULL,
    "usr_description" TEXT NOT NULL,
    "usr_image" TEXT NOT NULL,
    "usr_mare" BOOLEAN NOT NULL,
    "usr_created_at" TIMESTAMP(3) NOT NULL,
    "usr_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("usr_id")
);

-- CreateTable
CREATE TABLE "_WrittenByUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_WrittenByUser_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_CreatedByUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_CreatedByUser_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateTable
CREATE TABLE "_UpdatedByUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,

    CONSTRAINT "_UpdatedByUser_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE INDEX "_WrittenByUser_B_index" ON "_WrittenByUser"("B");

-- CreateIndex
CREATE INDEX "_CreatedByUser_B_index" ON "_CreatedByUser"("B");

-- CreateIndex
CREATE INDEX "_UpdatedByUser_B_index" ON "_UpdatedByUser"("B");

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_chr_anc_id_fkey" FOREIGN KEY ("chr_anc_id") REFERENCES "Ancestry"("anc_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_chr_cls_id_fkey" FOREIGN KEY ("chr_cls_id") REFERENCES "Class"("cls_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_chr_sch_id_fkey" FOREIGN KEY ("chr_sch_id") REFERENCES "School"("sch_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_chr_plc_id_fkey" FOREIGN KEY ("chr_plc_id") REFERENCES "Place"("plc_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_chr_cmp_id_fkey" FOREIGN KEY ("chr_cmp_id") REFERENCES "Campaign"("cmp_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Title" ADD CONSTRAINT "Title_ttl_chr_id_fkey" FOREIGN KEY ("ttl_chr_id") REFERENCES "Character"("chr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Quote" ADD CONSTRAINT "Quote_qte_chr_id_fkey" FOREIGN KEY ("qte_chr_id") REFERENCES "Character"("chr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FamilyRelationship" ADD CONSTRAINT "FamilyRelationship_chr_source_id_fkey" FOREIGN KEY ("chr_source_id") REFERENCES "Character"("chr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FamilyRelationship" ADD CONSTRAINT "FamilyRelationship_chr_target_id_fkey" FOREIGN KEY ("chr_target_id") REFERENCES "Character"("chr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FamilyUnion" ADD CONSTRAINT "FamilyUnion_chr_1_id_fkey" FOREIGN KEY ("chr_1_id") REFERENCES "Character"("chr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FamilyUnion" ADD CONSTRAINT "FamilyUnion_chr_2_id_fkey" FOREIGN KEY ("chr_2_id") REFERENCES "Character"("chr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Affiliation" ADD CONSTRAINT "Affiliation_aff_chr_id_fkey" FOREIGN KEY ("aff_chr_id") REFERENCES "Character"("chr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Affiliation" ADD CONSTRAINT "Affiliation_aff_org_id_fkey" FOREIGN KEY ("aff_org_id") REFERENCES "Organization"("org_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Affiliation" ADD CONSTRAINT "Affiliation_aff_plc_id_fkey" FOREIGN KEY ("aff_plc_id") REFERENCES "Place"("plc_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_WrittenByUser" ADD CONSTRAINT "_WrittenByUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("chr_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_WrittenByUser" ADD CONSTRAINT "_WrittenByUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("usr_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CreatedByUser" ADD CONSTRAINT "_CreatedByUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("chr_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CreatedByUser" ADD CONSTRAINT "_CreatedByUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("usr_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UpdatedByUser" ADD CONSTRAINT "_UpdatedByUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Character"("chr_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_UpdatedByUser" ADD CONSTRAINT "_UpdatedByUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("usr_id") ON DELETE CASCADE ON UPDATE CASCADE;
