require 'spec_helper'
require_relative '../../../../apps/web/controllers/polygon/create'

describe Web::Controllers::Polygon::Create do
  let(:action) { Web::Controllers::Polygon::Create.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
