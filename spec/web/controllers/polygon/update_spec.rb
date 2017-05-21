require 'spec_helper'
require_relative '../../../../apps/web/controllers/polygon/update'

describe Web::Controllers::Polygon::Update do
  let(:action) { Web::Controllers::Polygon::Update.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
