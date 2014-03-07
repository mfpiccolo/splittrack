class ReceivablesController < ApplicationController
  def approved_index
    @contacts = current_user.contacts
  end

  def unapproved_index
    @receivables = current_user.receivables
  end

end
