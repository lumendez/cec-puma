class AddColumnasToGrupos < ActiveRecord::Migration[5.0]
  def change
    add_column :grupos, :lugar, :string
    add_column :grupos, :fecha, :string
    add_column :grupos, :centro, :string
    add_column :grupos, :tipo, :string
    add_column :grupos, :modalidad, :string
    add_column :grupos, :cupo, :string
    add_column :grupos, :duracion, :string
    add_column :grupos, :cuota, :string
    add_column :grupos, :clave, :string
    add_column :grupos, :proyecto, :string
    add_column :grupos, :institucion_bancaria, :string
    add_column :grupos, :cuenta, :string
    add_column :grupos, :titular, :string
    add_column :grupos, :instructor, :string
    add_column :grupos, :instructor_rfc, :string
    add_column :grupos, :instructor_correo, :string
    add_column :grupos, :jefe_ec, :string
  end
end
