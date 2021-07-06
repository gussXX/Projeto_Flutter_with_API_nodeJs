const MongoClient = require(`mongodb`).MongoClient
const url = "mongodb://localhost:27017/"

const excluir = (req)=>{

    const descart = req.params.banco
    const mongoOption ={useNewUrlParser: true, useUnifiedTopology: true}

    MongoClient.connect(url, mongoOption, (error, bancodedados) =>{
        const banco = bancodedados.db('dados')
        banco.collection('user').deleteOne({'user' : 'insert 6'}, (err, obj)=>{

            bancodedados.close()  

            if(obj.result.n === 1){
                console.log('Valor excluido --> ' +obj.result.ok)
                console.log(err)
            }else{
                console.log('Valor NÃO excluido --> ' +obj.result.ok)
                console.log(err)
            }

        })

    })
}

module.exports = {
    excluir
}