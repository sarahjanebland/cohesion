class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :cohort_id
      t.integer :github_uid
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :session_token
      t.string :phone
      t.string :job
      t.string :location
      t.string :advice_tweet
      t.string :fav_restaurant
      t.string :nickname
      t.string :url
      t.string :blog
      t.string :provider
      t.string :photo_url
      t.string :github_token
      t.string :facebook
      t.string :twitter

      t.timestamps
    end
  end
end
