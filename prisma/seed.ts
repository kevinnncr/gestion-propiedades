import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function seed (){
    const saadmin = await prisma.admin.create({
        data:{
            name: 'heiddy ',
            email:'hp@gmail.com',
            password: 'saAdmin'
        }
    })


}


