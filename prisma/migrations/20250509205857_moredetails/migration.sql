/*
  Warnings:

  - You are about to drop the `Book` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `chr_umal_student` to the `Character` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sng_origin` to the `Song` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "OutOfGameStoryType" AS ENUM ('book', 'tale', 'news', 'article');

-- CreateEnum
CREATE TYPE "RecurringType" AS ENUM ('daily', 'weekly', 'monthly', 'yearly', 'once');

-- AlterTable
ALTER TABLE "Character" ADD COLUMN     "chr_fty_id" TEXT,
ADD COLUMN     "chr_umal_student" BOOLEAN NOT NULL;

-- AlterTable
ALTER TABLE "Song" ADD COLUMN     "sng_eps_id" TEXT,
ADD COLUMN     "sng_oog_id" TEXT,
ADD COLUMN     "sng_origin" TEXT NOT NULL;

-- DropTable
DROP TABLE "Book";

-- CreateTable
CREATE TABLE "InGameBook" (
    "igb_id" TEXT NOT NULL,
    "igb_name" TEXT NOT NULL,
    "igb_description" TEXT NOT NULL,
    "igb_author_chr_id" TEXT NOT NULL,
    "igb_type" TEXT NOT NULL,
    "igb_cmp_id" TEXT,
    "igb_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "igb_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InGameBook_pkey" PRIMARY KEY ("igb_id")
);

-- CreateTable
CREATE TABLE "OutOfGameStory" (
    "oog_id" TEXT NOT NULL,
    "oog_name" TEXT NOT NULL,
    "oog_description" TEXT NOT NULL,
    "oog_type" "OutOfGameStoryType" NOT NULL,
    "oog_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "oog_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OutOfGameStory_pkey" PRIMARY KEY ("oog_id")
);

-- CreateTable
CREATE TABLE "Art" (
    "art_id" TEXT NOT NULL,
    "art_title" TEXT NOT NULL,
    "art_description" TEXT NOT NULL,
    "art_author" TEXT NOT NULL,
    "art_date" TEXT NOT NULL,
    "art_materials" TEXT NOT NULL,
    "art_dimensions" TEXT NOT NULL,
    "art_type" TEXT NOT NULL,
    "art_plc_id" TEXT,
    "art_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "art_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Art_pkey" PRIMARY KEY ("art_id")
);

-- CreateTable
CREATE TABLE "Fraternity" (
    "fty_id" TEXT NOT NULL,
    "fty_name" TEXT NOT NULL,
    "fty_motto" TEXT NOT NULL,
    "fty_virtues" TEXT NOT NULL,
    "fty_description" TEXT NOT NULL,
    "fty_colors" "Colors" NOT NULL,
    "fty_symbol" TEXT NOT NULL,
    "fty_drk_id" TEXT,
    "fty_president_id" TEXT,
    "fty_foundation_date" TEXT NOT NULL,
    "fty_cape" TEXT NOT NULL,
    "fty_plc_id" TEXT NOT NULL,
    "fty_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "fty_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Fraternity_pkey" PRIMARY KEY ("fty_id")
);

-- CreateTable
CREATE TABLE "FraternityFounder" (
    "umf_id" TEXT NOT NULL,
    "umf_fty_id" TEXT NOT NULL,
    "umf_chr_id" TEXT NOT NULL,
    "umf_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "umf_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FraternityFounder_pkey" PRIMARY KEY ("umf_id")
);

-- CreateTable
CREATE TABLE "GameAndSport" (
    "gam_id" TEXT NOT NULL,
    "gam_name" TEXT NOT NULL,
    "gam_description" TEXT NOT NULL,
    "gam_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "gam_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "GameAndSport_pkey" PRIMARY KEY ("gam_id")
);

-- CreateTable
CREATE TABLE "Calendar" (
    "cal_id" TEXT NOT NULL,
    "cal_name" TEXT NOT NULL,
    "cal_description" TEXT NOT NULL,
    "cal_days_per_week" INTEGER NOT NULL,
    "cal_days_per_month" INTEGER NOT NULL,
    "cal_days_per_year" INTEGER NOT NULL,
    "cal_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "cal_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Calendar_pkey" PRIMARY KEY ("cal_id")
);

-- CreateTable
CREATE TABLE "CalendarWeekDay" (
    "cwd_id" TEXT NOT NULL,
    "cwd_name" TEXT NOT NULL,
    "cwd_cal_id" TEXT NOT NULL,
    "cwd_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "cwd_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CalendarWeekDay_pkey" PRIMARY KEY ("cwd_id")
);

-- CreateTable
CREATE TABLE "CalendarMonth" (
    "cmo_id" TEXT NOT NULL,
    "cmo_name" TEXT NOT NULL,
    "cmo_cal_id" TEXT NOT NULL,
    "cmo_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "cmo_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CalendarMonth_pkey" PRIMARY KEY ("cmo_id")
);

-- CreateTable
CREATE TABLE "CalendarSeason" (
    "cse_id" TEXT NOT NULL,
    "cse_name" TEXT NOT NULL,
    "cse_cal_id" TEXT NOT NULL,
    "cse_start_date" TIMESTAMP(3) NOT NULL,
    "cse_end_date" TIMESTAMP(3) NOT NULL,
    "cse_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "cse_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CalendarSeason_pkey" PRIMARY KEY ("cse_id")
);

-- CreateTable
CREATE TABLE "MonthSeason" (
    "mse_id" TEXT NOT NULL,
    "mse_name" TEXT NOT NULL,
    "mse_mon_id" TEXT NOT NULL,
    "mse_cse_id" TEXT NOT NULL,
    "mse_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "mse_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MonthSeason_pkey" PRIMARY KEY ("mse_id")
);

-- CreateTable
CREATE TABLE "CalendarMoon" (
    "cmn_id" TEXT NOT NULL,
    "cmn_name" TEXT NOT NULL,
    "cmn_color" "Colors" NOT NULL,
    "cmn_cal_id" TEXT NOT NULL,
    "cmn_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "cmn_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CalendarMoon_pkey" PRIMARY KEY ("cmn_id")
);

-- CreateTable
CREATE TABLE "MoonPhase" (
    "mph_id" TEXT NOT NULL,
    "mph_name" TEXT NOT NULL,
    "mph_description" TEXT NOT NULL,
    "mph_cmn_id" TEXT NOT NULL,
    "mph_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "mph_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MoonPhase_pkey" PRIMARY KEY ("mph_id")
);

-- CreateTable
CREATE TABLE "CalendarDate" (
    "cdt_id" TEXT NOT NULL,
    "cdt_day" INTEGER NOT NULL,
    "cdt_month" INTEGER NOT NULL,
    "cdt_year" INTEGER NOT NULL,
    "cdt_cal_id" TEXT NOT NULL,
    "cdt_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "cdt_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CalendarDate_pkey" PRIMARY KEY ("cdt_id")
);

-- CreateTable
CREATE TABLE "CalendarEvent" (
    "cev_id" TEXT NOT NULL,
    "cev_name" TEXT NOT NULL,
    "cev_description" TEXT NOT NULL,
    "cev_cdt_id" TEXT NOT NULL,
    "cev_cal_id" TEXT NOT NULL,
    "cev_recurring" BOOLEAN NOT NULL,
    "cev_recurring_type" "RecurringType" NOT NULL,
    "cev_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "cev_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CalendarEvent_pkey" PRIMARY KEY ("cev_id")
);

-- AddForeignKey
ALTER TABLE "Character" ADD CONSTRAINT "Character_chr_fty_id_fkey" FOREIGN KEY ("chr_fty_id") REFERENCES "Fraternity"("fty_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "InGameBook" ADD CONSTRAINT "InGameBook_igb_author_chr_id_fkey" FOREIGN KEY ("igb_author_chr_id") REFERENCES "Character"("chr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Song" ADD CONSTRAINT "Song_sng_eps_id_fkey" FOREIGN KEY ("sng_eps_id") REFERENCES "Episode"("eps_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Song" ADD CONSTRAINT "Song_sng_cmp_id_fkey" FOREIGN KEY ("sng_cmp_id") REFERENCES "Campaign"("cmp_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Song" ADD CONSTRAINT "Song_sng_oog_id_fkey" FOREIGN KEY ("sng_oog_id") REFERENCES "OutOfGameStory"("oog_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Art" ADD CONSTRAINT "Art_art_plc_id_fkey" FOREIGN KEY ("art_plc_id") REFERENCES "Place"("plc_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Fraternity" ADD CONSTRAINT "Fraternity_fty_plc_id_fkey" FOREIGN KEY ("fty_plc_id") REFERENCES "Place"("plc_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Fraternity" ADD CONSTRAINT "Fraternity_fty_drk_id_fkey" FOREIGN KEY ("fty_drk_id") REFERENCES "Drink"("drk_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Fraternity" ADD CONSTRAINT "Fraternity_fty_president_id_fkey" FOREIGN KEY ("fty_president_id") REFERENCES "Character"("chr_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FraternityFounder" ADD CONSTRAINT "FraternityFounder_umf_fty_id_fkey" FOREIGN KEY ("umf_fty_id") REFERENCES "Fraternity"("fty_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FraternityFounder" ADD CONSTRAINT "FraternityFounder_umf_chr_id_fkey" FOREIGN KEY ("umf_chr_id") REFERENCES "Character"("chr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CalendarWeekDay" ADD CONSTRAINT "CalendarWeekDay_cwd_cal_id_fkey" FOREIGN KEY ("cwd_cal_id") REFERENCES "Calendar"("cal_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CalendarMonth" ADD CONSTRAINT "CalendarMonth_cmo_cal_id_fkey" FOREIGN KEY ("cmo_cal_id") REFERENCES "Calendar"("cal_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CalendarSeason" ADD CONSTRAINT "CalendarSeason_cse_cal_id_fkey" FOREIGN KEY ("cse_cal_id") REFERENCES "Calendar"("cal_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MonthSeason" ADD CONSTRAINT "MonthSeason_mse_mon_id_fkey" FOREIGN KEY ("mse_mon_id") REFERENCES "CalendarMonth"("cmo_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MonthSeason" ADD CONSTRAINT "MonthSeason_mse_cse_id_fkey" FOREIGN KEY ("mse_cse_id") REFERENCES "CalendarSeason"("cse_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CalendarMoon" ADD CONSTRAINT "CalendarMoon_cmn_cal_id_fkey" FOREIGN KEY ("cmn_cal_id") REFERENCES "Calendar"("cal_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MoonPhase" ADD CONSTRAINT "MoonPhase_mph_cmn_id_fkey" FOREIGN KEY ("mph_cmn_id") REFERENCES "CalendarMoon"("cmn_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CalendarDate" ADD CONSTRAINT "CalendarDate_cdt_cal_id_fkey" FOREIGN KEY ("cdt_cal_id") REFERENCES "Calendar"("cal_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CalendarEvent" ADD CONSTRAINT "CalendarEvent_cev_cdt_id_fkey" FOREIGN KEY ("cev_cdt_id") REFERENCES "CalendarDate"("cdt_id") ON DELETE RESTRICT ON UPDATE CASCADE;
