class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.references :user

      t.timestamps
    end
    add_index :admins, :user_id
  end
end
