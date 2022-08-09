class FavoritesController < ApplicationController

  def create
    animal = Animal.find(params[:animal_id])
    favorite = current_user.favorites.new(animal_id: animal.id)
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    animal = Animal.find(params[:animal_id])
    favorite = current_user.favorites.find_by(animal_id: animal.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end

end
