const MongoClient = require(`mongodb`).MongoClient
const url = "mongodb://localhost:27017/"

const inserir = (req, res)=>{

    const insert = req.body
    const mongoOption ={useNewUrlParser: true, useUnifiedTopology: true}

    MongoClient.connect(url, mongoOption, (error, bancodedados) =>{
        const banco = bancodedados.db('dados')
        banco.collection('user').insertOne(insert,(error, result)=>{
            if (error) {
                res.status(500),json({message:'Valor não inserido'})
            } else {
                res.status(200).json(result)
                console.log('Valor inserido com Exito !: ')
                console.log(req.body)
            }
        })
    })
}

module.exports = {
    inserir
}