class AddExtensionToCentros < ActiveRecord::Migration[5.0]
  def change
    add_column :centros, :extension, :string
  end
end
