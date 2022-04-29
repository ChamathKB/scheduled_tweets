class OmniauthCallbacksController < ApplicationController
    def twitter
        # render plain: "Success!"
        Rails.logger.info auth

        twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
        twitter_account.update(
            name: auth.info.name,
            # username: auth.info.nickname,
            image: auth.info.image,
            token: auth.info.token,
            secret: auth.info.secret,
        )

        redirect_to root_path, notice: "Successfully connected your account" 
    end

    def auth
        request.env['omniauth.auth']
    end
end