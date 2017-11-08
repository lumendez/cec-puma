class AddFamiliarIpnToUnitarios < ActiveRecord::Migration[5.0]
  def change
    add_column :unitarios, :familiar_ipn, :boolean
  end
end
