class ReceivablesController < ApplicationController
  def index
    @receivables = current_user.receivables
  end
end
