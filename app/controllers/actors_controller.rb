class ActorsController < ApplicationController
  def index
    @actors = Actor.all

    render("actors/index.html.erb")
  end

  def show
    @actor = Actor.find(params[:id])
    @movie_ids = []
    @characters = Character.where(actor_id: @actor.id)
    @characters.each do |character|
      tmp_movie_id = character.movie_id
      @movie_ids << tmp_movie_id
    end
    @movies = Movie.find(@movie_ids)
    
    render("actors/show.html.erb")
  end

  def new
    @actor = Actor.new

    render("actors/new.html.erb")
  end

  def create
    @actor = Actor.new

    @actor.name = params[:name]
    @actor.dob = params[:dob]
    @actor.bio = params[:bio]
    @actor.image_url = params[:image_url]

    save_status = @actor.save

    if save_status == true
      redirect_to("/actors/#{@actor.id}", :notice => "Actor created successfully.")
    else
      render("actors/new.html.erb")
    end
  end

  def edit
    @actor = Actor.find(params[:id])

    render("actors/edit.html.erb")
  end

  def update
    @actor = Actor.find(params[:id])

    @actor.name = params[:name]
    @actor.dob = params[:dob]
    @actor.bio = params[:bio]
    @actor.image_url = params[:image_url]

    save_status = @actor.save

    if save_status == true
      redirect_to("/actors/#{@actor.id}", :notice => "Actor updated successfully.")
    else
      render("actors/edit.html.erb")
    end
  end

  def destroy
    @actor = Actor.find(params[:id])

    @actor.destroy

    if URI(request.referer).path == "/actors/#{@actor.id}"
      redirect_to("/", :notice => "Actor deleted.")
    else
      redirect_to(:back, :notice => "Actor deleted.")
    end
  end
end
