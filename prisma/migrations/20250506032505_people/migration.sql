-- CreateEnum
CREATE TYPE "Pronouns" AS ENUM ('he_him', 'she_her', 'they_them', 'she_he', 'they_she', 'they_he', 'they_she_he', 'unknown', 'none', 'all', 'other');

-- CreateEnum
CREATE TYPE "Status" AS ENUM ('alive', 'dead', 'missing', 'fugitive', 'imprisoned', 'unknown');

-- CreateTable
CREATE TABLE "Person" (
    "per_id" TEXT NOT NULL,
    "per_name" TEXT NOT NULL,
    "per_epithet" TEXT NOT NULL,
    "per_title" TEXT NOT NULL,
    "per_phisical_description" TEXT NOT NULL,
    "per_height" TEXT NOT NULL,
    "per_anc_id" TEXT NOT NULL,
    "per_pronouns" "Pronouns" NOT NULL,
    "per_cls_id" TEXT NOT NULL,
    "per_sch_id" TEXT NOT NULL,
    "per_occupation" TEXT NOT NULL,
    "per_birthday" TEXT NOT NULL,
    "per_plc_id" TEXT NOT NULL,
    "per_family" TEXT NOT NULL,
    "per_afiliation" TEXT NOT NULL,
    "per_status" "Status" NOT NULL,
    "per_observations" TEXT NOT NULL,
    "per_cmp_id" TEXT NOT NULL,
    "per_first_appeared" TEXT NOT NULL,
    "per_last_appeared" TEXT NOT NULL,
    "per_written_by" TEXT NOT NULL,
    "per_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "per_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Person_pkey" PRIMARY KEY ("per_id")
);

-- CreateTable
CREATE TABLE "Ancestry" (
    "anc_id" TEXT NOT NULL,
    "anc_name" TEXT NOT NULL,
    "anc_description" TEXT NOT NULL,
    "anc_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "anc_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Ancestry_pkey" PRIMARY KEY ("anc_id")
);

-- CreateTable
CREATE TABLE "Class" (
    "cls_id" TEXT NOT NULL,
    "cls_name" TEXT NOT NULL,
    "cls_description" TEXT NOT NULL,
    "cls_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "cls_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Class_pkey" PRIMARY KEY ("cls_id")
);

-- CreateTable
CREATE TABLE "School" (
    "sch_id" TEXT NOT NULL,
    "sch_name" TEXT NOT NULL,
    "sch_description" TEXT NOT NULL,
    "sch_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "sch_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "School_pkey" PRIMARY KEY ("sch_id")
);

-- CreateTable
CREATE TABLE "Place" (
    "plc_id" TEXT NOT NULL,
    "plc_name" TEXT NOT NULL,
    "plc_description" TEXT NOT NULL,
    "plc_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "plc_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Place_pkey" PRIMARY KEY ("plc_id")
);

-- CreateTable
CREATE TABLE "Quotes" (
    "qts_id" TEXT NOT NULL,
    "qts_quote" TEXT NOT NULL,
    "qts_per_id" TEXT NOT NULL,
    "qts_source" TEXT NOT NULL,
    "qts_source_url" TEXT NOT NULL,
    "qts_first_quote" BOOLEAN NOT NULL,
    "qts_last_quote" BOOLEAN NOT NULL,
    "qts_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "qts_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Quotes_pkey" PRIMARY KEY ("qts_id")
);

-- CreateTable
CREATE TABLE "Campaign" (
    "cmp_id" TEXT NOT NULL,
    "cmp_name" TEXT NOT NULL,
    "cmp_description" TEXT NOT NULL,
    "cmp_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "cmp_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Campaign_pkey" PRIMARY KEY ("cmp_id")
);

-- AddForeignKey
ALTER TABLE "Person" ADD CONSTRAINT "Person_per_anc_id_fkey" FOREIGN KEY ("per_anc_id") REFERENCES "Ancestry"("anc_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Person" ADD CONSTRAINT "Person_per_cls_id_fkey" FOREIGN KEY ("per_cls_id") REFERENCES "Class"("cls_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Person" ADD CONSTRAINT "Person_per_sch_id_fkey" FOREIGN KEY ("per_sch_id") REFERENCES "School"("sch_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Person" ADD CONSTRAINT "Person_per_plc_id_fkey" FOREIGN KEY ("per_plc_id") REFERENCES "Place"("plc_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Person" ADD CONSTRAINT "Person_per_cmp_id_fkey" FOREIGN KEY ("per_cmp_id") REFERENCES "Campaign"("cmp_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Quotes" ADD CONSTRAINT "Quotes_qts_per_id_fkey" FOREIGN KEY ("qts_per_id") REFERENCES "Person"("per_id") ON DELETE RESTRICT ON UPDATE CASCADE;
