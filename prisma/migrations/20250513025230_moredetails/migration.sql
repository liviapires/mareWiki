/*
  Warnings:

  - You are about to drop the `Affiliation` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `AlchemicalCompound` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Ancestry` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Art` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Beverage` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Calendar` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CalendarDate` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CalendarEvent` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CalendarMonth` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CalendarMoon` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CalendarSeason` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CalendarWeekDay` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Campaign` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CampaignUser` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Character` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CharacterTitle` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Class` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Creature` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Deity` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DeityDomain` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DeityEpithet` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DeityTitle` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Dish` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Dragon` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `DragonEpithet` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Drink` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Episode` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Epithet` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `FamilyRelationship` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `FamilyUnion` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Food` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Fraternity` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `FraternityFounder` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `GameAndSport` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `InGameBook` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Ingredient` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Item` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ItemOwner` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `MagobolTeam` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `MonthSeason` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `MoonPhase` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Organization` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `OrganizationName` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `OutOfGameStory` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Place` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Quote` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `School` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Song` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `User` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_CreatedByUser` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_UpdatedByUser` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_WrittenByUser` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Affiliation" DROP CONSTRAINT "Affiliation_aff_chr_id_fkey";

-- DropForeignKey
ALTER TABLE "Affiliation" DROP CONSTRAINT "Affiliation_aff_mgt_id_fkey";

-- DropForeignKey
ALTER TABLE "Affiliation" DROP CONSTRAINT "Affiliation_aff_org_id_fkey";

-- DropForeignKey
ALTER TABLE "Affiliation" DROP CONSTRAINT "Affiliation_aff_plc_id_fkey";

-- DropForeignKey
ALTER TABLE "AlchemicalCompound" DROP CONSTRAINT "AlchemicalCompound_alc_chr_id_fkey";

-- DropForeignKey
ALTER TABLE "AlchemicalCompound" DROP CONSTRAINT "AlchemicalCompound_alc_plc_id_fkey";

-- DropForeignKey
ALTER TABLE "Art" DROP CONSTRAINT "Art_art_plc_id_fkey";

-- DropForeignKey
ALTER TABLE "CalendarDate" DROP CONSTRAINT "CalendarDate_cdt_cal_id_fkey";

-- DropForeignKey
ALTER TABLE "CalendarEvent" DROP CONSTRAINT "CalendarEvent_cev_cdt_id_fkey";

-- DropForeignKey
ALTER TABLE "CalendarMonth" DROP CONSTRAINT "CalendarMonth_cmo_cal_id_fkey";

-- DropForeignKey
ALTER TABLE "CalendarMoon" DROP CONSTRAINT "CalendarMoon_cmn_cal_id_fkey";

-- DropForeignKey
ALTER TABLE "CalendarSeason" DROP CONSTRAINT "CalendarSeason_cse_cal_id_fkey";

-- DropForeignKey
ALTER TABLE "CalendarWeekDay" DROP CONSTRAINT "CalendarWeekDay_cwd_cal_id_fkey";

-- DropForeignKey
ALTER TABLE "CampaignUser" DROP CONSTRAINT "CampaignUser_csr_chr_id_fkey";

-- DropForeignKey
ALTER TABLE "CampaignUser" DROP CONSTRAINT "CampaignUser_csr_cmp_id_fkey";

-- DropForeignKey
ALTER TABLE "CampaignUser" DROP CONSTRAINT "CampaignUser_csr_usr_id_fkey";

-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_chr_anc_id_fkey";

-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_chr_archmage_plc_id_fkey";

-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_chr_cls_id_fkey";

-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_chr_cmp_id_fkey";

-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_chr_first_appeared_eps_id_fkey";

-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_chr_fty_id_fkey";

-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_chr_last_appeared_eps_id_fkey";

-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_chr_plc_id_fkey";

-- DropForeignKey
ALTER TABLE "Character" DROP CONSTRAINT "Character_chr_sch_id_fkey";

-- DropForeignKey
ALTER TABLE "CharacterTitle" DROP CONSTRAINT "CharacterTitle_ctl_chr_id_fkey";

-- DropForeignKey
ALTER TABLE "CharacterTitle" DROP CONSTRAINT "CharacterTitle_ctl_org_id_fkey";

-- DropForeignKey
ALTER TABLE "Creature" DROP CONSTRAINT "Creature_cre_plc_id_fkey";

-- DropForeignKey
ALTER TABLE "DeityDomain" DROP CONSTRAINT "DeityDomain_dtd_dty_id_fkey";

-- DropForeignKey
ALTER TABLE "DeityEpithet" DROP CONSTRAINT "DeityEpithet_dte_dty_id_fkey";

-- DropForeignKey
ALTER TABLE "DeityTitle" DROP CONSTRAINT "DeityTitle_dtl_dty_id_fkey";

-- DropForeignKey
ALTER TABLE "Dish" DROP CONSTRAINT "Dish_dis_plc_id_fkey";

-- DropForeignKey
ALTER TABLE "DragonEpithet" DROP CONSTRAINT "DragonEpithet_dge_drg_id_fkey";

-- DropForeignKey
ALTER TABLE "Drink" DROP CONSTRAINT "Drink_drk_plc_id_fkey";

-- DropForeignKey
ALTER TABLE "Episode" DROP CONSTRAINT "Episode_eps_cmp_id_fkey";

-- DropForeignKey
ALTER TABLE "Epithet" DROP CONSTRAINT "Epithet_ept_chr_id_fkey";

-- DropForeignKey
ALTER TABLE "FamilyRelationship" DROP CONSTRAINT "FamilyRelationship_rel_chr_child_id_fkey";

-- DropForeignKey
ALTER TABLE "FamilyRelationship" DROP CONSTRAINT "FamilyRelationship_rel_chr_parent_id_fkey";

-- DropForeignKey
ALTER TABLE "FamilyUnion" DROP CONSTRAINT "FamilyUnion_uni_first_chr_id_fkey";

-- DropForeignKey
ALTER TABLE "FamilyUnion" DROP CONSTRAINT "FamilyUnion_uni_second_chr_id_fkey";

-- DropForeignKey
ALTER TABLE "Fraternity" DROP CONSTRAINT "Fraternity_fty_drk_id_fkey";

-- DropForeignKey
ALTER TABLE "Fraternity" DROP CONSTRAINT "Fraternity_fty_plc_id_fkey";

-- DropForeignKey
ALTER TABLE "Fraternity" DROP CONSTRAINT "Fraternity_fty_president_id_fkey";

-- DropForeignKey
ALTER TABLE "FraternityFounder" DROP CONSTRAINT "FraternityFounder_umf_chr_id_fkey";

-- DropForeignKey
ALTER TABLE "FraternityFounder" DROP CONSTRAINT "FraternityFounder_umf_fty_id_fkey";

-- DropForeignKey
ALTER TABLE "InGameBook" DROP CONSTRAINT "InGameBook_igb_author_chr_id_fkey";

-- DropForeignKey
ALTER TABLE "Ingredient" DROP CONSTRAINT "Ingredient_ing_alc_id_fkey";

-- DropForeignKey
ALTER TABLE "Ingredient" DROP CONSTRAINT "Ingredient_ing_bvr_id_fkey";

-- DropForeignKey
ALTER TABLE "Ingredient" DROP CONSTRAINT "Ingredient_ing_dis_id_fkey";

-- DropForeignKey
ALTER TABLE "Ingredient" DROP CONSTRAINT "Ingredient_ing_drk_id_fkey";

-- DropForeignKey
ALTER TABLE "Ingredient" DROP CONSTRAINT "Ingredient_ing_foo_id_fkey";

-- DropForeignKey
ALTER TABLE "ItemOwner" DROP CONSTRAINT "ItemOwner_iow_chr_id_fkey";

-- DropForeignKey
ALTER TABLE "ItemOwner" DROP CONSTRAINT "ItemOwner_iow_itm_id_fkey";

-- DropForeignKey
ALTER TABLE "MagobolTeam" DROP CONSTRAINT "MagobolTeam_mgt_city_id_fkey";

-- DropForeignKey
ALTER TABLE "MagobolTeam" DROP CONSTRAINT "MagobolTeam_mgt_country_id_fkey";

-- DropForeignKey
ALTER TABLE "MonthSeason" DROP CONSTRAINT "MonthSeason_mse_cse_id_fkey";

-- DropForeignKey
ALTER TABLE "MonthSeason" DROP CONSTRAINT "MonthSeason_mse_mon_id_fkey";

-- DropForeignKey
ALTER TABLE "MoonPhase" DROP CONSTRAINT "MoonPhase_mph_cmn_id_fkey";

-- DropForeignKey
ALTER TABLE "Organization" DROP CONSTRAINT "Organization_org_created_by_usr_id_fkey";

-- DropForeignKey
ALTER TABLE "Organization" DROP CONSTRAINT "Organization_org_plc_id_fkey";

-- DropForeignKey
ALTER TABLE "OrganizationName" DROP CONSTRAINT "OrganizationName_orn_org_id_fkey";

-- DropForeignKey
ALTER TABLE "Place" DROP CONSTRAINT "Place_plc_parent_id_fkey";

-- DropForeignKey
ALTER TABLE "Quote" DROP CONSTRAINT "Quote_qte_chr_id_fkey";

-- DropForeignKey
ALTER TABLE "Song" DROP CONSTRAINT "Song_sng_cmp_id_fkey";

-- DropForeignKey
ALTER TABLE "Song" DROP CONSTRAINT "Song_sng_eps_id_fkey";

-- DropForeignKey
ALTER TABLE "Song" DROP CONSTRAINT "Song_sng_oog_id_fkey";

-- DropForeignKey
ALTER TABLE "Song" DROP CONSTRAINT "Song_sng_plc_id_fkey";

-- DropForeignKey
ALTER TABLE "_CreatedByUser" DROP CONSTRAINT "_CreatedByUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_CreatedByUser" DROP CONSTRAINT "_CreatedByUser_B_fkey";

-- DropForeignKey
ALTER TABLE "_UpdatedByUser" DROP CONSTRAINT "_UpdatedByUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_UpdatedByUser" DROP CONSTRAINT "_UpdatedByUser_B_fkey";

-- DropForeignKey
ALTER TABLE "_WrittenByUser" DROP CONSTRAINT "_WrittenByUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_WrittenByUser" DROP CONSTRAINT "_WrittenByUser_B_fkey";

-- DropTable
DROP TABLE "Affiliation";

-- DropTable
DROP TABLE "AlchemicalCompound";

-- DropTable
DROP TABLE "Ancestry";

-- DropTable
DROP TABLE "Art";

-- DropTable
DROP TABLE "Beverage";

-- DropTable
DROP TABLE "Calendar";

-- DropTable
DROP TABLE "CalendarDate";

-- DropTable
DROP TABLE "CalendarEvent";

-- DropTable
DROP TABLE "CalendarMonth";

-- DropTable
DROP TABLE "CalendarMoon";

-- DropTable
DROP TABLE "CalendarSeason";

-- DropTable
DROP TABLE "CalendarWeekDay";

-- DropTable
DROP TABLE "Campaign";

-- DropTable
DROP TABLE "CampaignUser";

-- DropTable
DROP TABLE "Character";

-- DropTable
DROP TABLE "CharacterTitle";

-- DropTable
DROP TABLE "Class";

-- DropTable
DROP TABLE "Creature";

-- DropTable
DROP TABLE "Deity";

-- DropTable
DROP TABLE "DeityDomain";

-- DropTable
DROP TABLE "DeityEpithet";

-- DropTable
DROP TABLE "DeityTitle";

-- DropTable
DROP TABLE "Dish";

-- DropTable
DROP TABLE "Dragon";

-- DropTable
DROP TABLE "DragonEpithet";

-- DropTable
DROP TABLE "Drink";

-- DropTable
DROP TABLE "Episode";

-- DropTable
DROP TABLE "Epithet";

-- DropTable
DROP TABLE "FamilyRelationship";

-- DropTable
DROP TABLE "FamilyUnion";

-- DropTable
DROP TABLE "Food";

-- DropTable
DROP TABLE "Fraternity";

-- DropTable
DROP TABLE "FraternityFounder";

-- DropTable
DROP TABLE "GameAndSport";

-- DropTable
DROP TABLE "InGameBook";

-- DropTable
DROP TABLE "Ingredient";

-- DropTable
DROP TABLE "Item";

-- DropTable
DROP TABLE "ItemOwner";

-- DropTable
DROP TABLE "MagobolTeam";

-- DropTable
DROP TABLE "MonthSeason";

-- DropTable
DROP TABLE "MoonPhase";

-- DropTable
DROP TABLE "Organization";

-- DropTable
DROP TABLE "OrganizationName";

-- DropTable
DROP TABLE "OutOfGameStory";

-- DropTable
DROP TABLE "Place";

-- DropTable
DROP TABLE "Quote";

-- DropTable
DROP TABLE "School";

-- DropTable
DROP TABLE "Song";

-- DropTable
DROP TABLE "User";

-- DropTable
DROP TABLE "_CreatedByUser";

-- DropTable
DROP TABLE "_UpdatedByUser";

-- DropTable
DROP TABLE "_WrittenByUser";

-- DropEnum
DROP TYPE "Colors";

-- DropEnum
DROP TYPE "OutOfGameStoryType";

-- DropEnum
DROP TYPE "Pronouns";

-- DropEnum
DROP TYPE "RecurringType";

-- DropEnum
DROP TYPE "Status";
