class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :set_defaults

  validates_presence_of :first_name, :last_name, :username
  validates :username, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z]+([a-zA-Z]|\d)*\Z/ }

  has_many :posts
  
  def full_name
    self.first_name + " " + self.last_name
  end

  private

    def set_defaults
     self.role ||= 'student'
    end
end
