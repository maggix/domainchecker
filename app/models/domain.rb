class Domain < ActiveRecord::Base
  belongs_to :user

  protected
  def assign_user
    self.user = current_user
  end
end
