Rails.application.routes.draw do
  get("/forex", {:controller => "currencies", :action => "first_currency"})
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
