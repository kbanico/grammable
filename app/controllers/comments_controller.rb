class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @gram = Gram.find_by_id(params[:gram_id])

    return render_not_found if @gram.blank?

    @gram.comments.create(comment_params.merge(user: current_user))
    redirect_to root_path
  end

  # def edit
  #   @gram = Gram.find_by_id(params[:gram_id])
  #   @comment = @gram.comments.find_by_id(params[:id])

  #   return render_not_found(:forbidden) if current_user != @comment.user

  #   return render_not_found if @comment.blank?

  # end

  # def update
  #   @gram = Gram.find_by_id(params[:gram_id])
  #   @comment = @gram.comments.find_by_id(params[:id])


  #   return render_not_found(:forbidden) if current_user != @comment.user

  #   return render_not_found if @comment.blank?

  #   @comment.update_attributes(comment_params)

  #   if @comment.valid?
  #     redirect_to root_path
  #   else
  #     return reder :edit, status: :unprocessable_entity
  #   end

  # end


  private
  def comment_params
    params.require(:comment).permit(:message)
  end


end
