class ImagesController < ApplicationController
  def create
    upload = ImageForm.new(upload_params.merge!(user_id: current_user.id))
    upload.save!
    response_success I18n.t("success.create_success")
  end

  private

  def upload_params
    params.require(:image_form).permit :user_id, :folder_id,
                                       :title, :extension,
                                       :size, :picture
  end
end
