class Friendship < ActiveRecord::Base

	before_validation :generate_uuid

  def generate_uuid
    #generate_unique_field! :propertyid, 6 if propertyid.blank?
    #raise RuntimeError, "testing exception handling in production"
    self.uuid = RandomToken.genf(10,c: :d) if self.uuid.blank? || self.new_record?
  end
	belongs_to :user
	belongs_to :friend , class_name: "User"
end
