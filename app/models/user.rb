# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  firstname              :string
#  lastname               :string
#  surname                :string
#  chief                  :boolean          default(FALSE)
#  description            :text
#  address                :string
#  picture_file_name      :string
#  picture_content_type   :string
#  picture_file_size      :integer
#  picture_updated_at     :datetime
#  latitude               :float
#  longitude              :float
#  phone_number           :string
#  admin                  :boolean          default(FALSE), not null
#  provider               :string
#  uid                    :string
#  picture                :string
#  first_name             :string
#  last_name              :string
#  token                  :string
#  token_expiry           :datetime
#  pro                    :boolean
#  amateur                :boolean
#  publishable_key        :string
#  access_code            :string
#  birth                  :date
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  stripe                 :boolean          default(FALSE)
#  customer_id            :string
#  stripe_id              :string
#  bank_account_id        :string
#  number_meals_sold      :integer
#  ca                     :integer
#  last_meal              :datetime
#  number_orders          :integer
#  last_order             :datetime
#  ouishare               :boolean
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  devise :omniauthable, omniauth_providers: [:facebook]

  # after_create :welcome_message

  attr_accessor :stripe_account
  attr_accessor :bank_account


  def self.find_for_facebook_oauth(auth)

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.firstname = auth.info.first_name
      user.lastname = auth.info.last_name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
      user.skip_confirmation!
    end
  end

  def traits
    the_traits = {
      createdAt: created_at,
      email: email,
      firstname: firstname,
      lastname: lastname,
      stripe: stripe,
      tel: phone_number,
      address: address,
      chief: chief,
      birth: birth,
      avatar: picture,
      ca: ca,
      last_meal: last_meal,
      number_meals_sold: number_meals_sold,
      number_orders: number_orders,
      last_order: last_order,
      sharing_lille: ouishare
    }
  end

  has_many :meals, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :chief_pictures, dependent: :destroy
  has_many :comments, dependent: :destroy



  validates :firstname, presence: true, on: :update, if: :not_recovering_password
  validates :lastname, presence: true, on: :update, if: :not_recovering_password
  validates :phone_number, presence: true, uniqueness: true,  on: :update, if: :not_recovering_password
  validates :address, presence: true, on: :update, if: :not_recovering_password
  validates :birth, presence: true, on: :update, if: :not_recovering_password
  validates :picture, presence: true, on: :update, if: :not_recovering_password


  def not_recovering_password
    password_confirmation.nil?
  end

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>", large: "550x550>", crop:"300x300#" },
    default_url: "default.svg"
    crop_attached_file :picture

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  private

  def welcome_message
    UserMailer.welcome(self).deliver
  end

end
