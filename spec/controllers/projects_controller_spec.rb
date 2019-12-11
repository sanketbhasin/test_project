require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do

  context "projects#create" do
    let (:valid_params) {
      {
        title: 'asdasda',
        description: 'asdasdasdasdasd'
      }
    }

    it "Manager create projects" do
      user = create(:user)
      sign_in user
      expect {post :create, params: {project: valid_params}}.to change{Project.all.count}.by (1)
    end

    it "Developer cannot create projects" do
      user = create(:developer_user)
      sign_in user
      expect {post :create, params: {project: valid_params}}.to change{Project.all.count}.by (0)
    end

    it "QA cannot create projects" do
      user = create(:qa_user)
      sign_in user
      expect {post :create, params: {project: valid_params}}.to change{Project.all.count}.by (0)
    end
    
  end

end
