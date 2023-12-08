const express = require('express')
var DB = require('./config/Dboperation')
const app = express()
const port = 3000

app.use(express.urlencoded({ extended: true }))
app.use(express.json())

////////////////API////////////////
/*
needed: {
    username,
    password
}  
return: {
    success: Bool
    token 
}
*/
app.get('/userLogin', async (req, res) => {
    try {
        const { username, password, role } = req.body
        const secretKey = 'alo1234'
        const users = await DB.getAccount(username, role)
        if (users[0] && users[0].MatKhau === password) {
            const token = jwt.sign(
                {
                    userId: users[0].MaSo,
                    username: users[0].TenDangNhap,
                    userRole: role
                },
                secretKey,
                { expiresIn: "2h" }
            )
            res.status(200).send({ success: true, token: token })
        }
        else res.status(401).send({ success: false })
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})

app.post('/ownerLogin', async (req, res) => {
    try {
        const { username, password } = req.body
        const secretKey = 'alo1234'
        const users = await DB.getAccount(username)
        if (users[0] && users[0].MatKhau === password) {
            const token = jwt.sign(
                {
                    userId: users[0].MaSo,
                    username: users[0].TenDangNhap,
                    userRole: 'user'
                },
                secretKey,
                { expiresIn: "2h" }
            )
            res.status(200).send({ success: true, token: token })
        }
        else res.status(401).send({ success: false })
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})

app.post('/flight', async (req, res) => {
    try {
        const { date, startLoc, endLoc, airline } = req.body
        const filghts = await DB.getFlight(date, startLoc, endLoc)
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }

})

app.post('/ticket/generate', async (req, res) => {
    try {
        const { flightId, orderId } = req.body
        const ticket = await DB.generateTicket(flightId, orderId)
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})

app.post('/order/generate', async (req, res) => {
    try {
        const { customerId } = req.body
        const ticket = await DB.generateOrder(customerId)
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})

app.patch('/order/payment', async (req, res) => {

})
app.put('/ticket/update', async (req, res) => {

})


app.listen(port, () => {
    console.log(`App listening on port ${port}`)
})