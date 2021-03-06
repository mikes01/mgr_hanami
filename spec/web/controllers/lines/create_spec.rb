require 'spec_helper'
require_relative '../../../../apps/web/controllers/lines/create'

describe Web::Controllers::Lines::Create do
  let(:action) { Web::Controllers::Lines::Create.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
