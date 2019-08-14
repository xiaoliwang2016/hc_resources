/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('admin_role', {
		admin_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		},
		role_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		}
	}, {
		tableName: 'admin_role',
		timestamps: false,
		freezeTableName: true
	});
};
