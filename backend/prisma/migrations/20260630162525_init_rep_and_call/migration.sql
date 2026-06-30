-- CreateEnum
CREATE TYPE "CallStatus" AS ENUM ('PENDING', 'TRANSCRIBING', 'READY', 'FAILED');

-- CreateTable
CREATE TABLE "Rep" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Rep_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Call" (
    "id" TEXT NOT NULL,
    "status" "CallStatus" NOT NULL DEFAULT 'PENDING',
    "audioFilePath" TEXT,
    "transcript" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "repId" TEXT NOT NULL,

    CONSTRAINT "Call_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Rep_email_key" ON "Rep"("email");

-- AddForeignKey
ALTER TABLE "Call" ADD CONSTRAINT "Call_repId_fkey" FOREIGN KEY ("repId") REFERENCES "Rep"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
