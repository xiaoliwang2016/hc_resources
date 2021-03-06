/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('admin', {
		id: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		user_no: {
			type: DataTypes.CHAR(8),
			allowNull: false
		},
		user_name: {
			type: DataTypes.STRING(100),
			allowNull: false
		},
		department_desc: {
			type: DataTypes.STRING(50),
			allowNull: true
		},
		company: {
			type: DataTypes.STRING(50),
			allowNull: true
		},
		company_desc: {
			type: DataTypes.STRING(50),
			allowNull: true
		},
		job: {
			type: DataTypes.STRING(50),
			allowNull: true
		},
		job_desc: {
			type: DataTypes.STRING(50),
			allowNull: true
		},
		email: {
			type: DataTypes.STRING(100),
			allowNull: true
		},
		department: {
			type: DataTypes.STRING(50),
			allowNull: true
		},
		status: {
			type: DataTypes.INTEGER(1),
			allowNull: false,
			defaultValue: '1'
		},
		super: {
			type: DataTypes.INTEGER(1),
			allowNull: false,
			defaultValue: '0'
		},
		last_login: {
			type: DataTypes.DATE,
			allowNull: true
		},
	}, {
		tableName: 'admin',
		paranoid: true,
		timestamps: true,
		freezeTableName: true,
		createdAt: false,
		updatedAt: 'update_time',
		deletedAt: 'delete_time',
		underscored: true
	});
};
