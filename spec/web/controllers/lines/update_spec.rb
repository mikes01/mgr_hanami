require 'spec_helper'
require_relative '../../../../apps/web/controllers/lines/update'

describe Web::Controllers::Lines::Update do
  let(:action) { Web::Controllers::Lines::Update.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
