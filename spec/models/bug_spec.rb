require 'rails_helper'

RSpec.describe Bug, type: :model do
  context "validation tests" do
  
    # it 'ensures bug creator only belongs to qa' do
    #   user = create(:user)
    #   qa_user = create(:qa_user)
    #   project = create(:project, manager: user)
    #   bug = build(:bug, created_by: qa_user.id, project_id: project.id)
    #   byebug
    #   expect(bug.save).to eq(true)

    # end

    it 'ensures bug type cannot be blank' do
      user = create(:user)
       qa_user = create(:qa_user)
       project = create(:project, manager: user)
       bug = build(:bug,type: '', created_by: qa_user.id, project_id: project.id)
       expect(bug.save).to eq(false)
    end

    it 'ensures bug type only include feature or bug' do
      user = create(:user)
       qa_user = create(:qa_user)
       project = create(:project, manager: user)
       bug = build(:bug,type: 'failed', created_by: qa_user.id, project_id: project.id)
       expect(bug.save).to eq(false)
    end

    it 'ensures bug stauts only include specific values' do
      user = create(:user)
       qa_user = create(:qa_user)
       project = create(:project, manager: user)
       bug = build(:bug,status: 'failed', created_by: qa_user.id, project_id: project.id)
       expect(bug.save).to eq(false)
    end

  end

  describe "Associations" do
    it { should belong_to(:creator) }
    it { expect belong_to(:solver) }
    it { should belong_to(:project) }
  end

end

 
