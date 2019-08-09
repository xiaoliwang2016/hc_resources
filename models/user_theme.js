/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('user_theme', {
		user_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		},
		theme_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		}
	}, {
		tableName: 'user_theme',
		timestamps: false,
		freezeTableName: true
	});
};
