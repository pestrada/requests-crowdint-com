class HomeController < ApplicationController
  def show
    @submitted = Request.submitted
    @promoted  = Request.processed
    @completed = Request.done.limit(30)
    @rejected = Request.rejected.limit(30)
  end
end
