DemoRailsEngine::Engine.routes.draw do
    resources :orders
    root "demos#index"
    get "demos/index" => "demos#index"
end
