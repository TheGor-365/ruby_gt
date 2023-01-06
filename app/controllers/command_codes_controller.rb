class CommandCodesController < ApplicationController
  before_action :set_command_code, only: %i[ show edit update destroy ]

  def index
    @command_codes = CommandCode.all
  end

  def show; end
  def edit; end

  def new
    @command_code = CommandCode.new

    @command_code.build_lang
  end

  def create
    @command_code = CommandCode.new(command_code_params)

    respond_to do |format|
      if @command_code.save
        format.html { redirect_to command_code_url(@command_code) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @command_code.update(command_code_params)
        format.html { redirect_to command_code_url(@command_code) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @command_code.destroy
    respond_to do |format|
      format.html { redirect_to command_codes_url }
    end
  end

  private

  def set_command_code
    @command_code = CommandCode.find(params[:id])
  end

  def command_code_params
    params.require(:command_code).permit(
      :id,
      :title,
      :overview,
      :body,
      :description,
      :path,
      :lang_id,
      :comment_id,
      :_destroy
    )
  end
end
