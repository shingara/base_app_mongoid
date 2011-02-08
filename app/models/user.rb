class User
  include Mongoid::Document

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :omniauthable

  field :login, :type => String

  validates_presence_of :login
  validates_uniqueness_of :login, :email, :allow_blank => true
  validates_format_of :email,
    :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i,
    :allow_blank => true
  validates_presence_of :password, :if => :password_required?
  validates_confirmation_of :password
  validates_length_of :password, :minimum => 4, :allow_blank => true

  attr_accessible :login, :email, :password, :password_confirmation, :remember_me

  embeds_many :user_tokens

  validates_uniqueness_of :login
  validates_presence_of :login

  ##
  # Methode use by Devise to find user by conditions.
  # We accept authentication by email or login
  #
  # Method use by Devise
  #
  def self.find_for_database_authentication(conditions)
    self.where({ :login => conditions[:email] }).first ||
      self.where({ :email => conditions[:email] }).first
  end

  ##
  # Allow to authenticate by ominauth and create user_token
  #
  # Method use by Devise
  #
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session[:omniauth]
        user.user_tokens.build(:provider => data['provider'], :uid => data['uid'])
      end
    end
  end

  def apply_omniauth(omniauth)
    self.login = omniauth['user_info']['name'] if login.blank?
    self.login = omniauth['user_info']['nickname'] if login.blank?
    user_tokens.build(:provider => omniauth['provider'],
                      :token => omniauth['credentials']['token'],
                      :secret => omniauth['credentials']['secret'],
                      :uid => omniauth['uid'])
  end

  def password_required?
    new_record? && user_tokens.empty?
  end

  def tweets
    user_tokens.where(:provider => 'twitter').first.tweets
  end

end
