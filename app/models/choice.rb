class Choice < ActiveRecord::Base
  has_many :user_choices
  belongs_to :question
end
