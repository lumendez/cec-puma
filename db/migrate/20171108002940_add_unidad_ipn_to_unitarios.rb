class AddUnidadIpnToUnitarios < ActiveRecord::Migration[5.0]
  def change
    add_column :unitarios, :unidad_ipn, :string
  end
end
