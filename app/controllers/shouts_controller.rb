class ShoutsController < ApplicationController
  def index
    @text_subject = TextSubject.new
    @timeline = current_user.timeline
  end
end
