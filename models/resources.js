/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('resources', {
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
		theme_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		},
		menu_title: {
			type: DataTypes.STRING(50),
			allowNull: false
		},
		type: {
			type: DataTypes.INTEGER(6),
			allowNull: false
		},
		status: {
			type: DataTypes.INTEGER(1),
			allowNull: true,
			defaultValue: '1'
		},
		public: {
			type: DataTypes.INTEGER(1),
			allowNull: true,
			defaultValue: '0'
		},
		user_id: {
			type: DataTypes.INTEGER(11),
			allowNull: true
		},
		resources_order: {
			type: DataTypes.INTEGER(6),
			allowNull: true,
			defaultValue: '0'
		},
		open_type: {
			type: DataTypes.INTEGER(11),
			allowNull: true,
			defaultValue: '0'
		},
		remark: {
			type: DataTypes.STRING(50),
			allowNull: true
		},
	}, {
		tableName: 'resources',
		paranoid: true,
		timestamps: true,
		freezeTableName: true,
		createdAt: false,
		updatedAt: 'update_time',
		deletedAt: 'delete_time'
	});
};
