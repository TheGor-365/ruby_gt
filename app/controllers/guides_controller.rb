class GuidesController < ApplicationController
  before_action :set_guide, only: %i[ show edit update destroy ]

  def index
    set_guides
    @guides = Guide.paginate(page: params[:page], per_page: 10)
  end

  def show; end
  def edit; end

  def new
    @guide = Guide.new

    @guide.guide_codes.build
    @guide.steps.build
  end

  def create
    respond_to do |format|
      @guide = Guide.new(guide_params)

      @guide.guide_codes.each do |guide_code|
        guide_code.build_lang
        guide_code.lang = Lang.find(params[:guide_code][:lang_id])
      end

      if @guide.save
        format.html { redirect_to guide_url(@guide) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @guide.update(guide_params)
        format.html { redirect_to guide_url(@guide) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @guide.destroy
    respond_to do |format|
      format.html { redirect_to guides_url }
    end
  end

  private

  def set_guides
    tag_name = params[:tag]
    lang_name = params[:lang]
    filter_by_name(tag_name, lang_name)
    @guides = @guides.order(created_at: :asc)
  end

  def filter_by_name(tag_name, lang_name)
    if !tag_name.nil?
      tag = Tag.find_by_name(tag_name)
      @guides = tag.nil? ? Guide.all : tag.guides
    elsif !lang_name.nil?
      lang = Language.find_by_name(lang_name)
      @guides = lang.nil? ? Guide.all : lang.guides
    else
      @guides = Guide.paginate(page: params[:page], per_page: 3)
    end
    return @guides
  end

  def set_guide
    @guide = Guide.find(params[:id])
  end

  def guide_params
    params.require(:guide).permit(
      :title,
      :path,
      :overview,
      :body,
      :description,
      :all_tags,
      :language_id,
      :_destroy,
      guide_codes_attributes: [
        :id,
        :code,
        :path,
        :overview,
        :description,
        :guide_id,
        :lang_id,
        :_destroy
      ]
    )
  end
end
