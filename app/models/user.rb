class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  validates :password, length: { minimum: 3 }, if: -> { new_record? || crypted_password_changed? }
  # the confirmation setting checks whether the password and password_confirmation match
  validates :password, confirmation: true, if: -> { new_record? || crypted_password_changed? }
  validates :password_confirmation, presence: true, if: -> { new_record? || crypted_password_changed? }

  validates :email, uniqueness: true
end
