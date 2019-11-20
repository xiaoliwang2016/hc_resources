/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('user_resources', {
		user_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		},
		resources_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		}
	}, {
		tableName: 'user_resources',
		timestamps: false,
		freezeTableName: true,
		underscored: true
	});
};
