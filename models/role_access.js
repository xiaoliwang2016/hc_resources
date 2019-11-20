/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('role_access', {
		role_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		},
		access_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		}
	}, {
		tableName: 'role_access',
		timestamps: false,
		freezeTableName: true,
		underscored: true
	});
};
