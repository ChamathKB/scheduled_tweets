class PasswordMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.password_mailer.reset.subject
  #
  def reset
    # @greeting = "Hi"
    @token = params[:user].signed_id(purpose: "password_reset", expires_in: 15.minutes)

    # mail to: "to@example.org"
    mail to: params[:user].emails
  end
end
