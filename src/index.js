const express = require('express')
var DB = require('./config/Dboperation')
const app = express()
const port = 3000

app.use(express.urlencoded({ extended: true }))
app.use(express.json())

////////////////API////////////////
app.get('/', (req, res) => {
    DB.getData()
})




app.listen(port, () => {
    console.log(`App listening on port ${port}`)
})