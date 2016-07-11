class PagesController < ApplicationController
  def index
  end

  def about
  end

  def pricing
  end

  def contact
    redirect_to new_visitor_path
  end
end
