class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :submissions
	has_many :questions
	has_many :replies
	has_many :translations
	has_and_belongs_to_many :groups
end
