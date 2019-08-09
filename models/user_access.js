/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('user_access', {
		user_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		},
		access_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		}
	}, {
		tableName: 'user_access',
		timestamps: false,
		freezeTableName: true
	});
};
