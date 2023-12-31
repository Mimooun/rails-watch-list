class BookmarksController < ApplicationController
  before_action :find_list, only: [:index, :new, :create, :show]
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end



  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end


  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end


  private

  def find_list
    @list = List.find(params[:list_id])
  end


  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
