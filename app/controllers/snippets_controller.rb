class SnippetsController < ApplicationController
  before_action :set_snippet, only: %i[ show edit update destroy ]

  def index
    set_snippets
    @snippets = Snippet.paginate(page: params[:page], per_page: 10)
  end

  def show; end
  def edit; end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(snippet_params)

    respond_to do |format|
      if @snippet.save
        format.html { redirect_to snippet_url(@snippet) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @snippet.update(snippet_params)
        format.html { redirect_to snippet_url(@snippet) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @snippet.destroy
    respond_to do |format|
      format.html { redirect_to snippets_url }
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
      @snippets = Snippet.paginate(page: params[:page], per_page: 10)
    end
    return @snippets
  end

  def set_snippet
    @snippet = Snippet.find(params[:id])
  end

  def snippet_params
    params.require(:snippet).permit(
      :title,
      :path,
      :overview,
      :body,
      :description,
      :all_tags,
      :language_id,
      :snippet_codes_count,
      :_destroy,
      snippet_codes_attributes: [
        :id,
        :code,
        :path,
        :overview,
        :description,
        :snippet_id,
        :lang_id,
        :_destroy
      ]
    )
  end
end
