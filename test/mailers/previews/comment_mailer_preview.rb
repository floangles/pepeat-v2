class CommentMailerPreview < ActionMailer::Preview

  def new_comment
    comment = Comment.first
    CommentMailer.new_comment(comment.id)
  end

  def new_answer
    comment = Comment.first
    CommentMailer.new_answer(comment.id)
  end

end
