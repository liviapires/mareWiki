/*
  Warnings:

  - You are about to drop the column `org_name` on the `Organization` table. All the data in the column will be lost.
  - Added the required column `aff_leader` to the `Affiliation` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Affiliation" ADD COLUMN     "aff_leader" BOOLEAN NOT NULL;

-- AlterTable
ALTER TABLE "Organization" DROP COLUMN "org_name";

-- CreateTable
CREATE TABLE "OrganizationName" (
    "orn_id" TEXT NOT NULL,
    "orn_org_id" TEXT NOT NULL,
    "orn_name" TEXT NOT NULL,
    "orn_description" TEXT NOT NULL,
    "orn_main_name" BOOLEAN NOT NULL,
    "orn_created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "orn_updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OrganizationName_pkey" PRIMARY KEY ("orn_id")
);

-- AddForeignKey
ALTER TABLE "OrganizationName" ADD CONSTRAINT "OrganizationName_orn_org_id_fkey" FOREIGN KEY ("orn_org_id") REFERENCES "Organization"("org_id") ON DELETE RESTRICT ON UPDATE CASCADE;
