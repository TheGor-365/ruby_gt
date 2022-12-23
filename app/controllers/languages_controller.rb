class LanguagesController < ApplicationController
  before_action :set_language, only: %i[ show edit update destroy ]

  def index
    @languages = Language.all
  end

  def show; end
  def edit; end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(language_params)

    respond_to do |format|
      if @language.save
        format.html { redirect_to language_url(@language) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @language.update(language_params)
        format.html { redirect_to language_url(@language) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @language.destroy
    respond_to do |format|
      format.html { redirect_to languages_url }
    end
  end

  private

  def set_language
    @language = Language.find(params[:id])
  end

  def language_params
    params.require(:language).permit(
      :name
    )
  end
end
