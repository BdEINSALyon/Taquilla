class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions

  protect_from_forgery with: :exception
  after_action :prepare_unobtrusive_flash
  before_action do # This app has only fr lang!
    I18n.locale = :fr
  end
end
