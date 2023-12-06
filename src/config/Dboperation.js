var config = require('./connect_db')
const sql = require('msnodesqlv8')

function getAccount() {
    return new Promise((resolve, reject) => {
        sql.query(config, "select * from TaiKhoanDangNhap", (err, result) => {
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
        const query = `select * from TimChuyenBay('${date}', '${startLoc}','${desLoc}', '${airline}')`
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
    getAirline: getAirline
}