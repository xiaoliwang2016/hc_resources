/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('user', {
		id: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		user_no: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		},
		user_name: {
			type: DataTypes.STRING(100),
			allowNull: false
		},
		email: {
			type: DataTypes.STRING(100),
			allowNull: true
		},
		password: {
			type: DataTypes.CHAR(32),
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
		last_login: {
			type: DataTypes.DATE,
			allowNull: true
		},
	}, {
		tableName: 'user',
		timestamps: true,
		freezeTableName: true,
		createdAt: false,
		updatedAt: 'update_time',
		deletedAt: 'delete_time'
	});
};
