class Item < ActiveRecord::Base
  belongs_to :list
  belongs_to :user

  default_scope { order('created_at ASC') }

  validates :body, length: { minimum: 1 }

  def days_left
    days_ago_created = ((Time.now - self.created_at)/84600).round
    days_left = 7 - days_ago_created
    if days_left >= 0
      days_left
    else
      0
    end
  end
end