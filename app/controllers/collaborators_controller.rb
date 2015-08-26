class CollaboratorsController < ApplicationController
  # before_action :get_wiki

  def new
    @wiki = Wiki.find(params[:id])
    @collaborator = Collaborator.new
    authorize @collaborator
  end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.build(collaborator_params)
    @collaborators = User.all 
    @new_collaborator = Collaborator.new

    # authorize @collaborator 

    if @collaborator.save 
      flash[:notice] = "Collaborator has been added successfully."
    else
      flash[:error] = "There was an error. Please try again."
    end

    respond_to do |format| 
      format.html
      format.js
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.find(params[:id])

    # authorize @collaborator
    
    if @collaborator.destroy
      flash[:notice] = "Collaborator was removed successfully."
    else
      flash[:error] = "There was an error. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private 

  # def get_wiki 
  #   @wiki = Wiki.find(params[:wiki_id]) 
  # end

  def collaborator_params
    params.require(:collaborator).permit(:wiki_id, :user_id)
  end
end