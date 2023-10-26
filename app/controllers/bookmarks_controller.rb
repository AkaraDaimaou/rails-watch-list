class BookmarksController < ApplicationController
  before_action :find_movie_and_list, only: [:create]

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to @movie, notice: 'Bookmark was successfully created.'
    else
      render 'movies/show'
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
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.find(params[:id])

    if @bookmark.destroy
      redirect_to list_path(@list), notice: 'Bookmark was successfully deleted.'
    else
      redirect_to list_path(@list), alert: 'Failed to delete bookmark.'
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end

  def find_movie_and_list
    @movie = Movie.find(params[:bookmark][:movie_id])
    @list = List.find(params[:bookmark][:list_id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Movie or List not found."
    redirect_to root_path
  end

end
