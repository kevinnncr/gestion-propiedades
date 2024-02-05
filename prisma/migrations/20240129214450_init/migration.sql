-- CreateTable
CREATE TABLE "admin" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "admin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "seller" (
    "id" SERIAL NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "dni" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,

    CONSTRAINT "seller_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "client" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "lastname" TEXT NOT NULL,
    "phone" TEXT,
    "email" TEXT NOT NULL,

    CONSTRAINT "client_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "house" (
    "id" SERIAL NOT NULL,
    "address" TEXT NOT NULL,
    "saleprice" DOUBLE PRECISION NOT NULL,
    "Rentalprice" DOUBLE PRECISION,
    "bedrooms" INTEGER NOT NULL,
    "totalarea" DOUBLE PRECISION NOT NULL,
    "description" TEXT,

    CONSTRAINT "house_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contract" (
    "id" SERIAL NOT NULL,
    "startdate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "enddate" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "price" DOUBLE PRECISION NOT NULL,
    "sellerId" INTEGER NOT NULL,
    "clientId" INTEGER NOT NULL,

    CONSTRAINT "contract_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "admin_email_key" ON "admin"("email");

-- CreateIndex
CREATE UNIQUE INDEX "seller_dni_key" ON "seller"("dni");

-- CreateIndex
CREATE UNIQUE INDEX "client_phone_key" ON "client"("phone");

-- CreateIndex
CREATE UNIQUE INDEX "client_email_key" ON "client"("email");

-- CreateIndex
CREATE UNIQUE INDEX "house_address_key" ON "house"("address");

-- AddForeignKey
ALTER TABLE "client" ADD CONSTRAINT "client_id_fkey" FOREIGN KEY ("id") REFERENCES "seller"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contract" ADD CONSTRAINT "contract_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES "client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contract" ADD CONSTRAINT "contract_sellerId_fkey" FOREIGN KEY ("sellerId") REFERENCES "seller"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
