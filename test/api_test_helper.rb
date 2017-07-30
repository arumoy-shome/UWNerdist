require 'webmock/minitest'

module ApiTestHelper
  def stub_term
    stub_request(:get, "https://api.uwaterloo.ca/v2/terms/list.json?key=#{ENV['KEY']}").
      with(headers: stub_header ).
      to_return(status: 200, body: stub_term_body, headers: {})
  end

  def stub_subject
    stub_request(:get, "https://api.uwaterloo.ca/v2/codes/subjects.json?key=#{ENV['KEY']}").
      with(headers: stub_header ).
      to_return(status: 200, body: stub_subject_body, headers: {})
  end

  private

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

  def stub_subject_body
    {
      'data': [
        {
          "subject":"AADMS",
          "description":"Arts Administration Specialization Seminar",
          "unit":"ARTSDEAN",
          "group":"ART"
        },
        {
          "subject":"AB",
          "description":"Arabic (WLU)",
          "unit":"VPA",
          "group":"VPA"
        },
        {
          "subject":"ACC",
          "description":"Accounting",
          "unit":"ACC",
          "group":"ART"
        },
        {
          "subject":"ACINTY",
          "description":"Academic Integrity",
          "unit":"VPA",
          "group":"VPA"
        },
        {
          "subject":"ACTSC",
          "description":"Actuarial Science",
          "unit":"STATACTSC",
          "group":"MAT"
        }
      ]
    }.to_json
  end
end
