class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable(when soneomone signs up, they have to confirm via email confirm, that thyey are human), :lockable(you can lock a user out via too many password tries), :timeoutable(as long as they are logged in they are in, if you want to change that and put a time constraint on it, you would do that here) and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  def first_name
    self.name.split.first
  end

  def last_name
    self.name.split.last
  end
end