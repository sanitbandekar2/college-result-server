/*
  Warnings:

  - The primary key for the `ElectiveSubjectCom` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- DropForeignKey
ALTER TABLE `ElectiveSubjectCom` DROP FOREIGN KEY `ElectiveSubjectCom_semisterId_fkey`;

-- AlterTable
ALTER TABLE `ElectiveSubjectCom` DROP PRIMARY KEY,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);
