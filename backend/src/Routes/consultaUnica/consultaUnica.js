const MongoClient = require(`mongodb`).MongoClient
const url = "mongodb://localhost:27017/"

const consultaUnica = (req, res)=>{

    const search = req.params.fatordebusca
    const mongoOption ={useNewUrlParser: true, useUnifiedTopology: true}

    MongoClient.connect(url, mongoOption, (error, bancodedados) =>{
        const banco = bancodedados.db('dados')
        banco.collection('user').findOne({
            "user" : search
        }).then((result, err)=>{
            if(err){
                console.log('ERROR')
                res.status(500).json(err)
            }else{
                console.log('OK')
                console.log('O VALOR DE PARAMATRO É: '+search)
                res.status(200).json(result)
            }
        })
    })
}

module.exports = {
    consultaUnica
}


