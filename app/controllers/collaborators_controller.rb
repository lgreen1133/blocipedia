class CollaboratorsController < ApplicationController
  before_action :get_wiki

  def create
    @collaborator = Collaborator.new(wiki_id: @wiki_id, user_id: params[:user_id])
    if @collaborator.save 
      flash[:notice] = "Collaborator has been added successfully."
      redirect_to edit_wiki_path(@wiki)
    else
      flash[:error] = "There was an error. Please try again."
      render :new 
    end
  end

  def destroy
    @collaborator = Collaborator.find(params[:id])
    if @collaborator.destroy
      flash[:notice] = "Collaborator was removed successfully."
    else
      flash[:error] = "There was an error. Please try again."
    end
    redirect_to edit_wiki_path(@wiki)
  end

  private 

  def get_wiki 
    @wiki = Wiki.find(params[:wiki_id]) 
  end
end