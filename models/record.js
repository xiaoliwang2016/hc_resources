/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('record', {
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
		user_no: {
			type: DataTypes.STRING(15),
			allowNull: true
		},
		user_name: {
			type: DataTypes.STRING(15),
			allowNull: true
		},
		title: {
			type: DataTypes.STRING(45),
			allowNull: true
		},
		detail: {
			type: DataTypes.STRING(250),
			allowNull: true
		},
	}, {
		tableName: 'record',
		paranoid: true,
		timestamps: true,
		freezeTableName: true,
		createdAt: false,
		updatedAt: 'update_time',
		deletedAt: 'delete_time',
		underscored: true
	});
};
