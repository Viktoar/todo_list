class Task < ApplicationRecord
  belongs_to :list

  acts_as_list :column => :order
  # before_create :set_order
  default_scope -> {order(:done).order(:order)}

  def deadline_info
    # return "fff"
    return '' unless deadline.present?
    case 
      when deadline < DateTime.current 
        'danger'
      when deadline < DateTime.current + 2.days
        'warning'
      when deadline > DateTime.current + 2.days && deadline < DateTime.current + 5.days
        'attention'
      when deadline > DateTime.current + 5.days
        'normal'
    end
  end

  private

  # def set_order
  #   if self.list.tasks.size == 0
  #     self.order = 1
  #   else
  #     self.order = list.tasks.last.order + 1
  #   end
  # end

end
