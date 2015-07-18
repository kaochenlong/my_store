class Product < ActiveRecord::Base
  default_scope { where(is_deleted: false) }

  scope :online, -> { where(is_online: true) }

  def destroy
    self.is_deleted = true
    save
  end
end
