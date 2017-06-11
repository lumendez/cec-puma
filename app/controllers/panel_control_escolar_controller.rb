class PanelControlEscolarController < ApplicationController
  before_action :authenticate_user!
  authorize_resource class: :panel_control_escolar

  def index
  end

end
