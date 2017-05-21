require 'spec_helper'
require_relative '../../../../apps/web/controllers/points/create'

describe Web::Controllers::Points::Create do
  let(:action) { Web::Controllers::Points::Create.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
