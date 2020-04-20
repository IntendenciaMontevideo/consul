Rails.application.routes.draw do

  if Rails.env.development? || Rails.env.staging?
    get '/sandbox' => 'sandbox#index'
    get '/sandbox/*template' => 'sandbox#show'
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  draw :account
  draw :admin
  draw :annotation
  draw :budget
  draw :comment
  draw :community
  draw :debate
  draw :devise
  draw :direct_upload
  draw :document
  draw :graphql
  draw :guide
  draw :legislation
  draw :management
  draw :moderation
  draw :notification
  draw :officing
  draw :poll
  draw :proposal
  draw :related_content
  draw :tag
  draw :user
  draw :valuation
  draw :verification

  root 'welcome#index'
  get '/welcome', to: 'welcome#welcome'
  get '/consul.json', to: "installation#details"

  resources :stats, only: [:index]
  resources :images, only: [:destroy]
  resources :documents, only: [:destroy]
  resources :follows, only: [:create, :destroy]

  # More info pages
  get 'help',             to: 'pages#show', id: 'help/index',             as: 'help'
  get 'help/how-to-use',  to: 'pages#show', id: 'help/how_to_use/index',  as: 'how_to_use'
  get 'help/faq',         to: 'pages#show', id: 'help/faq/index',         as: 'faq'

  # more info pages
  get 'que-es-montevideo-decide',                     to: 'pages#show', id: 'more_info/index',                as: 'more_info'
  get 'que-es-montevideo-decide/how-to-use',          to: 'pages#show', id: 'more_info/how_to_use/index',     as: 'more_info_how_to_use'
  get '/preguntas-frecuentes',                        to: 'pages#show', id: 'more_info/faq/index',            as: 'more_info_faq'
  get '/ideas',                                       to: 'pages#show', id: 'ideas',                          as: 'ideas'
  get '/presupuesto-participativo',                   to: 'pages#show', id: 'presupuesto-participativo',      as: 'presupuesto-participativo'
  get '/espacios-de-colaboracion',                    to: 'pages#show', id: 'espacios-de-colaboracion',       as: 'espacios-de-colaboracion'
  get '/condiciones-de-uso',                          to: 'pages#show', id: 'conditions',                     as: 'conditions'
  get '/politicas-de-privacidad',                     to: 'pages#show', id: 'privacy',                        as: 'privacy'
  get '/municipios',                                  to: 'pages#show', id: 'municipios',                     as: 'municipios'
  get '/noticias/(:category)',                        to: 'pages#index',                                      as: 'articles'

  # Static pages
  get '/blog' => redirect("http://blog.consul/")
  resources :pages, path: '/', only: [:show]
end
