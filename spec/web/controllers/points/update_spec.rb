require 'spec_helper'
require_relative '../../../../apps/web/controllers/points/update'

describe Web::Controllers::Points::Update do
  let(:action) { Web::Controllers::Points::Update.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
