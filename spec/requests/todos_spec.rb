require 'rails_helper'
RSpec.describe "/todos", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Todo. As you add validations to Todo, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { FactoryBot.attributes_for(:todo) }

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  describe "GET /index" do
    it "renders a successful response" do
      Todo.create! valid_attributes
      get todos_url
      expect(response).to be_successful
    end
  end
end