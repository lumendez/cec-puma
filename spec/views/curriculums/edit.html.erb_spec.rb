require 'rails_helper'

RSpec.describe "curriculums/edit", type: :view do
  before(:each) do
    @curriculum = assign(:curriculum, Curriculum.create!(
      :calle => "MyString",
      :colonia => "MyString",
      :municipui => "MyString",
      :entidad => "MyString",
      :correo => "MyString",
      :telefono => "MyString",
      :celular => "MyString",
      :lugar => "MyString"
    ))
  end

  it "renders the edit curriculum form" do
    render

    assert_select "form[action=?][method=?]", curriculum_path(@curriculum), "post" do

      assert_select "input#curriculum_calle[name=?]", "curriculum[calle]"

      assert_select "input#curriculum_colonia[name=?]", "curriculum[colonia]"

      assert_select "input#curriculum_municipui[name=?]", "curriculum[municipui]"

      assert_select "input#curriculum_entidad[name=?]", "curriculum[entidad]"

      assert_select "input#curriculum_correo[name=?]", "curriculum[correo]"

      assert_select "input#curriculum_telefono[name=?]", "curriculum[telefono]"

      assert_select "input#curriculum_celular[name=?]", "curriculum[celular]"

      assert_select "input#curriculum_lugar[name=?]", "curriculum[lugar]"
    end
  end
end
