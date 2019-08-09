/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('role', {
		id: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		theme_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		},
		role_name: {
			type: DataTypes.STRING(50),
			allowNull: true
		},
		role_desc: {
			type: DataTypes.STRING(50),
			allowNull: true
		},
		status: {
			type: DataTypes.INTEGER(1),
			allowNull: false,
			defaultValue: '1'
		},
		role_group: {
			type: DataTypes.INTEGER(1),
			allowNull: false,
			defaultValue: '0'
		},
		remark: {
			type: DataTypes.STRING(100),
			allowNull: true
		},
	}, {
		tableName: 'role',
		timestamps: true,
		freezeTableName: true,
		createdAt: false,
		updatedAt: 'update_time',
		deletedAt: 'delete_time'
	});
};
