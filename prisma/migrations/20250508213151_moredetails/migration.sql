-- CreateTable
CREATE TABLE "Episode" (
    "eps_id" TEXT NOT NULL,
    "eps_number" INTEGER NOT NULL,
    "eps_name" TEXT NOT NULL,
    "eps_date" TIMESTAMP(3) NOT NULL,
    "eps_cmp_id" TEXT,
    "eps_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "eps_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Episode_pkey" PRIMARY KEY ("eps_id")
);

-- CreateTable
CREATE TABLE "Item" (
    "itm_id" TEXT NOT NULL,
    "itm_name" TEXT NOT NULL,
    "itm_description" TEXT NOT NULL,
    "itm_type" TEXT NOT NULL,
    "itm_subtype" TEXT NOT NULL,
    "itm_magical_properties" TEXT NOT NULL,
    "itm_value" TEXT NOT NULL,
    "itm_cmp_id" TEXT,
    "itm_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "itm_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Item_pkey" PRIMARY KEY ("itm_id")
);

-- CreateTable
CREATE TABLE "ItemOwner" (
    "iow_id" TEXT NOT NULL,
    "iow_chr_id" TEXT NOT NULL,
    "iow_itm_id" TEXT NOT NULL,
    "iow_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "iow_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ItemOwner_pkey" PRIMARY KEY ("iow_id")
);

-- CreateTable
CREATE TABLE "Book" (
    "bok_id" TEXT NOT NULL,
    "bok_name" TEXT NOT NULL,
    "bok_description" TEXT NOT NULL,
    "bok_author" TEXT NOT NULL,
    "bok_type" TEXT NOT NULL,
    "bok_cmp_id" TEXT,
    "bok_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "bok_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Book_pkey" PRIMARY KEY ("bok_id")
);

-- CreateTable
CREATE TABLE "Song" (
    "sng_id" TEXT NOT NULL,
    "sng_name" TEXT NOT NULL,
    "sng_description" TEXT NOT NULL,
    "sng_author" TEXT NOT NULL,
    "sng_genre" TEXT NOT NULL,
    "sng_lyrics" TEXT,
    "sng_plc_id" TEXT,
    "sng_cmp_id" TEXT,
    "sng_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "sng_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Song_pkey" PRIMARY KEY ("sng_id")
);

-- AddForeignKey
ALTER TABLE "Episode" ADD CONSTRAINT "Episode_eps_cmp_id_fkey" FOREIGN KEY ("eps_cmp_id") REFERENCES "Campaign"("cmp_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ItemOwner" ADD CONSTRAINT "ItemOwner_iow_chr_id_fkey" FOREIGN KEY ("iow_chr_id") REFERENCES "Character"("chr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ItemOwner" ADD CONSTRAINT "ItemOwner_iow_itm_id_fkey" FOREIGN KEY ("iow_itm_id") REFERENCES "Item"("itm_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Song" ADD CONSTRAINT "Song_sng_plc_id_fkey" FOREIGN KEY ("sng_plc_id") REFERENCES "Place"("plc_id") ON DELETE SET NULL ON UPDATE CASCADE;
