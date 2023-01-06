class ExampleCodesController < ApplicationController
  before_action :set_example_code, only: %i[ show edit update destroy ]

  def index
    @example_codes = ExampleCode.all
  end

  def show; end
  def edit; end

  def new
    @example_code = ExampleCode.new
    @example_code.build_lang
  end

  def create
    @example_code = ExampleCode.new(example_code_params)
    respond_to do |format|
      if @example_code.save
        format.html { redirect_to example_code_url(@example_code) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @example_code.update(example_code_params)
        format.html { redirect_to example_code_url(@example_code) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @example_code.destroy
    respond_to do |format|
      format.html { redirect_to example_codes_url }
    end
  end

  private

  def set_example_code
    @example_code = ExampleCode.find(params[:id])
  end

  def example_code_params
    params.require(:example_code).permit(
      :title,
      :overview,
      :code,
      :description,
      :path,
      :lang_id,
      :example_id
    )
  end
end
