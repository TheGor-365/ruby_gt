class LangsController < ApplicationController
  before_action :set_lang, only: %i[ show edit update destroy ]

  def index
    @langs = Lang.all
  end

  def show; end
  def edit; end

  def new
    @lang = Lang.new
    @lang.guide_codes.build
  end

  def create
    @lang = Lang.new(lang_params)

    respond_to do |format|
      if @lang.save
        format.html { redirect_to lang_url(@lang) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @lang.update(lang_params)
        format.html { redirect_to lang_url(@lang) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @lang.destroy

    respond_to do |format|
      format.html { redirect_to langs_url }
    end
  end

  private

  def set_lang
    @lang = Lang.find(params[:id])
  end

  def lang_params
    params.require(:lang).permit(:name)
  end
end
