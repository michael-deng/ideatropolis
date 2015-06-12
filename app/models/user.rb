class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
         :omniauthable, :omniauth_providers => [:facebook]

  has_attached_file :avatar, 
                        :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                        :default_url => "/images/:style/missing.png",
                        :storage => :s3,
                        :s3_credentials => {
                          :bucket => ENV['S3_BUCKET_NAME'],
                          :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                          :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                        }
  validates_attachment :avatar, 
                        :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
                        :size => { :in => 0..1.megabytes }

  has_many :ideas, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50 } 
  validates :email, presence: true, length: { maximum: 255 },
  									format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end
end



