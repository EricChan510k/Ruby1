class ModifyContactName < ActiveRecord::Migration

  def up
    rename_column :contacts, :name, :first_name
    add_column :contacts, :last_name, :string, :after => :first_name
  end

  def down
    remove_column :contacts, :last_name
    rename_column :contacts, :first_name, :name
  end

end
