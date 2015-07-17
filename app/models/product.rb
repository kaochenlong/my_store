class Product < ActiveRecord::Base
  default_scope { where(is_deleted: false) }

  def destroy
    self.is_deleted = true
    save
  end
end
