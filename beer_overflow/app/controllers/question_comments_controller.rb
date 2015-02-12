class QuestionCommentsController < ApplicationController
  before_action :set_comment, only: [:show, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  def new
    @question = Question.find(params[:question_id])
    @question_comment = Comment.new
  end

  def create
    # If we were to do this in the commentsController which doesn't exist
    # in params we'd have maybe a hidden field of type: "Question"
    #
    # And then we could do something like parent = params[:type].constantize
    # parent.comments.create(params[:comment])
    @question_comment = Comment.new question_comment_params
    question = @question_comment.parent
    @question_comment.author = current_user
    if @question_comment.save
      redirect_to question
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @question_comment.destroy
  end

 def upvote
  @question_comment = Comment.find(params[:id])
  @vote = Vote.new(user: current_user, votable_id: @question_comment.id, votable_type: "Comment", liked: true)
  unless @vote.save
    db_vote = Vote.where(user_id: current_user.id, votable_id: @question_comment.id, votable_type: "Comment")[0]
    db_vote.update(liked: true)
  end
  redirect_to :back
end

def downvote
  @question_comment = Comment.find(params[:id])
  @vote = Vote.new(user: current_user, votable_id: @question_comment.id, votable_type: "Comment", liked: false)
  unless @vote.save
    db_vote = Vote.where(user_id: current_user.id, votable_id: @question_comment.id, votable_type: "Comment")[0]
    db_vote.update(liked: false)
  end
  redirect_to :back
end

  private

  def set_comment
    @question_comment = Comment.find(params[:id])
  end

  def question_comment_params
    params.require(:comment).permit(:content, :parent_id, :parent_type)
  end

end
