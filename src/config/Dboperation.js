var config = require('./connect_db')
const sql = require('msnodesqlv8')

async function getData() {
    try {
        sql.query(config, "select * from DonHang", (err, row) => {
            console.log(row)
        })
    }
    catch (err) {
        console.log(err)
    }
}
module.exports = {
    getData: getData
}