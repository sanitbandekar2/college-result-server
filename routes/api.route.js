const router = require("express").Router();
const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();
router.get("/classes", async (req, res, next) => {
  try {
    const classes = await prisma.semister.groupBy({
      by: ["className"],
    });
    res.send(classes);
  } catch (error) {
    next(error);
  }
});
router.get("/deleteResult", async (req, res, next) => {
  try {
    const classes = await prisma.subjects.deleteMany({});
    res.send(classes);
  } catch (error) {
    next(error);
  }
});

router.post("/resultSemUpdate", async (req, res, next) => {
  let numIdex = [];
  let semIds = [];
  numIdex = req.body.numidex;
  semIds = req.body.semId;
  console.log(req.body.insertionId);
  try {
    for (let index = 0; index < numIdex.length; index++) {
      const classes = await prisma.result.updateMany({
        where: {
          Sem: semIds[index],
          InsertID: req.body.insertionId,
        },
        data: { Sem: numIdex[index] },
      });
    }
    res.send("ok");
  } catch (error) {
    next(error);
  }
});

router.get("/semister/:id", async (req, res, next) => {
  // res.send({ message: "Ok api is working 🚀 sanit" });
  try {
    const create = await prisma.semister.findMany({
      where: {
        departmentId: req.params.id,
      },
    });
    res.send(create);
  } catch (error) {
    next(error);
  }
});
router.get("/resultList/:id", async (req, res, next) => {
  // res.send({ message: "Ok api is working 🚀 sanit" });
  try {
    const create = await prisma.result.findMany({
      where: {
        RollId: req.params.id,
      },
      select: {
        id: true,
        RollId: true,
        Sem: true,
        Syllabus: true,
        ExamYear: true,
        Section: true,
      },
    });
    res.send(create);
  } catch (error) {
    next(error);
  }
});
router.get("/result/:id/:sem", async (req, res, next) => {
  // res.send({ message: "Ok api is working 🚀 sanit" });
  try {
    const result = await prisma.result.findMany({
      where: {
        id: req.params.id,
      },
    });
    const subject = await prisma.subjectCombination.findMany({
      include: {
        subjects: true,
      },
      where: {
        semId: Number(req.params.sem),
      },
    });

    const bg = await prisma.bridgeSubjectCombination.findMany({
      include: {
        BridgeSubject: true,
      },
      where: {
        semisterId: Number(req.params.sem),
      },
    });

    const elective = await prisma.electiveSubjectCom.findMany({
      include: { Subjects: true },
      where: {
        semisterId: Number(req.params.sem),
      },
    });

    res.send({ result, subject, bg, elective });
  } catch (error) {
    next(error);
  }
});

router.get("/:id", async (req, res, next) => {
  // res.send({ message: "Ok api is working 🚀" });
  try {
    const subjectsCom = await prisma.subjectCombination.findMany({
      include: {
        subjects: true,
      },
      where: {
        semId: Number(req.params.id),
      },
    });

    const bg = await prisma.bridgeSubjectCombination.findMany({
      include: {
        BridgeSubject: true,
      },
      where: {
        semisterId: Number(req.params.id),
      },
    });

    const elective = await prisma.electiveSubjectCom.findMany({
      include: { Subjects: true },
      where: {
        semisterId: Number(req.params.id),
      },
    });

    res.send({ subjectsCom, bg, elective });
  } catch (error) {
    next(error);
  }
});

router.get("/", async (req, res, next) => {
  try {
    const classes = await prisma.subjectCombination.findMany({});
    res.send(classes);
  } catch (error) {
    next(error);
  }
});

router.post("/elective", async (req, res, next) => {
  try {
    const create = await prisma.electiveSubjectCom.createMany({
      data: req.body,
    });
    res.send(create);
  } catch (error) {
    next(error);
  }
});
router.post("/subject", async (req, res, next) => {
  try {
    const create = await prisma.subjects.createMany({
      data: req.body,
    });
    res.send(create);
  } catch (error) {
    next(error);
  }
});
router.post("/subcombination", async (req, res, next) => {
  try {
    const create = await prisma.subjectCombination.createMany({
      data: req.body,
      skipDuplicates: true,
    });
    res.send(create);
  } catch (error) {
    next(error);
  }
});
router.post("/semister", async (req, res, next) => {
  try {
    const create = await prisma.semister.createMany({
      data: req.body,
    });
    res.send(create);
  } catch (error) {
    next(error);
  }
});
router.post("/bgSubject", async (req, res, next) => {
  try {
    const create = await prisma.bridgeSubject.createMany({
      data: req.body,
    });
    res.send(create);
  } catch (error) {
    next(error);
  }
});
router.post("/bgSubCombination", async (req, res, next) => {
  try {
    const create = await prisma.bridgeSubjectCombination.createMany({
      data: req.body,
    });
    res.send(create);
  } catch (error) {
    next(error);
  }
});
router.post("/resultStore", async (req, res, next) => {
  try {
    const create = await prisma.result.createMany({
      data: req.body,
    });
    res.send(create);
  } catch (error) {
    next(error);
  }
});

module.exports = router;
