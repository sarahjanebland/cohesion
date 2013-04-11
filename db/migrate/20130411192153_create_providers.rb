class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.references :user
      t.string :name
      t.string :token
      t.string :secret

      t.timestamps
    end
    add_index :providers, :user_id
  end
end
