class GuideCodesController < ApplicationController
  before_action :set_guide_code, only: %i[ show edit update destroy ]

  def index
    @guide_codes = GuideCode.all
  end

  def show; end
  def edit; end

  def new
    @guide_code = GuideCode.new
    @guide_code.build_lang
  end

  def create
    @guide_code = GuideCode.new(guide_code_params)
    @guide_code.build_lang(guide_code_params)

    respond_to do |format|
      if @guide_code.save
        format.html { redirect_to guide_code_url(@guide_code) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @guide_code.update(guide_code_params)
        format.html { redirect_to guide_code_url(@guide_code) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @guide_code.destroy

    respond_to do |format|
      format.html { redirect_to guide_codes_url }
    end
  end

  private

  def set_guide_code
    @guide_code = GuideCode.find(params[:id])
  end

  def guide_code_params
    params.require(:guide_code).permit(
      :code,
      :description,
      :guide_id,
      :lang_id,
      :_destroy
    )
  end
end
