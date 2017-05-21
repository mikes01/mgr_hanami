require 'spec_helper'
require_relative '../../../../apps/web/controllers/polygon/destroy'

describe Web::Controllers::Polygon::Destroy do
  let(:action) { Web::Controllers::Polygon::Destroy.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
