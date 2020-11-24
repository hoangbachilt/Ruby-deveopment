class FolderPresenter
  def initialize(folder)
    @folder = folder
  end

  def folders user_id, status, id
    @folder.where(status: status).or(@folder.where(user_id: user_id))
                                 .or(@folder.where(id: id))
  end
end
