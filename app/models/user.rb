class User < ActiveRecord::Base
  self.table_name = "ADV_PO_USERS"
  attr_accessible :lastname, :firstname, :middlename, :department, :email, :usertype, :username, :password_hash, :password_salt, :status, :create_date, :create_by, :updated_date, :updated_by, :isActive

  attr_accessible :password_hash
  before_save :encrypt_password
  
  validates_confirmation_of :password_hash
  validates_presence_of :password_hash, :on => :create
  validates_presence_of :username
  validates_uniqueness_of :username
  
  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user      
    else
      nil
    end
  end
  
  def encrypt_password
    if password_hash.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password_hash, password_salt)
    end
  end

end
