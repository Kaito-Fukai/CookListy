class Admin::RootController < ApplicationController
  before_action :authenticate_administrator!

  def top
  end
end
