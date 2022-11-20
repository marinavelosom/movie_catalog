class ActorsController < ApplicationController
  before_action :set_actor, only: %i[ show edit update destroy ]

  def index
    @actors = Actor.all
  end

  def show
  end

  def new
    @actor = Actor.new
  end

  def edit
  end

  def create
    @actor = Actor.new(actor_params)

    respond_to do |format|
      if @actor.save
        format.html { redirect_to actor_url(@actor), notice: "Actor was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @actor.update(actor_params)
        format.html { redirect_to actor_url(@actor), notice: "Actor was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @actor.destroy

    respond_to do |format|
      format.html { redirect_to actors_url, notice: "Actor was successfully destroyed." }
    end
  end

  private
    def set_actor
      @actor = Actor.find(params[:id])
    end

    def actor_params
      params.require(:actor).permit(:name, :birth_year, :email)
    end
end
