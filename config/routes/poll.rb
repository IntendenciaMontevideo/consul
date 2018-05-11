resources :polls, only: [:show, :index] do
  member do
    get :stats
    get :results
    get :show_question
  end

  resources :questions, controller: 'polls/questions', shallow: true do
    post :answer, on: :member
  end
end
