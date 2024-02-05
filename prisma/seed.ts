import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function seed (){
    const saadmin = await prisma.admin.create({
        data:{
            name: 'heiddy ',
            lastname: 'Bartonder',
            email:'hp@gmail.com',
            password: 'saAdmin'
        }
    })
const seller1 = await prisma.seller.create({
    data:{
        firstName:'Belen',
        lastName: 'Olsen',
        dni : '30256487',
        phoneNumber: '911234567',

    }
})
const seller2 = await prisma.seller.create({
    data:{
      firstName:'Ana',
      lastName:'Vera',
       dni : '12345678',
      phoneNumber:'0962560040',

    }
})
const client1 = await prisma.client.create({
    data:{
        name:"Juan",
        lastname:"Perez",
        phone: "911234567",
        email: "juan@gmail.com",
    }
})
const house1 =await prisma.house.create({
   data:{
       address: 'Monay',
       saleprice: 25.000,
       Rentalprice: 800.00,
       bedrooms: 5,
       totalarea: 2152.78 ,
       description: 'Casa bonita y pet friendly',
     
   },
});
await prisma.contract.createMany({
    data:[
        {
            startdate:new Date (12/0/24),
            enddate: new Date (12/6/24),
            price:  800.00,
            sellerId: seller1.id,
            clientId: client1.id
        }
    ]
})
console.log('Seed data inserted successfully');
}

 


seed()
  .catch((error) => {
    throw error;
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
