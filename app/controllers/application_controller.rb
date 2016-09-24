class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action do # This app has only fr lang!
    I18n.locale = :fr
  end
end
