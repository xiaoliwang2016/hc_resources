/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('access', {
		id: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		name: {
			type: DataTypes.STRING(50),
			allowNull: false
		},
		remark: {
			type: DataTypes.STRING(50),
			allowNull: false
		},
		type: {
			type: DataTypes.INTEGER(4),
			allowNull: false,
			defaultValue: '1'
		},
		url: {
			type: DataTypes.STRING(150),
			allowNull: true
		},
	}, {
		tableName: 'access',
		paranoid: true,
		timestamps: true,
		freezeTableName: true,
		createdAt: false,
		updatedAt: 'update_time',
		deletedAt: 'delete_time',
		underscored: true
	});
};
