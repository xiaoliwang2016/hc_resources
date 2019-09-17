/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('link', {
		id: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		resources_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		},
		url: {
			type: DataTypes.STRING(250),
			allowNull: false
		},
		origin: {
			type: DataTypes.STRING(50),
			allowNull: true
		},
		verify: {
			type: DataTypes.INTEGER(1),
			allowNull: true,
			defaultValue: '0'
		},
		verify_account: {
			type: DataTypes.STRING(50),
			allowNull: true
		}
	}, {
		tableName: 'link',
		timestamps: false,
		freezeTableName: true
	});
};
