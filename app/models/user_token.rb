class UserToken
  include Mongoid::Document

  field :provider, :type => String
  field :uid, :type => String
  field :token, :type => String
  field :secret, :type => String

  embedded_in :user

  validate :should_be_uniq

  def should_be_uniq
    errors.add(:base, 'need to be uniq') if User.where('user_tokens.provider' => self.provider,
                                                       'user_tokens.uid' => self.uid).first
  end

  def tweets
    Twitter.configure do |config|
      config.consumer_key = BaseApp::Application.config.twitter['app_id']
      config.consumer_secret = BaseApp::Application.config.twitter['app_secret']
      config.oauth_token = self.token
      config.oauth_token_secret = self.secret
    end
    Twitter.user_timeline
  end

end
