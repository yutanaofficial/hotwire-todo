require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe Todo, type: :model do
  describe Todo do
    it { is_expected.to validate_presence_of(:name) }
  end
end
