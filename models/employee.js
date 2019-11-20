/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('employee', {
		PERNR: {
			type: DataTypes.STRING(32),
			allowNull: false,
			primaryKey: true
		},
		COME_DATE: {
			type: DataTypes.DATEONLY,
			allowNull: true
		},
		LEAVE_DATE: {
			type: DataTypes.DATEONLY,
			allowNull: true
		},
		SNAME: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		ABKRS: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		ABKRS_DESC: {
			type: DataTypes.STRING(128),
			allowNull: true
		},
		ANSVH: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		ANSVH_DESC: {
			type: DataTypes.STRING(128),
			allowNull: true
		},
		KOSTL: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		KOSTL_DESC: {
			type: DataTypes.STRING(128),
			allowNull: true
		},
		ZZ_POSLV: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		ZZ_POSLV_DESC: {
			type: DataTypes.STRING(128),
			allowNull: true
		},
		ZZ_ZWXZ: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		ZZ_ZWXZ_DESC: {
			type: DataTypes.STRING(128),
			allowNull: true
		},
		ZZ_YWXZ: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		ZZ_YWXZ_DESC: {
			type: DataTypes.STRING(128),
			allowNull: true
		},
		PERSG: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		PERSG_DESC: {
			type: DataTypes.STRING(128),
			allowNull: true
		},
		PERSK: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		PERSK_DESC: {
			type: DataTypes.STRING(128),
			allowNull: true
		},
		VDSK1: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		VDSK1_DESC: {
			type: DataTypes.STRING(128),
			allowNull: true
		},
		BTRTL: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		BTRTL_DESC: {
			type: DataTypes.STRING(128),
			allowNull: true
		},
		BUKRS: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		BUKRS_DESC: {
			type: DataTypes.STRING(128),
			allowNull: true
		},
		WERKS: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		WERKS_DESC: {
			type: DataTypes.STRING(128),
			allowNull: true
		},
		PLANS: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		PLANS_DESC: {
			type: DataTypes.STRING(128),
			allowNull: true
		},
		ORGEH: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		ORGEH_DESC: {
			type: DataTypes.STRING(128),
			allowNull: true
		},
		STELL: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		STELL_DESC: {
			type: DataTypes.STRING(128),
			allowNull: true
		},
		ZZ_SJDW: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		ZZ_SJDW_DESC: {
			type: DataTypes.STRING(128),
			allowNull: true
		},
		ZZ_SIJI: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		ZZ_SIJI_DESC: {
			type: DataTypes.STRING(128),
			allowNull: true
		},
		DATA_SOURCE: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		DATA_SOURCE_ACCOUNT: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		ETL_CREATE_DATE: {
			type: DataTypes.STRING(32),
			allowNull: true
		},
		ETL_LASTUP_DATE: {
			type: DataTypes.DATE,
			allowNull: true
		}
	}, {
		tableName: 'employee',
		timestamps: false,
		freezeTableName: true,
		underscored: true
	});
};
