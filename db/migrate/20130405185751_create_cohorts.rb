class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :name
      t.date :start_date
      t.string :email
      t.string :photos_url
      t.string :secret_url
      
      t.timestamps
    end
  end
end
