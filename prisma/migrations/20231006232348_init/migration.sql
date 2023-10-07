-- CreateTable
CREATE TABLE "Local" (
    "id_local" SERIAL NOT NULL,
    "id_ciudad" INTEGER NOT NULL,
    "nombre" TEXT NOT NULL,
    "direccion" TEXT,
    "capacidad" INTEGER NOT NULL,
    "descripcion" TEXT,

    CONSTRAINT "Local_pkey" PRIMARY KEY ("id_local")
);

-- CreateTable
CREATE TABLE "Contratos" (
    "id_contrato" SERIAL NOT NULL,
    "id_pago" INTEGER NOT NULL,
    "id_usuario" INTEGER NOT NULL,
    "fecha_inicio" TIMESTAMP(3) NOT NULL,
    "fecha_fin" TIMESTAMP(3) NOT NULL,
    "terminos" TEXT,
    "numero_invitados" INTEGER NOT NULL,
    "estado" TEXT NOT NULL,
    "id_localfk" INTEGER NOT NULL,

    CONSTRAINT "Contratos_pkey" PRIMARY KEY ("id_contrato")
);

-- CreateTable
CREATE TABLE "ServiciosAdicionales" (
    "id_serviad" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "descripcion" TEXT,
    "precio_adicional" DECIMAL(65,30) NOT NULL,
    "id_localfk" INTEGER NOT NULL,
    "id_contratofk" INTEGER NOT NULL,

    CONSTRAINT "ServiciosAdicionales_pkey" PRIMARY KEY ("id_serviad")
);

-- AddForeignKey
ALTER TABLE "Contratos" ADD CONSTRAINT "Contratos_id_localfk_fkey" FOREIGN KEY ("id_localfk") REFERENCES "Local"("id_local") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServiciosAdicionales" ADD CONSTRAINT "ServiciosAdicionales_id_localfk_fkey" FOREIGN KEY ("id_localfk") REFERENCES "Local"("id_local") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServiciosAdicionales" ADD CONSTRAINT "ServiciosAdicionales_id_contratofk_fkey" FOREIGN KEY ("id_contratofk") REFERENCES "Contratos"("id_contrato") ON DELETE RESTRICT ON UPDATE CASCADE;
