class Shout < ActiveRecord::Base
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :subject, polymorphic: true, dependent: :destroy
end
