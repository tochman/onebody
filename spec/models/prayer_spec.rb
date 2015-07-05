require 'rails_helper'

RSpec.describe Prayer, type: :model do
  let(:group) { FactoryGirl.create(:group, name: 'Morgan Small Group')}
  let(:person) { FactoryGirl.create(:person) }
  let(:req) { FactoryGirl.create(:prayer_request, group: group, person: person,
                                 request: 'the request', answered_at: nil, answer: nil) }
  let(:memberships) { group.memberships.create!(person: person) }

  describe 'Fixtures' do
    it 'should have valid fixture factory' do
      expect(FactoryGirl.create(:prayer)).to be_valid
    end
  end

  describe 'Associations' do
    it { is_expected.to belong_to :person }
    it { is_expected.to belong_to :prayer_request }
  end

  describe 'Database schema' do
    it { is_expected.to have_db_column(:person_id).of_type(:integer) }
    it { is_expected.to have_db_column(:prayer_request_id).of_type(:integer) }
    it { is_expected.to have_db_column(:comment).of_type(:text) }
    # Timestamps
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }

  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :person_id }
    it { is_expected.to validate_presence_of :prayer_request_id }
  end

  describe 'add prayer to request' do
    it 'should create instance of Prayer' do
      binding.pry
      expect{req.prayers.create!(person: person, comment: 'prayed for you')}.to change(Prayer, :count).by 1
    end
  end



end
