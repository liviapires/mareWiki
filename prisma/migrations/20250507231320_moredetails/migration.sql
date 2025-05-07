/*
  Warnings:

  - You are about to drop the `Title` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `aff_updated_at` to the `Affiliation` table without a default value. This is not possible if the table is not empty.
  - Added the required column `csr_updated_at` to the `CampaignUser` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rel_updated_at` to the `FamilyRelationship` table without a default value. This is not possible if the table is not empty.
  - Added the required column `uni_updated_at` to the `FamilyUnion` table without a default value. This is not possible if the table is not empty.
  - Added the required column `plc_observations` to the `Place` table without a default value. This is not possible if the table is not empty.
  - Added the required column `plc_type` to the `Place` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "Colors" AS ENUM ('red', 'blue', 'green', 'yellow', 'orange', 'purple', 'pink', 'brown', 'black', 'white', 'gray', 'gold', 'silver', 'bronze');

-- DropForeignKey
ALTER TABLE "Title" DROP CONSTRAINT "Title_ttl_chr_id_fkey";

-- DropForeignKey
ALTER TABLE "Title" DROP CONSTRAINT "Title_ttl_org_id_fkey";

-- AlterTable
ALTER TABLE "Affiliation" ADD COLUMN     "aff_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "aff_mgt_id" TEXT,
ADD COLUMN     "aff_updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "CampaignUser" ADD COLUMN     "csr_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "csr_updated_at" TIMESTAMP(3) NOT NULL,
ALTER COLUMN "csr_joined_at" DROP DEFAULT;

-- AlterTable
ALTER TABLE "FamilyRelationship" ADD COLUMN     "rel_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "rel_updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "FamilyUnion" ADD COLUMN     "uni_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "uni_updated_at" TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE "Organization" ALTER COLUMN "org_created_at" SET DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "Place" ADD COLUMN     "plc_observations" TEXT NOT NULL,
ADD COLUMN     "plc_type" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "usr_created_at" SET DEFAULT CURRENT_TIMESTAMP;

-- DropTable
DROP TABLE "Title";

-- CreateTable
CREATE TABLE "CharacterTitle" (
    "ctl_id" TEXT NOT NULL,
    "ctl_name" TEXT NOT NULL,
    "ctl_description" TEXT NOT NULL,
    "ctl_org_id" TEXT,
    "ctl_chr_id" TEXT NOT NULL,
    "ctl_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ctl_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CharacterTitle_pkey" PRIMARY KEY ("ctl_id")
);

-- CreateTable
CREATE TABLE "Deity" (
    "dty_id" TEXT NOT NULL,
    "dty_name" TEXT NOT NULL,
    "dty_description" TEXT NOT NULL,
    "dty_symbol" TEXT NOT NULL,
    "dty_observation" TEXT NOT NULL,
    "dty_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dty_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Deity_pkey" PRIMARY KEY ("dty_id")
);

-- CreateTable
CREATE TABLE "DeityTitle" (
    "dtl_id" TEXT NOT NULL,
    "dtl_name" TEXT NOT NULL,
    "dtl_dty_id" TEXT NOT NULL,
    "dtl_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dtl_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DeityTitle_pkey" PRIMARY KEY ("dtl_id")
);

-- CreateTable
CREATE TABLE "DeityEpithet" (
    "dte_id" TEXT NOT NULL,
    "dte_name" TEXT NOT NULL,
    "dte_dty_id" TEXT NOT NULL,
    "dte_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dte_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DeityEpithet_pkey" PRIMARY KEY ("dte_id")
);

-- CreateTable
CREATE TABLE "DeityDomain" (
    "dtd_id" TEXT NOT NULL,
    "dtd_name" TEXT NOT NULL,
    "dtd_dty_id" TEXT NOT NULL,
    "dtd_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dtd_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DeityDomain_pkey" PRIMARY KEY ("dtd_id")
);

-- CreateTable
CREATE TABLE "MagobolTeam" (
    "mgt_id" TEXT NOT NULL,
    "mgt_name" TEXT NOT NULL,
    "mgt_description" TEXT NOT NULL,
    "mgt_city_id" TEXT NOT NULL,
    "mgt_country_id" TEXT NOT NULL,
    "mgt_symbol" TEXT NOT NULL,
    "mgt_colors" "Colors" NOT NULL,
    "mgt_league" TEXT NOT NULL,
    "mgt_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "mgt_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MagobolTeam_pkey" PRIMARY KEY ("mgt_id")
);

-- CreateTable
CREATE TABLE "Beverage" (
    "bvr_id" TEXT NOT NULL,
    "bvr_name" TEXT NOT NULL,
    "bvr_description" TEXT NOT NULL,
    "bvr_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "bvr_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Beverage_pkey" PRIMARY KEY ("bvr_id")
);

-- CreateTable
CREATE TABLE "Drink" (
    "drk_id" TEXT NOT NULL,
    "drk_name" TEXT NOT NULL,
    "drk_description" TEXT NOT NULL,
    "drk_plc_id" TEXT NOT NULL,
    "drk_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "drk_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Drink_pkey" PRIMARY KEY ("drk_id")
);

-- CreateTable
CREATE TABLE "Food" (
    "foo_id" TEXT NOT NULL,
    "foo_name" TEXT NOT NULL,
    "foo_description" TEXT NOT NULL,
    "foo_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "foo_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Food_pkey" PRIMARY KEY ("foo_id")
);

-- CreateTable
CREATE TABLE "Dish" (
    "dis_id" TEXT NOT NULL,
    "dis_name" TEXT NOT NULL,
    "dis_description" TEXT NOT NULL,
    "dis_plc_id" TEXT NOT NULL,
    "dis_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dis_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Dish_pkey" PRIMARY KEY ("dis_id")
);

-- CreateTable
CREATE TABLE "AlchemicalCompound" (
    "alc_id" TEXT NOT NULL,
    "alc_name" TEXT NOT NULL,
    "alc_type" TEXT NOT NULL,
    "alc_function" TEXT NOT NULL,
    "alc_plc_id" TEXT,
    "alc_chr_id" TEXT,
    "alc_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "alc_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AlchemicalCompound_pkey" PRIMARY KEY ("alc_id")
);

-- CreateTable
CREATE TABLE "Ingredient" (
    "ing_id" TEXT NOT NULL,
    "ing_drk_id" TEXT,
    "ing_dis_id" TEXT,
    "ing_foo_id" TEXT,
    "ing_bvr_id" TEXT,
    "ing_alc_id" TEXT,
    "ing_quantity" TEXT NOT NULL,
    "ing_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ing_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Ingredient_pkey" PRIMARY KEY ("ing_id")
);

-- CreateTable
CREATE TABLE "Creature" (
    "cre_id" TEXT NOT NULL,
    "cre_name" TEXT NOT NULL,
    "cre_type" TEXT NOT NULL,
    "cre_description" TEXT NOT NULL,
    "cre_observations" TEXT NOT NULL,
    "cre_plc_id" TEXT,
    "cre_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "cre_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Creature_pkey" PRIMARY KEY ("cre_id")
);

-- CreateTable
CREATE TABLE "Dragon" (
    "drg_id" TEXT NOT NULL,
    "drg_name" TEXT NOT NULL,
    "drg_type" TEXT NOT NULL,
    "drg_form" TEXT NOT NULL,
    "drg_magic" TEXT NOT NULL,
    "drg_breath" TEXT NOT NULL,
    "drg_description" TEXT NOT NULL,
    "drg_observations" TEXT NOT NULL,
    "drg_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "drg_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Dragon_pkey" PRIMARY KEY ("drg_id")
);

-- CreateTable
CREATE TABLE "DragonEpithet" (
    "dge_id" TEXT NOT NULL,
    "dge_name" TEXT NOT NULL,
    "dge_drg_id" TEXT NOT NULL,
    "dge_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dge_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DragonEpithet_pkey" PRIMARY KEY ("dge_id")
);

-- AddForeignKey
ALTER TABLE "CharacterTitle" ADD CONSTRAINT "CharacterTitle_ctl_chr_id_fkey" FOREIGN KEY ("ctl_chr_id") REFERENCES "Character"("chr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CharacterTitle" ADD CONSTRAINT "CharacterTitle_ctl_org_id_fkey" FOREIGN KEY ("ctl_org_id") REFERENCES "Organization"("org_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DeityTitle" ADD CONSTRAINT "DeityTitle_dtl_dty_id_fkey" FOREIGN KEY ("dtl_dty_id") REFERENCES "Deity"("dty_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DeityEpithet" ADD CONSTRAINT "DeityEpithet_dte_dty_id_fkey" FOREIGN KEY ("dte_dty_id") REFERENCES "Deity"("dty_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DeityDomain" ADD CONSTRAINT "DeityDomain_dtd_dty_id_fkey" FOREIGN KEY ("dtd_dty_id") REFERENCES "Deity"("dty_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MagobolTeam" ADD CONSTRAINT "MagobolTeam_mgt_city_id_fkey" FOREIGN KEY ("mgt_city_id") REFERENCES "Place"("plc_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MagobolTeam" ADD CONSTRAINT "MagobolTeam_mgt_country_id_fkey" FOREIGN KEY ("mgt_country_id") REFERENCES "Place"("plc_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Affiliation" ADD CONSTRAINT "Affiliation_aff_mgt_id_fkey" FOREIGN KEY ("aff_mgt_id") REFERENCES "MagobolTeam"("mgt_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Drink" ADD CONSTRAINT "Drink_drk_plc_id_fkey" FOREIGN KEY ("drk_plc_id") REFERENCES "Place"("plc_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Dish" ADD CONSTRAINT "Dish_dis_plc_id_fkey" FOREIGN KEY ("dis_plc_id") REFERENCES "Place"("plc_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AlchemicalCompound" ADD CONSTRAINT "AlchemicalCompound_alc_plc_id_fkey" FOREIGN KEY ("alc_plc_id") REFERENCES "Place"("plc_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AlchemicalCompound" ADD CONSTRAINT "AlchemicalCompound_alc_chr_id_fkey" FOREIGN KEY ("alc_chr_id") REFERENCES "Character"("chr_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ingredient" ADD CONSTRAINT "Ingredient_ing_drk_id_fkey" FOREIGN KEY ("ing_drk_id") REFERENCES "Drink"("drk_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ingredient" ADD CONSTRAINT "Ingredient_ing_dis_id_fkey" FOREIGN KEY ("ing_dis_id") REFERENCES "Dish"("dis_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ingredient" ADD CONSTRAINT "Ingredient_ing_foo_id_fkey" FOREIGN KEY ("ing_foo_id") REFERENCES "Food"("foo_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ingredient" ADD CONSTRAINT "Ingredient_ing_bvr_id_fkey" FOREIGN KEY ("ing_bvr_id") REFERENCES "Beverage"("bvr_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ingredient" ADD CONSTRAINT "Ingredient_ing_alc_id_fkey" FOREIGN KEY ("ing_alc_id") REFERENCES "AlchemicalCompound"("alc_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Creature" ADD CONSTRAINT "Creature_cre_plc_id_fkey" FOREIGN KEY ("cre_plc_id") REFERENCES "Place"("plc_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DragonEpithet" ADD CONSTRAINT "DragonEpithet_dge_drg_id_fkey" FOREIGN KEY ("dge_drg_id") REFERENCES "Dragon"("drg_id") ON DELETE RESTRICT ON UPDATE CASCADE;
