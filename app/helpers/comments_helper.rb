module CommentsHelper
  def nested_comments(comment)
    comment.children.map do |comment, sub_comments|
      render(comment)
    end.join.html_safe
  end
end
