require 'rails_helper'

RSpec.describe "seccion_nombres/index", type: :view do
  before(:each) do
    assign(:seccion_nombres, [
      SeccionNombre.create!(
        :nombre => "Nombre"
      ),
      SeccionNombre.create!(
        :nombre => "Nombre"
      )
    ])
  end

  it "renders a list of seccion_nombres" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
  end
end
