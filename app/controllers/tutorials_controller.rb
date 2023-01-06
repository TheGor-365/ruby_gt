class TutorialsController < ApplicationController
  before_action :set_tutorial, only: %i[ show edit update destroy ]

  def index
    set_tutorials
    @tutorials = Tutorial.paginate(page: params[:page], per_page: 10)
  end

  def show; end
  def edit; end

  def new
    @tutorial = Tutorial.new
  end

  def create
    @tutorial = Tutorial.new(tutorial_params)
    respond_to do |format|
      if @tutorial.save
        format.html { redirect_to tutorial_url(@tutorial) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @tutorial.update(tutorial_params)
        format.html { redirect_to tutorial_url(@tutorial) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @tutorial.destroy
    respond_to do |format|
      format.html { redirect_to tutorials_url }
    end
  end

  private

  def set_tutorials
    tag_name = params[:tag]
    lang_name = params[:lang]
    filter_by_name(tag_name, lang_name)
    @tutorials = @tutorials.order(created_at: :asc)
  end

  def filter_by_name(tag_name, lang_name)
    if !tag_name.nil?
      tag = Tag.find_by_name(tag_name)
      @tutorials = tag.nil? ? Tutorial.all : tag.tutorials
    elsif !lang_name.nil?
      lang = Language.find_by_name(lang_name)
      @tutorials = lang.nil? ? Tutorial.all : lang.tutorials
    else
      @tutorials = Tutorial.paginate(page: params[:page], per_page: 10)
    end
    return @tutorials
  end

  def set_tutorial
    @tutorial = Tutorial.find(params[:id])
  end

  def tutorial_params
    params.require(:tutorial).permit(
      :title,
      :overview,
      :body,
      :description,
      :path,
      :all_tags,
      :language_id,
      :tutorial_codes_count,
      :_destroy,
      tutorial_codes_attributes: [
        :id,
        :code,
        :path,
        :overview,
        :description,
        :tutorial_id,
        :lang_id,
        :_destroy
      ]
    )
  end
end
