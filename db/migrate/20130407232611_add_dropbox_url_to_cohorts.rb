class AddDropboxUrlToCohorts < ActiveRecord::Migration
  def change
    add_column :cohorts, :dropbox_url, :string
  end
end
