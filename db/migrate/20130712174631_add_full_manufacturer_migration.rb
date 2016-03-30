class AddFullManufacturerMigration < ActiveRecord::Migration

  def up
    add_column :product_specs, :manufacture_website, :string, :after => :manufacture_addr
    add_column :product_specs, :manufacture_phone, :string, :after => :manufacture_addr
    add_column :product_specs, :manufacture_email, :string, :after => :manufacture_addr
    add_column :product_specs, :manufacture_zip, :string, :after => :manufacture_addr
    add_column :product_specs, :manufacture_state, :string, :after => :manufacture_addr
    add_column :product_specs, :manufacture_city, :string, :after => :manufacture_addr

    add_column :project_specs, :firm_website, :string, :after => :firm_address
    add_column :project_specs, :firm_phone, :string, :after => :firm_address
    add_column :project_specs, :firm_email, :string, :after => :firm_address
    add_column :project_specs, :firm_zip, :string, :after => :firm_address
    add_column :project_specs, :firm_state, :string, :after => :firm_address
    add_column :project_specs, :firm_city, :string, :after => :firm_address
  end

  def down
    remove_column :product_specs, :manufacture_city
    remove_column :product_specs, :manufacture_state
    remove_column :product_specs, :manufacture_zip
    remove_column :product_specs, :manufacture_email
    remove_column :product_specs, :manufacture_phone
    remove_column :product_specs, :manufacture_website

    remove_column :project_specs, :firm_city
    remove_column :project_specs, :firm_state
    remove_column :project_specs, :firm_zip
    remove_column :project_specs, :firm_email
    remove_column :project_specs, :firm_phone
    remove_column :project_specs, :firm_website
  end

end
