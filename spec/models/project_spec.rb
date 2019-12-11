require 'rails_helper'

RSpec.describe Project, type: :model do

  describe "Associations" do
    it {should have_many(:project_users)}
    it {should have_many(:bugs)}
  end
end

 
