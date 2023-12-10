const cors = require('cors')
const express = require('express')
const jwt = require('jsonwebtoken')
var DB = require('./config/Dboperation')
const app = express()
const authToken = require('./AuthenticateToken')
const port = 5000


app.use(express.urlencoded({ extended: true }))
app.use(express.json())
app.use(cors())


////////////////API////////////////


app.post('/profile', authToken, async (req, res) => {
    try {
        const { userId } = req.data
        const profile = await DB.getProfile(userId)
        res.status(200).send(profile)
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})


/*
return: {
    success: Bool
    token 
}thoi
*/
app.post('/login', async (req, res) => {
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



/*
return: {
    flights: [
        {
            MaSoMayBay: 'CB001',
            LoaiKhoang: 'Economy',
            GiaKhoang: 800000,
            MoTa: 'Standard seating with in-flight entertainment',
            SoLuongGheToiDaCungCap: 150,
            SoLuongGheConLai: 149
        }
    ]
}
*/
app.post('/flight', async (req, res) => {

    try {
        const { startDate, deptLoc, destLoc, quantity } = req.body
        const flights = await DB.getFlight(startDate, deptLoc, destLoc, quantity)
        // const flights = await DB.getFlight('2023-03-01', 'HaNoi', 'Ho Chi Minh City', 19)
        console.log(flights)
        res.status(200).send({ flights: flights })
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})


/*
return: {
    success
}
*/
app.post('/passenger/insert', async (req, res) => {
    try {
        const passenger = req.body
        await DB.insertPassenger(
            passenger.name,
            passenger.phonenumber,
            passenger.email,
            passenger.CCCD,
            passenger.birthday,
            passenger.ticketId,
            passenger.flightId,
            passenger.cabinType)

        res.status(200).send({ success: true })
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})

/*
return: {
    success
}
*/
app.post('/passenger', async (req, res) => {
    try {
        const { ticketId } = req.body
        passenger = await DB.getPassenger(ticketId)
        res.status(200).send({ success: true })
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})

/*
return: {
    success
}
*/
app.post('/passenger/update', async (req, res) => {
    try {
        const { ticketId, passengers } = req.body
        await DB.deletePassenger(ticketId)
        for (let passenger of passengers) {
            await DB.insertPassenger(passenger.name,
                passenger.phonenumber,
                passenger.email,
                passenger.CCCD,
                passenger.birthday,
                ticketId,
                passenger.flightId,
                passenger.cabinType
            )
        }
        res.status(200).send({ success: true })
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})


/*
return: {
    ticketId
}
*/
app.post('/flightTicket/generate', async (req, res) => {
    try {

        const flightId = req.body.flightID
        const orderId = req.body.orderId
        const ticket = await DB.generateFlightTicket(flightId, orderId)
        res.status(200).send({ ticketId: ticket[0]['Column0'] })
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})


/*
return: {
    orderId
}
*/
app.post('/order/generate', authToken, async (req, res) => {

    try {
        const customerId = req.data.userId
        const order = await DB.generateOrder(customerId)
        res.status(200).send({ orderId: order[0]['Column0'] })
    }
    catch (err) {
        []
        res.status(500).send({ message: err.message })
    }
})

/*
return: {
    rooms: [
        {
            MaSoThueKhachSan: 'KS002',
            TenKhachSan: 'Budget Inn1',
            DiaChi: '456 Side Street',
            ThanhPho: 'City B',
            LoaiPhong: 'Couple',
            MoTa: 'Compact room for solo travelers',
            GiaPhong: 300000,
            SoLuongCungCap: 10
        }
    ]
}
*/
app.post('/room', async (req, res) => {
    try {
        const { checkInDate, checkOutDate, city } = req.body
        const rooms = await DB.getRoom(checkInDate, checkOutDate, city)
        // const rooms = await DB.getRoom('2023-03-01', '2023-03-02', 'City B')
        // console.log(rooms)
        res.status(200).send({ rooms: rooms })
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})


/*
return: {
    ticketId
}
*/
app.post('/roomTicket/generate', async (req, res) => {
    try {
        const { orderId } = req.body
        const ticket = await DB.generateRoomTicket(orderId)
        res.status(200).send({ ticketId: ticket[0]['Column0'] })
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})

/*
return:{
    revenue: [
        {
            Thang,
            TongDoanhThuThang
        }
    ]
}
*/
app.get('/revenue', async (req, res) => {
    try {
        const { providerId, airline, year } = req.body
        const revenue = await DB.getRevenue(providerId, airline, year)
        // const revenue = await DB.getRevenue('TK003', 'AirAsia', '2023')
        res.status(200).send({ revenue: revenue })
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})

app.get('/bankAccount', authToken, async (req, res) => {
    try {

    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})

app.patch('/order/payment', async (req, res) => {
    try {

    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})


app.listen(port, () => {
    console.log(`App listening on port ${port}`)
})