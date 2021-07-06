const { config } = require('dotenv')

const { json } = require('express')
const  express = require('express')
const app = express()

const cors = require("cors");
app.use(cors());

const path = require('path')

require('dotenv').config({
    path : path.resolve(__dirname, 'src', '.env')
})

const routes = require('./src/routes')

//LIMITE DAS REQUISIÇOES Json
app.use(json({limit: '50mb'}))
app.use(routes)

const port = process.env.PORT || 1234

app.listen(port, ()=>{
    console.log('Rodando na porta: ' +port)
})