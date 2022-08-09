class AnimalCommentsController < ApplicationController

  def create
    animal = Animal.find(params[:animal_id])
    comment = current_user.animal_comments.new(animal_comment_params)
    comment.animal_id = animal.id
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    AnimalComment.find(params[:id]).destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def animal_comment_params
    params.require(:animal_comment).permit(:comment)
  end

end
