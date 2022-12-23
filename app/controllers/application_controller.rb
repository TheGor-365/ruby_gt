class ApplicationController < ActionController::Base
  before_action :set_languages
  before_action :set_language, only: %i[ show edit update destroy ]

  def set_languages
    @languages = Language.all
  end

  def set_language
    @language = Language.find(params[:id])
  end
end


def current_lang
  if Lang.find_by_id(session[:lang_id]).nil?
    Lang.new
  else
    Lang.find_by_id(session[:lang_id])
  end
end
