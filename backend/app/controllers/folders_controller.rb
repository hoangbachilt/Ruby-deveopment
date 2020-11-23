class FoldersController < ApplicationController
  def index
    folders = current_user.folders
    render json: folders
  end
end
