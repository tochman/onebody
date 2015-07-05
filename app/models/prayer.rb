class Prayer < ActiveRecord::Base
  belongs_to :person
  belongs_to :prayer_request

  validates_presence_of :person_id, :prayer_request_id
end
