require 'spec_helper'
require_relative '../../../../apps/web/controllers/polygons/update'

describe Web::Controllers::Polygons::Update do
  let(:action) { Web::Controllers::Polygons::Update.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
