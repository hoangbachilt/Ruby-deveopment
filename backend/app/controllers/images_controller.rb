class ImagesController < ApplicationController
  before_action :image, only: %i(update destroy)

  def create
    if check_create_authozied
      upload = ImageForm.new(upload_params.merge!(user_id: current_user.id))
      upload.save!
      response_success I18n.t("success.create_success")
    else
      raise Authorized, I18n.t("folder.not_authorized")
    end
  end

  def update
    image.update upload_params.merge!(user_id: current_user.id)
  end

  def destroy
    image.destroy
  end

  private

  def upload_params
    params.require(:image_form).permit :user_id, :folder_id,
                                       :title, :extension,
                                       :size, :picture
  end

  def check_create_authozied
    presenter = FolderPresenter.new Folder.find(params[:image_form][:folder_id])
    presenter.folder_authorized? current_user.id
  end

  def image
    Image.find(params[:id])
  end
end
