# frozen_string_literal: true

require 'spec_helper'

class ReadyZResponse
  def self.body_json
    '{"status":200,"message":"ready","database_connection":"ok"}'
  end
end

RSpec.describe '/readyz' do
  subject(:readyz_request) { Faraday.get(endpoint_url('/readyz')) }

  it 'returns status code 200' do
    expect(readyz_request.status).to be(200)
  end

  it "returns expected JSON [#{ReadyZResponse.body_json}]" do
    expect(readyz_request.body).to eql(ReadyZResponse.body_json)
  end
end
