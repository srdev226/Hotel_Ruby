class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:stripe_connect]

  validates_presence_of :first_name, :last_name, :phone_number

  validate :password_complexity
  def password_complexity
    if password.present?
       if !password.match(/^(?=.*[a-z])(?=.*[A-Z])/)
         errors.add :password, "Password complexity requirement not met"
       end
    end
  end

  def super_admin?
  end
#   validate :password_complexity

#   def password_complexity
#     if password.present? and not password.match(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d). /)
#       errors.add :password, "must include at least one lowercase letter, one uppercase letter, and one digit"
#     end
#   end

# # validates :password, format: { with: /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/, message: "must include at least one lowercase letter, one uppercase letter, and one digit" }

 has_many :listings, dependent: :destroy
 has_many :payments
 belongs_to :hotel
end
