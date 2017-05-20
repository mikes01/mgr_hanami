require 'spec_helper'
require_relative '../../../../apps/web/controllers/lines/index'

describe Web::Controllers::Lines::Index do
  let(:action) { Web::Controllers::Lines::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
