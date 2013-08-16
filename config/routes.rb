Geogrames::Application.routes.draw do
  get "/oauth/connect" => "authorizations#connect", as: "oauth_connect"
  get "/oauth/callback" => "authorizations#callback", as: "oauth_callback"
  get "/oauth/disconnect" => "authorizations#disconnect", as: "oauth_disconnect"

  get "/map" => "maps#index", as: "map"

  root to: "homepage#index"
end
