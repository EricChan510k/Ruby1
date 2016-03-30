class AddCompleteBooleanToOrder < ActiveRecord::Migration

  def change
    add_column :orders, :completed, :boolean, :default => false, :after => :token_key
  end

end
