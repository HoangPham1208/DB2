var config = require('./connect_db')
const sql = require('msnodesqlv8')

function getAccount(username, role) {
    return new Promise((resolve, reject) => {
        if (role === 'user') {
            const query = `select * 
            from TaiKhoanDangNhap T, KhachHang K 
            where T.MaSo = K.MaSoTaiKhoan and T.TenDangNhap = '${username}'`
        }
        else {
            const query = `select * 
            from TaiKhoanDangNhap T, ChuDichVu C
            where T.MaSo = C.MaSoTaiKhoan and T.TenDangNhap = '${username}'`
        }
        sql.query(config, query, (err, result) => {
            if (err) {
                console.log(err);
                reject(err);
            }
            else {
                resolve(result);
            }
        })
    })
}

function getFlight(date, startLoc, desLoc, quantity) {
    return new Promise((resolve, reject) => {
        const query = `exec SoLuongNguoiBayTheoNgay @Date = '${date}', @Start = '${startLoc}', @End = '${desLoc}', @Quantity = ${quantity}`
        sql.query(config, query, (err, result) => {
            if (err) {
                console.log(err);
                reject(err);
            }
            else {
                console.log(result)
                resolve(result);
            }
        })
    })
}

function insertPassenger(HoVaTen, SDT, Email, CCCD, NgaySinh, MaVe, MaChuyenBay, LoaiKhoang) {
    return new Promise((resolve, reject) => {
        const query = `EXEC InsertNguoiThamGiaChuyenBay
        @HoVaTen = '${HoVaTen}',
        @SoDienThoai = '${SDT}',
        @Email = '${Email}',
        @SoCCCD = '${CCCD}',
        @NgaySinh = '${NgaySinh}',
        @MaVeMayBay = '${MaVe}',
        @MaSoMayBay = '${MaChuyenBay}',
        @LoaiKhoang = '${LoaiKhoang}'`
        sql.query(config, query, (err, result) => {
            if (err) {
                console.log(err);
                reject(err);
            }
            else {
                resolve(result);
            }
        })
    })
}

function getPassenger(MaVe) {
    return new Promise((resolve, reject) => {
        const query = `select * from NguoiThamGiaChuyenBay N where N.MaVeMayBay = '${MaVe}' `
        sql.query(config, query, (err, result) => {
            if (err) {
                console.log(err);
                reject(err);
            }
            else {
                resolve(result);
            }
        })
    })
}

function deletePassenger(MaVe) {
    return new Promise((resolve, reject) => {
        const query = `delete from NguoiThamGiaChuyenBay where NguoiThamGiaChuyenBay.MaVeMayBay = '${MaVe}' `
        sql.query(config, query, (err, result) => {
            if (err) {
                console.log(err);
                reject(err);
            }
            else {
                resolve(result);
            }
        })
    })
}

function generateOrder() {
    return new Promise((resolve, reject) => {
        query = ``

        sql.query(config, query, (err, result) => {
            if (err) {
                console.log(err);
                reject(err);
            }
            else {
                resolve(result);
            }
        })
    })
}

function generateTicket(flightId, orderId) {
    return new Promise((resolve, reject) => {
        query = `EXEC InsertAndGetAutoKey_VeDatMayBay @MaDonHang = '${orderId}', @MaSoChuyenBay = '${flightId}'`

        sql.query(config, query, (err, result) => {
            if (err) {
                console.log(err);
                reject(err);
            }
            else {
                console.log(result)
                console.log(result)
                resolve(result);
            }
        })
    })
}



module.exports = {
    getAccount: getAccount,
    getFlight: getFlight,
    insertPassenger: insertPassenger,
    getPassenger: getPassenger,
    deletePassenger: deletePassenger,
    generateTicket: generateTicket
}