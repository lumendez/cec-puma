class ModuloDiplomado < ApplicationRecord
  belongs_to :diplomado, optional: true

  def instructor
    id = self.instructor_id
    instructor = User.find_by(id: id).nombre_paterno_materno
  end
end
