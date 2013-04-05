class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :name
      t.string :start_date
      t.string :group_email
      t.timestamps
    end
  end
end
