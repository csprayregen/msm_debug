class DirectorsController < ApplicationController
  def index
    @directors = Director.all
    render("/directors/index.html.erb")
  end

  def show
    @director = Director.find(params[:id])
    render("/directors/show_details.html.erb")
  end

  def new_form

    render("/directors/new_form.html.erb")
  end

  def create_row
    @director = Director.new
    @director.dob = params[:dob]
    @director.name = params[:name]
    @director.bio = params[:bio]
    @director.image_url = params[:image_url]

    @director.save

    render("/directors/show_details")
  end

  def edit_form
    @director = Director.find(params[:id])
    render("/directors/edit_form.html.erb")
  end

  def update_row
    @director = Director.find(params[:id])

    @director.dob = params[:dob]
    @director.name = params[:name]
    @director.bio = params[:bio]
    @director.image_url = params[:image_url]

    @director.save
    redirect_to("/directors/#{@director.id}")
    #{p.id}
  end

  def destroy
    @director = Director.find(params[:id])

    @director.destroy
  end
end
