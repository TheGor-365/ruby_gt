class TemplateCodesController < ApplicationController
  before_action :set_template_code, only: %i[ show edit update destroy ]

  def index
    @template_codes = TemplateCode.all
  end

  def show; end
  def edit; end

  def new
    @template_code = TemplateCode.new
    @template_code.build_lang
  end

  def create
    @template_code = TemplateCode.new(template_code_params)
    respond_to do |format|
      if @template_code.save
        format.html { redirect_to template_code_url(@template_code) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @template_code.update(template_code_params)
        format.html { redirect_to template_code_url(@template_code) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @template_code.destroy
    respond_to do |format|
      format.html { redirect_to template_codes_url }
    end
  end

  private

  def set_template_code
    @template_code = TemplateCode.find(params[:id])
  end

  def template_code_params
    params.require(:template_code).permit(
      :title,
      :overview,
      :code,
      :description,
      :path,
      :lang_id,
      :template_id
    )
  end
end
