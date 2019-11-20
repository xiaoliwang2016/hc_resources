/* jshint indent: 1 */

module.exports = function(sequelize, DataTypes) {
	return sequelize.define('verify_account', {
		id: {
			type: DataTypes.INTEGER(11),
			allowNull: false,
			primaryKey: true,
			autoIncrement: true
		},
		account: {
			type: DataTypes.STRING(45),
			allowNull: false
		},
		password: {
			type: DataTypes.STRING(45),
			allowNull: true
		},
		admin_id: {
			type: DataTypes.INTEGER(11),
			allowNull: true
		},
		theme_id: {
			type: DataTypes.INTEGER(11),
			allowNull: false
		}
	}, {
		tableName: 'verify_account',
		timestamps: false,
		freezeTableName: true,
		underscored: true
	});
};
