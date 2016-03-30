class AddUserFileUrlToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :user_file_url, :string
  end
end
