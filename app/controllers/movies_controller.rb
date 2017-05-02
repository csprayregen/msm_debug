class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new_form
    render("/movies/new_form.html.erb")
  end

  def create_row
    m = Movie.new
    m.title = params[:title]
    m.year = params[:year]
    m.duration = params[:duration]
    m.description = params[:description]
    m.image_url = params[:image_url]
    m.director_id = params[:director_id]
    m.save

    redirect_to("/movies")

  end

  def edit_form
    @movie = Movie.find(params[:id])
    render("movies/edit_form.html.erb")
  end

  def update_row
    @movie = Movie.find(params[:id])
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]
    @movie.save

    render("/movies/show.html.erb")
  end

  def destroy
    @movie = Movie.find(params[:id])

    @movie.destroy
    render("/movies/destroy.html.erb"    )
  end
end
