class FolderPresenter
  def initialize(folder)
    @folder = folder
  end

  def folders user_id, status, id
    @folder.where(status: status).or(@folder.where(user_id: user_id))
                                 .or(@folder.where(id: id))
  end

  def check_owner_folder id
    @folder.user_id.eql? id
  end

  def check_registered_folder id
    @folder.invitations.where(status: true)
                       .pluck(:recipent_id)
                       .include? id
  end

  def folder_authorized? id
    return true if
      @folder.status == false || check_owner_folder(id) || check_registered_folder(id)
  end
end

