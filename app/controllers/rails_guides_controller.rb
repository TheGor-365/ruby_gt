class RailsGuidesController < ApplicationController
  before_action :set_rails_guide, only: %i[ show edit update destroy ]

  def index
    @rails_guides = RailsGuide.all
  end

  def show
  end

  def new
    @rails_guide = RailsGuide.new
  end

  def edit
  end

  def create
    @rails_guide = RailsGuide.new(rails_guide_params)

    respond_to do |format|
      if @rails_guide.save
        format.html { redirect_to rails_guide_url(@rails_guide), notice: "Rails guide was successfully created." }
        format.json { render :show, status: :created, location: @rails_guide }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rails_guide.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @rails_guide.update(rails_guide_params)
        format.html { redirect_to rails_guide_url(@rails_guide), notice: "Rails guide was successfully updated." }
        format.json { render :show, status: :ok, location: @rails_guide }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rails_guide.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rails_guide.destroy

    respond_to do |format|
      format.html { redirect_to rails_guides_url, notice: "Rails guide was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_rails_guide
    @rails_guide = RailsGuide.find(params[:id])
  end

  def rails_guide_params
    params.require(:rails_guide).permit(:title, :author, :description, :body)
  end
end
