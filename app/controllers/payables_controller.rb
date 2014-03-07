class PayablesController < ApplicationController
  def approved_index
    @payables = current_user.payables.approved
  end

  def unapproved_index
    @payables = current_user.payables.unapproved
  end

end
