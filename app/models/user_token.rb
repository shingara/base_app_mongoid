class UserToken
  include Mongoid::Document
  field :provider, :type => String
  field :uid, :type => String
  embedded_in :user

  validate :should_be_uniq

  def should_be_uniq
    errors.add(:base, 'need to be uniq') if User.where('user_tokens.provider' => self.provider,
                                                       'user_tokens.uid' => self.uid).first
  end
end
