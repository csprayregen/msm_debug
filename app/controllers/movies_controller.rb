class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[id])
  end

  def new_form
    render("/movies/new_form.html.erb")
  end

  def create_row
    @movies.title = params[:the_title]
    @movies.year = params[:the_year]
    @movies.duration = params[:the_duration]
    @movies.description = params[:the_description]
    @movies.image_url = params[:the_image_url]
    @movies.director_id = params[:the_director_id]

    @movies.save

    render("show")
  end

  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]

    render("show")
  end

  def destroy
    movie = Movie.find(params[:id])

    movie.destroy
  end
end
