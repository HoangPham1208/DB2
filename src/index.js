const express = require('express')
var DB = require('./config/Dboperation')
const app = express()
const authToken = require('./AuthenticateToken')
const port = 3000


app.use(express.urlencoded({ extended: true }))
app.use(express.json())

////////////////API////////////////
/*
return: {
    success: Bool
    token 
}
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
            res.status(200).send({ token: token })
        }
        else res.status(401).send({ success: false })
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})



/*
return: {
    flight: [
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
        const { NgayXuatPhat, NoiXuatPhat, NoiHaCanh, SoLuong } = req.body
        const flights = await DB.getFlight(NgayXuatPhat, NoiXuatPhat, NoiHaCanh, SoLuong)
        // const flights = await DB.getFlight('2023-03-01', 'HaNoi', 'Ho Chi Minh City', 19)
        // console.log(flights)
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
        const passengers = req.body
        await DB.insertPassenger(passengers.HoVaTen, passengers.SĐT, Email, CCCD, NgaySinh, MaChuyenBay, LoaiKhoang)
        res.status(200).send({ success: True })
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})


app.post('/passenger', async (req, res) => {
    try {
        const { MaVe } = req.body
        passenger = await DB.getPassenger(MaVe)
        res.status(200).send({ success: True })
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})

app.post('/passenger/update', async (req, res) => {
    try {
        const { MaVe, passengers } = req.body
        await DB.deletePassenger(MaVe)
        for (let passenger of passengers) {
            await DB.insertPassenger(passenger.HoVaTen,
                passenger.SĐT,
                passenger.Email,
                passenger.CCCD,
                passenger.NgaySinh,
                passenger.MaChuyenBay,
                passenger.LoaiKhoang
            )
        }
        res.status(200).send({ success: True })
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})

/*
return: {
    MaVe
}
*/
app.get('/ticket/generate', async (req, res) => {
    try {
        const { MaChuyenBay, MaDonHang } = req.body
        const ticket = await DB.generateTicket(MaChuyenBay, MaDonHang)
        res.status(200).send({ MaVe: ticket[0]['Column0'] })
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})

/*
return: {
    MaDonHang
}
*/
app.post('/order/generate', authToken, async (req, res) => {
    try {
        const { customerId } = req.body
        const order = await DB.generateOrder(customerId)
        res.status(200).send({ order: order })
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

app.put('/ticket/update', async (req, res) => {
    try {
        const { customerId } = req.body
        const order = await DB.generateOrder(customerId)
        res.status(200).send({ order: order })
    }
    catch (err) {
        res.status(500).send({ message: err.message })
    }
})


app.listen(port, () => {
    console.log(`App listening on port ${port}`)
})