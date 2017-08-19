module LikesHelper
  def get_like_button_icon(liked)
    liked ? "thumbs-down" : "thumbs-up"
  end

  def get_like_button_classes(liked)
    classes = "level-item button is-white"
    classes << " is-liked" if liked
    classes
  end

  def get_like_button_text(liked)
    liked ? "Unlike" : "Like"
  end
  def get_like_button_classes_small(liked)
    liked ? "thumbs-down is-small" : "thumbs-up is-small"
  end
end
