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

function getAirline(date, startLoc, desLoc, airline) {
    return new Promise((resolve, reject) => {
        const query = `select * from SoLuongNguoiBayTheoNgay @Date = '${date}', @Start = '${startLoc}', @End = '${desLoc}')`
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
        query = `
        INSERT INTO VeDatMayBay (MaDonHang, MaSoChuyenBay)
        VALUES ( '${orderId}', '${flightId}');
        select * from VeDatMayBay V where V.MaDonHang = '${orderId}' and V.MaSoChuyenBay = '${flightId}'`

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



module.exports = {
    getAccount: getAccount,
    getAirline: getAirline,
    generateTicket: generateTicket
}