class CommandsController < ApplicationController
  before_action :set_command, only: %i[ show edit update destroy ]

  def index
    set_commands
    @commands = Command.paginate(page: params[:page], per_page: 10)
  end

  def show; end
  def edit; end

  def new
    @command = Command.new
  end

  def create
    @command = Command.new(command_params)

    respond_to do |format|
      if @command.save && @command.command_codes.each { |command_code| command_code.save }
        format.html { redirect_to command_url(@command) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @command.update(command_params)
        format.html { redirect_to command_url(@command) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @command.destroy
    respond_to do |format|
      format.html { redirect_to commands_url }
    end
  end

  private

  def set_commands
    tag_name = params[:tag]
    lang_name = params[:lang]
    filter_by_name(tag_name, lang_name)
    @commands = @commands.order(created_at: :asc)
  end

  def filter_by_name(tag_name, lang_name)
    if !tag_name.nil?
      tag = Tag.find_by_name(tag_name)
      @commands = tag.nil? ? Command.all : tag.commands
    elsif !lang_name.nil?
      lang = Language.find_by_name(lang_name)
      @commands = lang.nil? ? Command.all : lang.commands
    else
      @commands = Command.paginate(page: params[:page], per_page: 10)
    end
    return @commands
  end

  def set_command
    @command = Command.find(params[:id])
  end

  def command_params
    params.require(:command).permit(
      :title,
      :overview,
      :body,
      :description,
      :path,
      :all_tags,
      :language_id,
      :command_codes_counter,
      :_destroy,
      command_codes_attributes: [
        :id,
        :code,
        :path,
        :overview,
        :description,
        :command_id,
        :lang_id,
        :_destroy
      ]
    )
  end
end
