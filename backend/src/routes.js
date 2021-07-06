const express = require('express')

const   {inserir}       = require('./Routes/inserir/inserir')
const   {consultar}     = require('./Routes/consultar/consultar')
const   {excluir}       = require('./Routes/excluir/excluir')
const {consultaUnica}   = require('./Routes/consultaUnica/consultaUnica')

const router = express.Router()

//metodo GET
router.get('/consultar/',                   consultar)

//metodo GET
router.get('/consultaUnica/:fatordebusca',  consultaUnica)

//metodo HEAD
router.head('/excluir/',                    excluir)

//metodo POST
router.post('/inserir/',                    inserir)

module.exports = router;