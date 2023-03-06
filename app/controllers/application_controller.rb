class ApplicationController < ActionController::Base

  # -----------------------------------------------------------------
  # LANGUAGES
  # -----------------------------------------------------------------

  before_action :set_languages
  before_action :set_language, only: %i[ show edit update destroy ]

  def set_languages
    @languages = Language.all
  end

  def set_language
    @language = Language.find(params[:id])
  end


  def current_language
    if Language.find_by_id(session[:language_id]).nil?
      Language.new
    else
      Language.find_by_id(session[:language_id])
    end
  end


  # -----------------------------------------------------------------
  # LANGS
  # -----------------------------------------------------------------

  before_action :set_langs
  before_action :set_lang, only: %i[ show edit update destroy ]

  def set_langs
    @lang = Lang.all
  end

  def set_lang
    @lang = Lang.find(params[:id])
  end


  def current_lang
    if Lang.find_by_id(session[:lang_id]).nil?
      Lang.new
    else
      Lang.find_by_id(session[:lang_id])
    end
  end


  # -----------------------------------------------------------------
  # TAGS
  # -----------------------------------------------------------------

  before_action :set_tags
  before_action :set_tag, only: %i[ show edit update destroy ]

  def set_tags
    @tag = Tag.all
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end


  # -----------------------------------------------------------------
  # PATH TEMPLATES
  # -----------------------------------------------------------------

  def set_path_templates
    @path_templates = [
      '/',
      '~',
      '~HOME',
      '/working directory',
      '/app working directory',
    ]
  end
end
