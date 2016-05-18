module UsersHelper

  def current_user
    @current_user ||= User.new(name: 'Guess', email: 'victor@rodriguezortega.com')
  end

  def gravatar_for(user, options = {})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size] || 80
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

end
