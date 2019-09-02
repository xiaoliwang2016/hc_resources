/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('theme', {
		id: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		theme_name: {
			type: DataTypes.STRING(50),
			allowNull: false
		},
		department: {
			type: DataTypes.STRING(50),
			allowNull: true
		},
		manager: {
			type: DataTypes.STRING(50),
			allowNull: false
		},
		status: {
			type: DataTypes.INTEGER(1),
			allowNull: false,
			defaultValue: '1'
		},
		remark: {
			type: DataTypes.STRING(100),
			allowNull: true
		},
	}, {
		tableName: 'theme',
		paranoid: true,
		timestamps: true,
		freezeTableName: true,
		createdAt: false,
		updatedAt: 'update_time',
		deletedAt: 'delete_time'
	});
};
