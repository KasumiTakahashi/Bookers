class HomesController < ApplicationController
  def top
    @homes = Home.new
  end

end
