class FoldersController < ApplicationController
  def index
    folders = current_user.folders
    render json: folders
  end

  def show
    render json: images_url
  end

  private

  def folder
    Folder.find params[:id]
  rescue ActiveRecord::RecordNotFound
    raise NotFound, errors.add(:folder, :not_found)
  end

  def images_url
    images = folder.images
    images.map{|image| url_for(image.picture)}
  end
end
