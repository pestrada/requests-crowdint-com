class HomeController < ApplicationController
  def show
    @submitted = Request.submitted
    @promoted  = Request.processed
  end
end
