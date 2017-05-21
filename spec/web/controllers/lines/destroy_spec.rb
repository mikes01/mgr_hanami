require 'spec_helper'
require_relative '../../../../apps/web/controllers/lines/destroy'

describe Web::Controllers::Lines::Destroy do
  let(:action) { Web::Controllers::Lines::Destroy.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
