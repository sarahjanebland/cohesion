class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :cohort_id
      t.integer :github_uid
      t.string :github_token
      t.string :first_name
      t.string :last_name
      t.string :nickname
      t.string :email
      t.string :session_token
      t.string :phone
      t.string :company
      t.string :location
      t.string :advice
      t.string :restaurant
      t.string :photo_url
      t.string :website_url
      t.string :blog_url
      t.string :provider
      t.string :facebook_url
      t.string :twitter_url
      t.string :github_url

      t.timestamps
    end
  end
end
