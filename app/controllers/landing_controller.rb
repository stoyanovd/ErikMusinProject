class LandingController < ActionController::Base

  def index
    render layout: "without_menu"
  end

  def contacts
    render layout: "contacts_layout"
  end
  
  def about
    render layout: "contacts_layout"
  end


end