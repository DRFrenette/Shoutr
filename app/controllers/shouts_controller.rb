class ShoutsController < ApplicationController
  def index
    @text_subject = TextSubject.new
    @image_subject = ImageSubject.new
    @timeline = current_user.timeline.page(params[:page]).per(10)
  end
end
