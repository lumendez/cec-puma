require 'rails_helper'

RSpec.describe "curriculums/new", type: :view do
  before(:each) do
    assign(:curriculum, Curriculum.new(
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

  it "renders new curriculum form" do
    render

    assert_select "form[action=?][method=?]", curriculums_path, "post" do

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
