require 'spec_helper'
require_relative '../../../../apps/web/controllers/points/destroy'

describe Web::Controllers::Points::Destroy do
  let(:action) { Web::Controllers::Points::Destroy.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
