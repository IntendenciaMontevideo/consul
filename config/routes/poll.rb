resources :polls, only: [:show, :index] do
  member do
    get :stats
    get :results
    get :show_question
  end

  resources :questions, controller: 'polls/questions', shallow: true do
    post :create_session_answer, on: :member
    collection do
      post :vote
      post :show_modal_vote
      post :clean_session_same_group
      post :change_selection
    end
  end
end
