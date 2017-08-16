require 'webmock/minitest'

module ApiTestHelper
  def stub_term
    stub_request(:get, "https://api.uwaterloo.ca/v2/terms/list.json?key=#{ENV['KEY']}").
      with(headers: stub_header).
      to_return(status: 200, body: stub_term_body, headers: {})
  end

  def stub_subject
    stub_request(:get, "https://api.uwaterloo.ca/v2/codes/subjects.json?key=#{ENV['KEY']}").
      with(headers: stub_header ).
      to_return(status: 200, body: stub_subject_body, headers: {})
  end

  def stub_current_subjects
    stub_request(:get, "https://api.uwaterloo.ca/v2/terms/#{Term.current.id}/courses.json?key=#{ENV['KEY']}").
      with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: stub_current_subjects_body, headers: {})
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
        'current_term': 1234,
        'previous_term': 5678,
        'next_term': 9101,
        "listings": {
          "2017":[
            {
              "id":1234,
              "name":"Winter 2017"
            },
            {
              "id":5678,
              "name":"Spring 2017"
            },
            {
              "id":9101,
              "name":"Fall 2017"
            }
          ]
        }
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

  def stub_current_subjects_body
    {
      "data":[
        {
          "subject":"CS",
          "catalog_number":"115",
          "units":0.5,
          "title":"Programming Racket"
        },
        {
          "subject":"ACC",
          "catalog_number":"611",
          "units":0.5,
          "title":"External Reporting"
        },
        {
          "subject":"SYDE",
          "catalog_number":"321",
          "units":0.5,
          "title":"Software Design"
        },
        {
          "subject":"ACC",
          "catalog_number":"622",
          "units":0.5,
          "title":"Electronic Commerce"
        },
        {
          "subject":"SCI",
          "catalog_number":"650",
          "units":0.5,
          "title":"Cellular Biology"
        }]
    }.to_json
  end
end
