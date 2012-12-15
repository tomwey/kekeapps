class ApiKey < ActiveRecord::Base
  attr_accessible :access_token
  
  before_create :generate_access_token
  
  def update_access_token
    self.access_token = SecureRandom.hex
    self.save
  end
  
  private 
  
  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end
  
end
