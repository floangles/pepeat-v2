class CommentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.new_comment.subject
  #
  def new_comment(comment_id)
    @comment = Comment.find(comment_id)
    mail(to: @comment.meal.user.email, subject: "#{@comment.meal.user.firstname}, #{@comment.user.firstname} a une question concernant ton menu")
  end

  def new_answer(comment_id)
    @comment = Comment.find(comment_id)
    @comment.meal.comments.each do |comment|
      if comment.user.id != comment.meal.user.id
        mail(to: comment.user.email, subject: "#{@comment.meal.user.firstname} a posté une information sur le menu #{comment.meal.title}")
      end
    end
  end

end
