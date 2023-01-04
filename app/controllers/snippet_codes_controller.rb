class SnippetCodesController < ApplicationController
  before_action :set_snippet_code, only: %i[ show edit update destroy ]

  def index
    @snippet_codes = SnippetCode.all
  end

  def show; end
  def edit; end

  def new
    @snippet_code = SnippetCode.new

    @snippet_code.build_lang
  end

  def create
    @snippet_code = SnippetCode.new(snippet_code_params)
    @snippet_code.build_lang(snippet_code_params)

    respond_to do |format|
      if @snippet_code.save
        format.html { redirect_to snippet_code_url(@snippet_code) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @snippet_code.update(snippet_code_params)
        format.html { redirect_to snippet_code_url(@snippet_code) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @snippet_code.destroy

    respond_to do |format|
      format.html { redirect_to snippet_codes_url }
    end
  end

  private

  def set_snippet_code
    @snippet_code = SnippetCode.find(params[:id])
  end

  def snippet_code_params
    params.require(:snippet_code).permit(
      :code,
      :overview,
      :description,
      :path,
      :lang_id,
      :snippet_id,
      :_destroy
    )
  end
end
