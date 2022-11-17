class GuidesController < ApplicationController
  before_action :set_guide, only: %i[ show edit update destroy ]

  def index
    set_guides
  end

  def show
  end

  def new
    @guide = Guide.new
  end

  def edit
  end

  def create
    @guide = Guide.new(guide_params)

    respond_to do |format|
      if @guide.save
        format.html { redirect_to guide_url(@guide), notice: "Guide was successfully created." }
        format.json { render :show, status: :created, location: @guide }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @guide.update(guide_params)
        format.html { redirect_to guide_url(@guide), notice: "Guide was successfully updated." }
        format.json { render :show, status: :ok, location: @guide }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @guide.destroy

    respond_to do |format|
      format.html { redirect_to guides_url, notice: "Guide was successfully destroyed." }
      format.json { head :no_content }
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
      @guides = Guide.all
    end
    return @guides
  end

  def set_guide
    @guide = Guide.find(params[:id])
  end

  def guide_params
    params.require(:guide).permit(:title, :body, :all_tags, :language_id, codes_attributes: [:id, :code, :_destroy])
  end
end
