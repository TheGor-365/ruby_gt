class SnippetsController < ApplicationController
  before_action :set_snippet, only: %i[ show edit update destroy ]

  def index
    set_snippets
  end

  def show
  end

  def new
    @snippet = Snippet.new
  end

  def edit
  end

  def create
    @snippet = Snippet.new(snippet_params)

    respond_to do |format|
      if @snippet.save
        format.html { redirect_to snippet_url(@snippet), notice: "Snippet was successfully created." }
        format.json { render :show, status: :created, location: @snippet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @snippet.update(snippet_params)
        format.html { redirect_to snippet_url(@snippet), notice: "Snippet was successfully updated." }
        format.json { render :show, status: :ok, location: @snippet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @snippet.destroy

    respond_to do |format|
      format.html { redirect_to snippets_url, notice: "Snippet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_snippets
    tag_name = params[:tag]
    lang_name = params[:lang]
    filter_by_name(tag_name, lang_name)
    @snippets = @snippets.order(created_at: :asc)
  end

  def filter_by_name(tag_name, lang_name)
    if !tag_name.nil?
      tag = Tag.find_by_name(tag_name)
      @snippets = tag.nil? ? Snippet.all : tag.snippets
    elsif !lang_name.nil?
      lang = Language.find_by_name(lang_name)
      @snippets = lang.nil? ? Snippet.all : lang.snippets
    else
      @snippets = Snippet.all
    end
    return @snippets
  end

  def set_snippet
    @snippet = Snippet.find(params[:id])
  end

  def snippet_params
    params.require(:snippet).permit(:title, :body, :all_tags, :language_id, codes_attributes: [:id, :code, :_destroy])
  end
end
