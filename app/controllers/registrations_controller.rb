class RegistrationsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
  end

  def create
    if User.create(params.slice(:email_address, :password, :password_confirmation).permit!)
      redirect_to new_session_path
    else
      redirect_to new_registration_path, alert: "Try another email address or password."
    end
  end
end
