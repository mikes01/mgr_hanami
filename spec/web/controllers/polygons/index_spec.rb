require 'spec_helper'
require_relative '../../../../apps/web/controllers/polygons/index'

describe Web::Controllers::Polygons::Index do
  let(:action) { Web::Controllers::Polygons::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
