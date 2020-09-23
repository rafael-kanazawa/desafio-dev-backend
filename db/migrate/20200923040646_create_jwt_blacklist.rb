class CreateJwtBlacklist < ActiveRecord::Migration[5.1]
  def change
    create_table :jwt_blacklists do |t|
      t.string :jti, null: false
    end
    add_index :jwt_blacklist, :jti
  end
end
