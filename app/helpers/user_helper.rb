module UserHelper
  def avatar(name, avatars)
    return avatars.select {|img| img.include? name }.first if name && avatars.length
    return "https://dt8kf6553cww8.cloudfront.net/static/images/preview_fail-vfloJ3Dyo.png"
  end
end
