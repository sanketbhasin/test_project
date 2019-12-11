require 'rails_helper'

RSpec.describe BugsController, type: :controller do

  context "bugs#create" do
  
    let (:valid_params) {
      {
        title:  Faker::Lorem.sentence,
        description: Faker::Lorem.sentence,
        status: 'New',
        type: 'Bug',
        deadline: '03-03-2019'
      }
    }
      
      it "ensures bug creator should belong to QA" do
      user    = create(:user)
      qa_user = create(:qa_user)
      sign_in qa_user
      project = create(:project, manager: user)
      expect {post :create, params: {bug: valid_params, project_id: project.id}}.to change{Bug.count}.by (1)
    end
  end
end
