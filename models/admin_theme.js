/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('admin_theme', {
		admin_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		},
		theme_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		}
	}, {
		tableName: 'admin_theme',
		timestamps: false,
		freezeTableName: true
	});
};