module AccountScrapping
  extend ActiveSupport::Concern
  
  def trash
    update_attribute :trashed, true
  end
end