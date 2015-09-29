Rails.application.routes.draw do
  root          'recipes#index'
  devise_for    :users
  resources     :recipes
  post          'twiliosms/send_sms' => 'twiliosms#send_sms'
  match         'twiliosms/process_sms' => 'twiliosms#process_sms', via: :all
end
