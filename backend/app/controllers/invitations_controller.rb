class InvitationsController < ApplicationController
  before_action :invitation, only: %i(update destroy)

  def index
    invitations = current_user.invitation_as_recipent
                              .invitation_status false
    render json: invitations
  end

  def update
    invitation.update status: true
  end

  def destroy
    invitation.destroy
  end

  private

  def invitation
    Invitation.find params[:id]
  end
end
