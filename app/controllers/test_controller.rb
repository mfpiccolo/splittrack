class TestController < ApplicationController

  def new
    respond_to do |format|
      format.html {render :layout => 'test_app'}
    end
  end

end
