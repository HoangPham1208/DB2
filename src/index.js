const express = require('express')
var DB = require('./config/Dboperation')
const app = express()
const port = 3000

app.use(express.urlencoded({ extended: true }))
app.use(express.json())

////////////////API////////////////
app.get('/login', async (req, res) => {
    const { username, password } = req.body
    const users = await DB.getAccount()
    if (users.some(user => user.Ten === username) && users) console.log('Fuckk')
})

app.get('/airline', async (req, res) => {
    const airline = await DB.getAirline('2023-03-01', 'HaNoi', 'Ho Chi Minh City', 'Vietnam Airlines')
    console.log(airline)
})




app.listen(port, () => {
    console.log(`App listening on port ${port}`)
})