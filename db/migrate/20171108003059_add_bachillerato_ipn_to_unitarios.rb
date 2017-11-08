class AddBachilleratoIpnToUnitarios < ActiveRecord::Migration[5.0]
  def change
    add_column :unitarios, :bachillerato_ipn, :string
  end
end
