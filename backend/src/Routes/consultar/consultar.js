const MongoClient = require(`mongodb`).MongoClient
const url = "mongodb://localhost:27017/"

const consultar = (req, res)=>{

    const search = req.params.banco
    const mongoOption ={useNewUrlParser: true, useUnifiedTopology: true}

    MongoClient.connect(url, mongoOption, (error, bancodedados) =>{
        const banco = bancodedados.db('dados')
        banco.collection('user').find({
            "user" : 'pivo'
        }).toArray((err, result)=>{
            console.log('Olá você fez uma requisição')
            console.log('O VALOR DE PARAMATRO É: '+search)
            res.status(200).json(result)
        })
    })
}

module.exports = {
    consultar
}