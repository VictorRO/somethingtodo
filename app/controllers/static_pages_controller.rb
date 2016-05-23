class StaticPagesController < ApplicationController
  layout 'marketing'

  skip_before_action :authenticate_user!

  def home
  end

  def about
  end
end
