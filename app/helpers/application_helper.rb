module ApplicationHelper
  #Utiliza o gavatar do jovem na aplicação
  def gravatar_for(user, options = { size: 88})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    #Tamanho da imagem
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "img-circle")
  end
end
