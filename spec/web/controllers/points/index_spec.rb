require 'spec_helper'
require_relative '../../../../apps/web/controllers/points/index'

describe Web::Controllers::Points::Index do
  let(:action) { Web::Controllers::Points::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
