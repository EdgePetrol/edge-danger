# frozen_string_literal: true

require File.expand_path('../../lib/edge/danger', __dir__)
require File.expand_path('../spec_helper', __dir__)

RSpec.describe Edge::Danger do
  it 'has a version number' do
    expect(Edge::Danger::VERSION).not_to be nil
  end
end
