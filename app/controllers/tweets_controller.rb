class TweetsController < ApplicationController
    before_action :require_user_logged_in!
    before_action :set_tweet, only: [:show, :edit, :update, :destroy]
    

    def index
        @tweets = Current.user.tweets
    end

    def new
        @tweet = Tweet.new
    end

    def create
        @tweet = Current.user.tweets.create(tweet_params)
        if @tweet.save
            #TweetJob.set(wait_until: @tweet.publish_at).perform_later(@tweet)
            rediret_to tweets_path, notice: "Tweet was scheduled successfully"
       else
           render :new
       end
    end

    def edit
    end

    def update
        if @tweet.update(tweet_params)
          #TweetJob.set(wait_until: @tweet.publish_at).perform_later(@tweet)
          redirect_to tweets_path, notice: "Tweet was updated successfully"
        else
          render :edit
        end
    end

    def destroy
        @tweet.destroy
        redirect_to tweets_path, notice: "Tweet was unscheduled"
    end

    private

    def tweet_params
        params.require(:tweet).permit(:twitter_account_id, :body, :publish_at)
    end 

    def set_tweet
        @tweet = Current.user.tweet.find(params[:id])
    end
end