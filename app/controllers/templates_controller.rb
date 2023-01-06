class TemplatesController < ApplicationController
  before_action :set_template, only: %i[ show edit update destroy ]

  def index
    set_templates
    @templates = Template.paginate(page: params[:page], per_page: 10)
  end

  def show; end
  def edit; end

  def new
    @template = Template.new
  end

  def create
    @template = Template.new(template_params)
    respond_to do |format|
      if @template.save
        format.html { redirect_to template_url(@template) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @template.update(template_params)
        format.html { redirect_to template_url(@template) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @template.destroy
    respond_to do |format|
      format.html { redirect_to templates_url }
    end
  end

  private

  def set_templates
    tag_name = params[:tag]
    lang_name = params[:lang]
    filter_by_name(tag_name, lang_name)
    @templates = @templates.order(created_at: :asc)
  end

  def filter_by_name(tag_name, lang_name)
    if !tag_name.nil?
      tag = Tag.find_by_name(tag_name)
      @templates = tag.nil? ? Template.all : tag.templates
    elsif !lang_name.nil?
      lang = Language.find_by_name(lang_name)
      @templates = lang.nil? ? Template.all : lang.templates
    else
      @templates = Template.paginate(page: params[:page], per_page: 10)
    end
    return @templates
  end

  def set_template
    @template = Template.find(params[:id])
  end

  def template_params
    params.require(:template).permit(
      :title,
      :overview,
      :body,
      :description,
      :path,
      :all_tags,
      :template_codes_count,
      :language_id,
      :_destroy,
      template_codes_attributes: [
        :id,
        :code,
        :path,
        :overview,
        :description,
        :template_id,
        :lang_id,
        :_destroy
      ]
    )
  end
end
