Rails.application.routes.draw do
  get 'customize', to: "customize#index"
  resources :vulnerabilities
  resources :projects
  resources :agent_sizes
  resources :agent_opportunities
  resources :agent_skills
  resources :agent_motives
  resources :threat_agents
  resources :reputation_damage_impacts
  resources :risks do
    get :wizard, on: :collection
  end
  resources :loc_impacts
  resources :loi_impacts
  resources :loac_impacts
  resources :loav_impacts
  resources :privacy_violation_impacts
  resources :non_compliance_impacts
  resources :financial_damage_impacts
  resources :vulnerability_ids
  resources :vulnerability_awarenesses
  resources :vulnerability_eo_es
  resources :vulnerability_eods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "risks#index"
end
