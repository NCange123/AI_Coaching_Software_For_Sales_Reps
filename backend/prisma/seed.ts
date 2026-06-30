import "dotenv/config";
import { PrismaClient } from "../src/generated/prisma/client.js";
import { PrismaPg } from "@prisma/adapter-pg";

const adapter = new PrismaPg({ connectionString: process.env.DATABASE_URL });
const prisma = new PrismaClient({ adapter });

async function main() {
  const rep = await prisma.rep.upsert({
    where: { email: "nelson@fieldnotes.dev" },
    update: {},
    create: {
      name: "Nelson Cange",
      email: "nelson@fieldnotes.dev",
    },
  });
  console.log("Seeded rep:", rep);
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
