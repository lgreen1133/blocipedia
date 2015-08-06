class CollaboratorsController < ApplicationController
  # before_action :get_wiki

  # def new
  #   @collaborator = Collaborator.new
  # end

  def create
    @wiki = Wiki.find(params[:wiki_id])
    @collaborators = @wiki.collaborators

    @collaborator = current_user.collaborators.build(collaborator_params)
    @collaborator.wiki = @wiki 
    @new_collaborator = Collaborator.new

    authorize @collaborator 

    if @collaborator.save 
      flash[:notice] = "Collaborator has been added successfully."
      # redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "There was an error. Please try again."
      # render :new 
    end

    respond_to do |format| 
      format.html
      format.js
    end
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.find(params[:id])

    authorize @collaborator
    
    if @collaborator.destroy
      flash[:notice] = "Collaborator was removed successfully."
    else
      flash[:error] = "There was an error. Please try again."
    end
    # redirect_to edit_wiki_path(@wiki)

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
    params.require(:collaborator).permit(:user_id)
  end
end