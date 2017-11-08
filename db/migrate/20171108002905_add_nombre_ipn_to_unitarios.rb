class AddNombreIpnToUnitarios < ActiveRecord::Migration[5.0]
  def change
    add_column :unitarios, :nombre_ipn, :string
  end
end
