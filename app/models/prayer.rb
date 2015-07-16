class Prayer < ActiveRecord::Base
  belongs_to :person
  belongs_to :prayer_request

  validates_presence_of :person_id, :prayer_request_id

  def streamable?
    person ? true : false
  end

  after_create :create_as_stream_item

  def create_as_stream_item
    return unless streamable?
    StreamItem.create!(
        title:           'Prayer request response',
        body:            comment,
        person_id:       person_id,
        group_id:        self.prayer_request.group_id,
        streamable_type: 'Prayer',
        streamable_id:   id,
        created_at:      created_at,
        shared:          !!self.prayer_request.group
    )

  end
end
