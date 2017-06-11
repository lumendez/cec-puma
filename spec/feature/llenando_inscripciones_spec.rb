require 'rails_helper.rb'

feature 'Llenando inscripciones' do
  scenario 'Puede crear una solicitud de inscripcion' do
    visit '/inscripcion_registros/new'
    within "div.form-group.col-sm-4" do
      select 'Inglés básico 2 | 07:00-09:00 | Intensivo', from:'Grupos'
    end
  end
end
