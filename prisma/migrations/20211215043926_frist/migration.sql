-- CreateTable
CREATE TABLE `Subjects` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `SubjectName` VARCHAR(191) NOT NULL,
    `SubjectCode` VARCHAR(191) NOT NULL,
    `max` VARCHAR(191) NOT NULL,
    `min` VARCHAR(191) NOT NULL,
    `max25` VARCHAR(191) NOT NULL,
    `maxtotal` VARCHAR(191) NOT NULL,
    `mintotal` VARCHAR(191) NOT NULL,
    `Syllabus` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `SubjectCombination` (
    `subjectsId` INTEGER NOT NULL,
    `status` BOOLEAN NOT NULL,
    `semId` INTEGER NOT NULL,
    `electiveId` INTEGER NULL,
    `Syllabus` INTEGER NOT NULL,

    PRIMARY KEY (`semId`, `subjectsId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Semister` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `className` VARCHAR(191) NOT NULL,
    `departmentId` VARCHAR(191) NOT NULL,
    `Section` VARCHAR(191) NOT NULL,
    `Institution` VARCHAR(191) NOT NULL,
    `numIndex` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Department` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Result` (
    `id` VARCHAR(191) NOT NULL,
    `RollId` VARCHAR(191) NOT NULL,
    `StudentName` VARCHAR(191) NOT NULL,
    `Sem` VARCHAR(191) NOT NULL,
    `Section` VARCHAR(191) NOT NULL,
    `EX1` VARCHAR(191) NULL,
    `EX2` VARCHAR(191) NULL,
    `EX3` VARCHAR(191) NULL,
    `EX4` VARCHAR(191) NULL,
    `EX5` VARCHAR(191) NULL,
    `EX6` VARCHAR(191) NULL,
    `EX7` VARCHAR(191) NULL,
    `EX8` VARCHAR(191) NULL,
    `EX9` VARCHAR(191) NULL,
    `ExTotal` VARCHAR(191) NULL,
    `IA1` VARCHAR(191) NULL,
    `IA2` VARCHAR(191) NULL,
    `IA3` VARCHAR(191) NULL,
    `IA4` VARCHAR(191) NULL,
    `IA5` VARCHAR(191) NULL,
    `IA6` VARCHAR(191) NULL,
    `IA7` VARCHAR(191) NULL,
    `IA8` VARCHAR(191) NULL,
    `IA9` VARCHAR(191) NULL,
    `IATotal` VARCHAR(191) NULL,
    `Total` VARCHAR(191) NULL,
    `Result` VARCHAR(191) NULL,
    `QP1` VARCHAR(191) NULL,
    `QP2` VARCHAR(191) NULL,
    `QP3` VARCHAR(191) NULL,
    `QP4` VARCHAR(191) NULL,
    `QP5` VARCHAR(191) NULL,
    `QP6` VARCHAR(191) NULL,
    `QP7` VARCHAR(191) NULL,
    `QP8` VARCHAR(191) NULL,
    `QP9` VARCHAR(191) NULL,
    `BQ1` VARCHAR(191) NULL,
    `BX1` VARCHAR(191) NULL,
    `BI1` VARCHAR(191) NULL,
    `BX2` VARCHAR(191) NULL,
    `BI2` VARCHAR(191) NULL,
    `BQ2` VARCHAR(191) NULL,
    `BResult` VARCHAR(191) NULL,
    `BQ3` VARCHAR(191) NULL,
    `BX3` VARCHAR(191) NULL,
    `BI3` VARCHAR(191) NULL,
    `KResult` VARCHAR(191) NULL,
    `ExamYear` VARCHAR(191) NULL,
    `Department` VARCHAR(191) NULL,
    `ExamOnDate` VARCHAR(191) NULL,
    `Syllabus` VARCHAR(191) NULL,
    `InsertID` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `BridgeSubject` (
    `bgsubid` INTEGER NOT NULL AUTO_INCREMENT,
    `bsubjectName` VARCHAR(191) NOT NULL,
    `bsubjectCode` VARCHAR(191) NOT NULL,
    `bmax` VARCHAR(191) NOT NULL,
    `bmin` VARCHAR(191) NOT NULL,
    `iaop` VARCHAR(191) NOT NULL,
    `bmaxtotal` VARCHAR(191) NOT NULL,
    `bmintotal` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`bgsubid`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `BridgeSubjectCombination` (
    `bridgeSubjectBgsubid` INTEGER NOT NULL,
    `status` BOOLEAN NOT NULL,
    `kali` BOOLEAN NOT NULL,
    `semisterId` INTEGER NOT NULL,

    PRIMARY KEY (`bridgeSubjectBgsubid`, `semisterId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ElectiveSubjectCom` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `subjectsId` INTEGER NOT NULL,
    `electiveId` INTEGER NULL,
    `semisterId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `SubjectCombination` ADD CONSTRAINT `SubjectCombination_subjectsId_fkey` FOREIGN KEY (`subjectsId`) REFERENCES `Subjects`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `SubjectCombination` ADD CONSTRAINT `SubjectCombination_semId_fkey` FOREIGN KEY (`semId`) REFERENCES `Semister`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BridgeSubjectCombination` ADD CONSTRAINT `BridgeSubjectCombination_bridgeSubjectBgsubid_fkey` FOREIGN KEY (`bridgeSubjectBgsubid`) REFERENCES `BridgeSubject`(`bgsubid`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BridgeSubjectCombination` ADD CONSTRAINT `BridgeSubjectCombination_semisterId_fkey` FOREIGN KEY (`semisterId`) REFERENCES `Semister`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ElectiveSubjectCom` ADD CONSTRAINT `ElectiveSubjectCom_subjectsId_fkey` FOREIGN KEY (`subjectsId`) REFERENCES `Subjects`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
