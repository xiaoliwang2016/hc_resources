var sequelize = require('../../db/mysql').sequelize
var multer = require('multer')
var path = require('path')
const Excel = require('exceljs/modern.nodejs')

var EmployeeModel = sequelize.import('../../models/employee')

class EmployeeController{

    /**
     * 通过工号从员工表查询用户信息
     */
    async search(req, res, next){
        var data = await EmployeeModel.findOne({
            where: {
                'PERNR': req.query.user_no.toString()
            }
        })
        res.json({
            code: 1,
            data
        })
    }

    /**
     * 初始化：设置保存规则/过滤规则等 符合要求的图片会被保存在指定位置,图片信息保存在req.files下
     */
    init(req, res, next){
        //uuid工具可以生成唯一标示 需要安装
        var UUID = require('uuid')
        //设置保存规则
        var storage = multer.diskStorage({
            //destination：字段设置上传路径，可以为函数
            destination: path.resolve(__dirname, '../../upload/excel'),

            //filename：设置文件保存的文件名
            filename: function(req, file, cb) {
                let extName = file.originalname.slice(file.originalname.lastIndexOf('.'))
                let fileName = UUID.v1()
                cb(null, fileName + extName)
            }
        })


        //设置限制（可选）
        var fileLimit = {
            fieldSize: '10MB'
        }

        /**
         * multer({...}).array(config.field, 12) 返回一个node中间件，所以需要将 req, res, next 作为参数传入
         */
        multer({ 
            storage: storage,
            limits: fileLimit
        }).array('excel', 12)(req, res, next)    //定义表单字段、数量限制
    }

    /**
     * 通过excel导入员工信息
     */
    async importFromExcel(req, res, next){
        var filePath = req.files[0].path
        var workbook = new Excel.Workbook()
        await workbook.xlsx.readFile(filePath)
        var worksheet = await workbook.getWorksheet('employee'),
        counter = 2, taskArr = []

        while(counter <= worksheet.rowCount){
            let row = worksheet.getRow(counter),
            rowData = row.values
            taskArr.push(EmployeeModel.findOrCreate({
                where: {
                    'PERNR': rowData[1]
                },
                defaults: {
                    'PERNR': rowData[1],
                    'COME_DATE': rowData[2],
                    'LEAVE_DATE': rowData[3],
                    'SNAME': rowData[4],
                    'ABKRS': rowData[5],
                    'ABKRS_DESC': rowData[6],
                    'ANSVH': rowData[7],
                    'ANSVH_DESC': rowData[8],
                    'KOSTL': rowData[9],
                    'KOSTL_DESC': rowData[10],
                    'ZZ_POSLV': rowData[11],
                    'ZZ_POSLV_DESC': rowData[12],
                    'ZZ_ZWXZ': rowData[13],
                    'ZZ_ZWXZ_DESC': rowData[14],
                    'ZZ_YWXZ': rowData[15],
                    'ZZ_YWXZ_DESC': rowData[16],
                    'PERSG': rowData[17],
                    'PERSG_DESC': rowData[18],
                    'PERSK': rowData[19],
                    'PERSK_DESC': rowData[20],
                    'VDSK1': rowData[21],
                    'VDSK1_DESC': rowData[22],
                    'BTRTL': rowData[23],
                    'BTRTL_DESC': rowData[24],
                    'BUKRS': rowData[25],
                    'BUKRS_DESC': rowData[26],
                    'WERKS': rowData[27],
                    'WERKS_DESC': rowData[28],
                    'PLANS': rowData[29],
                    'PLANS_DESC': rowData[30],
                    'ORGEH': rowData[31],
                    'ORGEH_DESC': rowData[32],
                    'STELL': rowData[33],
                    'STELL_DESC': rowData[34],
                    'ZZ_SJDW': rowData[35],
                    'ZZ_SJDW_DESC': rowData[36],
                    'ZZ_SIJI': rowData[37],
                    'ZZ_SIJI_DESC': rowData[38],
                    'DATA_SOURCE': rowData[39],
                    'DATA_SOURCE_ACCOUNT': rowData[40],
                    'ETL_CREATE_DATE': rowData[41],
                    'ETL_LASTUP_DATE': rowData[42]
                }
            }))
            counter += 1
        }

        Promise.all(taskArr).then(() => {
            res.json({
                code: 1,
                message: '导入记录成功'
            })
        })
    }

}

module.exports = new EmployeeController()