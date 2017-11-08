class AddParentescoIpnToUnitarios < ActiveRecord::Migration[5.0]
  def change
    add_column :unitarios, :parentesco_ipn, :string
  end
end
