require 'rails_helper'

RSpec.describe "unitarios/new", type: :view do
  before(:each) do
    assign(:unitario, Unitario.new(
      :curp => "MyString",
      :nombre => "MyString",
      :paterno => "MyString",
      :materno => "MyString",
      :sexo => "MyString",
      :nacimiento => "MyString",
      :domicilio => "MyString",
      :codigo_postal => "MyString",
      :entidad => "MyString",
      :delegacion_municipio => "MyString",
      :telefono_celular => "MyString",
      :telefono_fijo => "MyString",
      :correo => "MyString",
      :procedencia => "MyString",
      :nombre_padre => "MyString",
      :correo_padre => "MyString",
      :telefono_padre => "MyString"
    ))
  end

  it "renders new unitario form" do
    render

    assert_select "form[action=?][method=?]", unitarios_path, "post" do

      assert_select "input#unitario_curp[name=?]", "unitario[curp]"

      assert_select "input#unitario_nombre[name=?]", "unitario[nombre]"

      assert_select "input#unitario_paterno[name=?]", "unitario[paterno]"

      assert_select "input#unitario_materno[name=?]", "unitario[materno]"

      assert_select "input#unitario_sexo[name=?]", "unitario[sexo]"

      assert_select "input#unitario_nacimiento[name=?]", "unitario[nacimiento]"

      assert_select "input#unitario_domicilio[name=?]", "unitario[domicilio]"

      assert_select "input#unitario_codigo_postal[name=?]", "unitario[codigo_postal]"

      assert_select "input#unitario_entidad[name=?]", "unitario[entidad]"

      assert_select "input#unitario_delegacion_municipio[name=?]", "unitario[delegacion_municipio]"

      assert_select "input#unitario_telefono_celular[name=?]", "unitario[telefono_celular]"

      assert_select "input#unitario_telefono_fijo[name=?]", "unitario[telefono_fijo]"

      assert_select "input#unitario_correo[name=?]", "unitario[correo]"

      assert_select "input#unitario_procedencia[name=?]", "unitario[procedencia]"

      assert_select "input#unitario_nombre_padre[name=?]", "unitario[nombre_padre]"

      assert_select "input#unitario_correo_padre[name=?]", "unitario[correo_padre]"

      assert_select "input#unitario_telefono_padre[name=?]", "unitario[telefono_padre]"
    end
  end
end
