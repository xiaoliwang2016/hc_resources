/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('role_resources', {
		resources_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		},
		role_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		}
	}, {
		tableName: 'role_resources',
		timestamps: false,
		freezeTableName: true,
		underscored: true
	});
};
