class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :cohort_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :session_token
      t.string :phone
      t.string :job
      t.string :city
      t.string :advice_tweet
      t.string :fav_restaurant
      t.string :github_username
      t.string :url
      t.string :blog
      t.string :provider
      t.integer :uid
      t.string :name
      t.string :photo_url

      t.timestamps
    end
  end
end
