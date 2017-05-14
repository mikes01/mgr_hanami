require 'spec_helper'
require_relative '../../../../apps/web/controllers/map/index'

describe Web::Controllers::Map::Index do
  let(:action) { Web::Controllers::Map::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
