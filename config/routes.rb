DemoRailsEngine::Engine.routes.draw do
    resources :orders
    root "orders#index"
    get "demos/index" => "demos#index"
end
