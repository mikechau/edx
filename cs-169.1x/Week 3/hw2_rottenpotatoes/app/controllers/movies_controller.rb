class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index

    @all_ratings = Movie.select("DISTINCT rating").map(&:rating)

    @selected_ratings = params[:ratings] ? params[:ratings].respond_to?('keys') ? params[:ratings].keys : params[:ratings] : @all_ratings

    movies_scope = Movie

    movies_scope = movies_scope.send(:where, { :rating => @selected_ratings }) unless params[:ratings].nil?

    movies_scope = movies_scope.send(:find, :all, :order => params[:sort]) unless params[:sort].nil?

    if params[:sort].nil? && params[:ratings].nil?
      movies_scope = movies_scope.send(:all)
    end

    @movies = movies_scope
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
