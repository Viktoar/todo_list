class Task < ApplicationRecord
  belongs_to :list
  before_create :set_order
  default_scope -> {order(:done).order(:order)}

  private

  def set_order
    self.order = list.tasks.count + 1
  end

end
