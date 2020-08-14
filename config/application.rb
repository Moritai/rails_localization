require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MessageBoard
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    
    #サーバーが対応できるlocaleをi18nにセットする。
    config.i18n.available_locales = [:en, :ja ]
    #デフォルトのlocaleを英語に設定しておく（クライアントが求める言語と一つもマッチしなかった場合デフォルト言語を返す）
    config.i18n.default_locale = :en
    
    #"/home/ec2-user/environment/message-board/lib" にあるライブラリ（ここではlocal_strings.rb）を自動で読み込むように設定し、他でも使えるようにする。
    config.autoload_paths << Rails.root.join('lib').to_s

    
    
  end
end
