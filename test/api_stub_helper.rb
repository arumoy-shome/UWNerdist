require 'webmock/minitest'

def stub_term
  stub_request(:get, "https://api.uwaterloo.ca/v2/terms/list.json?key=#{ENV['KEY']}").
    with(headers: stub_header ).
    to_return(status: 200, body: stub_term_body, headers: {})
end

def stub_header
  {
    'Accept'=>'*/*',
    'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
    'User-Agent'=>'Ruby'
  }
end

def stub_term_body
  {
    'data': {
      'current_term': 1139,
      'previous_term': 1135,
      'next_term': 1141
    }
  }.to_json
end
