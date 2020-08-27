module UsersHelper
  def profile_picture(user, width = 100)
    image_path = "placeholder-profile.jpg"
    image_tag(image_path, width: width, class: "img-circle m-r-10 rounded-circle")
  end
end
