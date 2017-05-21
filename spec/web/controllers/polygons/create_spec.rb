require 'spec_helper'
require_relative '../../../../apps/web/controllers/polygons/create'

describe Web::Controllers::Polygons::Create do
  let(:action) { Web::Controllers::Polygons::Create.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
