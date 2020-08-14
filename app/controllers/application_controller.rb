class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_localizedString
  
  
  def set_localizedString
    set_locale
    #||= ：すでに@localizedStringsがセットされているなら無駄な処理をしないため(処理のキャッシュ[記憶])
    @localizedStrings ||= get_localizedString
  end
  
  #ローケル判定
  def set_locale
      I18n.locale ||= (params[:locale] || http_accept_language.compatible_language_from(I18n.available_locales) || I18n.default_locale)
  end
  
  #使うべき言語に沿って、その言語のリソースを取得する。
  def get_localizedString
    if I18n.locale.nil?
      set_locale
    end
    
    localizedStrings = LocalizedStrings.new
    json_resource = '' 
    if I18n.locale == :en
      json_resource = Rails.root.join('app', 'controllers', 'locale').to_s+"/en.json"
    elsif I18n.locale == :ja
      json_resource = Rails.root.join('app', 'controllers', 'locale').to_s+"/ja.json"
    else
      json_resource = Rails.root.join('app', 'controllers', 'locale').to_s+"/en.json"
    end
    return localizedStrings.addLocalizedFile(json_resource)
  end
  
  
  def default_url_options
    { locale: I18n.locale }
  end
end
