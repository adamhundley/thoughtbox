class LinksController < ApplicationController
  def index
    @link = Link.new
    @links = current_user.links
  end

  def create
    @link = current_user.links.create(link_params)
    if @link.save
      flash[:success] = "New Link Added!"
      redirect_to links_path
    else
      flash[:info] = "#{@link.errors.full_messages.join(', ')}"
      redirect_to links_path
    end
  end

  def update
    @link = Link.find(params[:id])

    if params[:read]
      @link.update(read: params[:read])
      head :no_content
    else
      attribute = params[:link].keys[0]
      @link.update(attribute => params[:link][attribute])
      head :no_content
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title, :read)
  end
end
