class MainController < ApplicationController
  before_action :is_main_authenticated?
  
  def index
  end
end
