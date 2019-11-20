/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('admin_access', {
		admin_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		},
		access_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		},
		theme_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		}
	}, {
		tableName: 'admin_access',
		timestamps: false,
		freezeTableName: true,
		underscored: true
	});
};
