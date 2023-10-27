class BookmarksController < ApplicationController
  before_action :set_list, only: [:create]
  before_action :set_bookmark, only: [:destroy]

  def create
    @bookmark = @list.bookmarks.new(bookmark_params)

    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  def new
    @bookmark = Bookmark.new
  end

  def show
    @list = List.find(params[:list_id])
    @bookmarks = @list.bookmarks
  end

  def destroy
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list), notice: 'Bookmark was successfully destroyed.'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

end
