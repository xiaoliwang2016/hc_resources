/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('access', {
		id: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		pid: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		},
		name: {
			type: DataTypes.STRING(50),
			allowNull: false
		},
		menu_name: {
			type: DataTypes.STRING(50),
			allowNull: false
		},
		type: {
			type: DataTypes.INTEGER(4),
			allowNull: false,
			defaultValue: '1'
		},
		level: {
			type: DataTypes.INTEGER(4),
			allowNull: true
		},
		url: {
			type: DataTypes.STRING(150),
			allowNull: true
		},
	}, {
		tableName: 'access',
		timestamps: true,
		freezeTableName: true,
		createdAt: false,
		updatedAt: 'update_time',
		deletedAt: 'delete_time'
	});
};
