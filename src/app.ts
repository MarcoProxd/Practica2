import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

const createUser = async () => {
   const localCreated = await prisma.local.create({
        data: {
            id_ciudad: 1,
            nombre: "Marco Proano",
            direccion: "Las cumbres 3ra etapa",
            capacidad: 100,
            descripcion: "Muy buen local"
        }

    });
    console.log(localCreated);
    const ContratoCreated = await prisma.contratos.create({
        data:{
            id_pago: 10,
            id_usuario: 10,
            id_localfk:localCreated.id_local,
            fecha_inicio: new Date("2023-10-06T00:00:00Z"),
            fecha_fin: new Date("2023-10-08T00:00:00Z"),
            terminos: "abcd",
            numero_invitados: 150,
            estado: "Reservado",
        }
    }) 
    console.log(ContratoCreated);

    const createServiciosad = await prisma.serviciosAdicionales.create({
        data: {
            id_localfk:localCreated.id_local,
            id_contratofk:ContratoCreated.id_contrato,
            nombre: "Decoración y tematización",
            descripcion:"Diseño y decoración personalizada del espacio según el tema o estilo del evento. Decoración floral, arreglos de mesa, iluminación especial.",
            precio_adicional: 50.50
        }
    }); 
    console.log(createServiciosad);
};
const queryservi= async ()=>{
    const Serviad= await prisma.serviciosAdicionales.findMany({
        include:{
            contrato:true
        }
        , where:{
            id_serviad:1
        }
    })
    console.log(Serviad);
};

const updateserviad = async ()=>{
    const Serviad = await prisma.serviciosAdicionales.update({
        data:{
            nombre: "Servicio de fotografía y video"
        },
        where:{
            id_serviad: 1
        }
    })
    console.log(Serviad);
};



const deleteserviad= async ()=>{
    const Serviad= await prisma.serviciosAdicionales.delete({
        where:{
            id_serviad:1
        }
    })
};
(async ()=>{
    //await createUser()
    //await queryservi()
    //await updateserviad()
    //await deleteserviad()
})()