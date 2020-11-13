class FoldersController < ApplicationController
  before_action :authorized

  def index
    presenter = FolderPresenter.new Folder.all
    folders = presenter.folders(current_user.id, false, folders_id)
                       .paginate(page: params[:page], per_page: 5)
    render json: {folders: folders,
                  total_page: folders.total_pages}
  end

  def show
    render json: images_url
  end

  def create
    @folder = FoldersForm.new(folder_params.merge!(user_id: current_user.id))
    if @folder.save!
      render json: @folder
    end
  end

  private

  def folder
    Folder.find params[:id]
  rescue ActiveRecord::RecordNotFound
    raise NotFound, errors.add(:folder, :not_found)
  end

  def folders_id
    Invitation.where(recipent_id: current_user.id).pluck(:folder_id)
  end

  def images_url
    images = folder.images
    images.map{|image| url_for(image.picture)}
  end

  def folder_params
    params.require(:folder).permit(:status, :name, :user_id)
  end
end
