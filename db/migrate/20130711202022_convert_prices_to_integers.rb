class ConvertPricesToIntegers < ActiveRecord::Migration

  def up
    add_column :payments, :price_discount,    :integer, :default => 0, :after => :price_subtotal
    change_column :payments, :price_subtotal, :integer, :default => 0
    change_column :payments, :price_tax,      :integer, :default => 0
    change_column :payments, :price_refund,   :integer, :default => 0
    change_column :payments, :price_total,    :integer, :default => 0
    change_column :orders, :balance_amount,   :integer, :default => 0
  end

  def down
    remove_column :payments, :price_discount
    change_column :payments, :price_subtotal, :string
    change_column :payments, :price_tax,      :string
    change_column :payments, :price_refund,   :string
    change_column :payments, :price_total,    :string
    change_column :orders, :balance_amount,   :string
  end

end
