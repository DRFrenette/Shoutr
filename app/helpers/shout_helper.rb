module ShoutHelper
  def avatar(email)
    hashed_email = Digest::MD5.hexdigest(email)
    image_tag "http://gravatar.com/avatar/#{hashed_email}"
  end
end
