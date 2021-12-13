/*
  Warnings:

  - You are about to drop the column `KI1` on the `Result` table. All the data in the column will be lost.
  - You are about to drop the column `KQ1` on the `Result` table. All the data in the column will be lost.
  - You are about to drop the column `KX1` on the `Result` table. All the data in the column will be lost.
  - Added the required column `Syllabus` to the `SubjectCombination` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Result` DROP COLUMN `KI1`,
    DROP COLUMN `KQ1`,
    DROP COLUMN `KX1`,
    ADD COLUMN `BI3` VARCHAR(191) NULL,
    ADD COLUMN `BQ3` VARCHAR(191) NULL,
    ADD COLUMN `BX3` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `SubjectCombination` ADD COLUMN `Syllabus` INTEGER NOT NULL;
