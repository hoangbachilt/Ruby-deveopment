class FoldersController < ApplicationController
  def index
    presenter = FolderPresenter.new Folder.all
    folders = presenter.folders(current_user.id, false, folders_id)
                       .paginate(page: params[:page], per_page: 5)
    render json: {folders: folders,
                  total_page: folders.total_pages}
  end

  private

  def folders_id
    Invitation.where(recipent_id: current_user.id).pluck(:folder_id)
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
