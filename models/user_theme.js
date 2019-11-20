/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('user_theme', {
		user_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			primaryKey: true
		},
		theme_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			primaryKey: true
		},
		status: {
			type: DataTypes.INTEGER(1),
			allowNull: true,
			defaultValue: '1'
		}
	}, {
		tableName: 'user_theme',
		timestamps: false,
		freezeTableName: true,
		underscored: true
	});
};
