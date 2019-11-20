/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('user_role', {
		user_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		},
		role_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		}
	}, {
		tableName: 'user_role',
		timestamps: false,
		freezeTableName: true,
		underscored: true
	});
};
