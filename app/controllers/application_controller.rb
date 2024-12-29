class ApplicationController < ActionController::Base
  def set_current_sprint
  	@sprint = Sprint.is_active.last
  end
end
