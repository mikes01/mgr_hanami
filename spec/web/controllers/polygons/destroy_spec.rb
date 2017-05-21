require 'spec_helper'
require_relative '../../../../apps/web/controllers/polygons/destroy'

describe Web::Controllers::Polygons::Destroy do
  let(:action) { Web::Controllers::Polygons::Destroy.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
