require 'rails_helper'

RSpec.describe Song, type: :model do
  it { is_expected.to validate_presence_of(:title) }
end
