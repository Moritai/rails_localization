Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
 #scopeによってhttp://localhost:3001/en/--のようにパスにlocale情報（e.g. en）が自動的に埋め込まれるようにする。
 #↑controllers/application_controller.rbで、URLに含まれるlocale情報が、paramsを設定していなくとも自動的に与えられるように設定しておく。
 #(:locele)のように（）をつけることで、ローケルの指定がなくともエラーが出ないようにする。
 #:localeのように、：をつけてパラメータ化することでコントローラparams[:locale]として参照できる。
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
      resources :messages, except: [:index]
  end
  
  #原理上ルートURLは一つしかないということから、routes.rbにおけるroot to: --#index宣言ではlocaleが考慮されていない。
  #そのため、http://localhost:3001/enなどの問い合わせがあった場合に対応できるようにget ':locale'を設定しておく。
  root to: 'messages#index'
  get ':locale' => 'messages#index'
  
end
