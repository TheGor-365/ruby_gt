class TutorialCodesController < ApplicationController
  before_action :set_tutorial_code, only: %i[ show edit update destroy ]

  def index
    @tutorial_codes = TutorialCode.all
  end

  def show; end
  def edit; end

  def new
    @tutorial_code = TutorialCode.new
    @tutorial_code.build_lang
  end

  def create
    @tutorial_code = TutorialCode.new(tutorial_code_params)
    respond_to do |format|
      if @tutorial_code.save
        format.html { redirect_to tutorial_code_url(@tutorial_code) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @tutorial_code.update(tutorial_code_params)
        format.html { redirect_to tutorial_code_url(@tutorial_code) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @tutorial_code.destroy
    respond_to do |format|
      format.html { redirect_to tutorial_codes_url }
    end
  end

  private

  def set_tutorial_code
    @tutorial_code = TutorialCode.find(params[:id])
  end

  def tutorial_code_params
    params.require(:tutorial_code).permit(
      :title,
      :overview,
      :code,
      :description,
      :path,
      :lang_id,
      :tutorial_id,
      :_destroy
    )
  end
end
