class WikisController < ApplicationController
  def index
    @wikis = policy_scope(Wiki).paginate(page: params[:page], per_page: 5)
    authorize @wikis 
  end

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki 
  end

  def new
    @wiki = Wiki.new 
    authorize @wiki
  end

  def create
    @wiki = current_user.wikis.build(wiki_params)
    if current_user.role == 'premium' || current_user.role == 'admin'
     @wiki.public = false
    else
     @wiki.public = true
    end 
    authorize @wiki

    if @wiki.save
      flash[:notice] = "Wiki was saved successfully."
      redirect_to @wiki 
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
    @users = User.all 
    authorize @wiki
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki

    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Wiki was updated successfully."
      redirect_to @wiki 
    else
      flash[:error] = "There was an error. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash[:error] = "There was an error deleting the wiki. Please try again."
      render :show
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:title, :body, :public)
  end
end
