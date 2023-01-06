class ExamplesController < ApplicationController
  before_action :set_example, only: %i[ show edit update destroy ]

  def index
    set_examples
    @examples = Example.paginate(page: params[:page], per_page: 10)
  end

  def show; end
  def edit; end

  def new
    @example = Example.new
  end

  def create
    @example = Example.new(example_params)
    respond_to do |format|
      if @example.save
        format.html { redirect_to example_url(@example) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @example.update(example_params)
        format.html { redirect_to example_url(@example) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @example.destroy
    respond_to do |format|
      format.html { redirect_to examples_url }
    end
  end

  private

  def set_examples
    tag_name = params[:tag]
    lang_name = params[:lang]
    filter_by_name(tag_name, lang_name)
    @examples = @examples.order(created_at: :asc)
  end

  def filter_by_name(tag_name, lang_name)
    if !tag_name.nil?
      tag = Tag.find_by_name(tag_name)
      @examples = tag.nil? ? Example.all : tag.examples
    elsif !lang_name.nil?
      lang = Language.find_by_name(lang_name)
      @examples = lang.nil? ? Example.all : lang.examples
    else
      @examples = Example.paginate(page: params[:page], per_page: 10)
    end
    return @examples
  end

  def set_example
    @example = Example.find(params[:id])
  end

  def example_params
    params.require(:example).permit(
      :title,
      :overview,
      :body,
      :description,
      :path,
      :all_tags,
      :language_id,
      :tutorial_codes_count,
      :_destroy,
      example_codes_attributes: [
        :id,
        :code,
        :path,
        :overview,
        :description,
        :example_id,
        :lang_id,
        :_destroy
      ]
    )
  end
end
