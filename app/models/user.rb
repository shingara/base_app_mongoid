class User
  include Mongoid::Document

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  field :login, :type => String

  validates_uniqueness_of :login
  validates_presence_of :login

  ##
  # Methode use by Devise to find user by conditions.
  # We accept authentication by email or login
  #
  def self.find_for_database_authentication(conditions)
    self.where({ :login => conditions[:email] }).first ||
      self.where({ :email => conditions[:email] }).first
  end


end
