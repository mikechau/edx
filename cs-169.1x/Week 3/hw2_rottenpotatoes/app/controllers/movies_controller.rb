class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index

    if (params[:sort_by].blank? && params[:ratings].blank? && ! session[:sort_by].blank?)
      flash.keep
      redirect_to :sort_by => session[:sort_by], :ratings => session[:ratings]
    end
    @sort_by = params[:sort_by] ? params[:sort_by] : 'id'
    @all_ratings = Movie.select("DISTINCT rating").map(&:rating)
    @selected_ratings = params[:ratings] ? params[:ratings].respond_to?('keys') ? params[:ratings].keys : params[:ratings] : @all_ratings
    session[:sort_by] = @sort_by
    session[:ratings] = @selected_ratings
    @movies = Movie.where({:rating => @selected_ratings}).find(:all, :order => @sort_by)
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
