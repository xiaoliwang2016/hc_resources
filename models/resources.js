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
		url: {
			type: DataTypes.STRING(250),
			allowNull: true
		},
		back_url: {
			type: DataTypes.STRING(250),
			allowNull: true
		},
		type: {
			type: DataTypes.INTEGER(6),
			allowNull: false
		},
		status: {
			type: DataTypes.INTEGER(1),
			allowNull: false,
			defaultValue: '1'
		},
		public: {
			type: DataTypes.INTEGER(1),
			allowNull: false,
			defaultValue: '0'
		},
		user_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		},
		resources_order: {
			type: DataTypes.INTEGER(6),
			allowNull: false,
			defaultValue: '0'
		},
		open_type: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			defaultValue: '0'
		},
		origin: {
			type: DataTypes.STRING(50),
			allowNull: true
		},
		back_origin: {
			type: DataTypes.STRING(30),
			allowNull: true
		},
		verify: {
			type: DataTypes.INTEGER(4),
			allowNull: false,
			defaultValue: '0'
		},
		verify_id: {
			type: DataTypes.STRING(30),
			allowNull: true
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
