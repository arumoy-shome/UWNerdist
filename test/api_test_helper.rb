require 'webmock/minitest'

module ApiTestHelper
  def stub_term
    stub_request(:get, "https://api.uwaterloo.ca/v2/terms/list.json?key=#{ENV['KEY']}").
      with(headers: stub_header ).
      to_return(status: 200, body: stub_term_body, headers: {})
  end

  def stub_subject
    stub_request(:get, "https://api.uwaterloo.ca/v2/terms/1139/courses.json?key=#{ENV['KEY']}").
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
          'subject':'ACC',
          'catalog_number':'652',
          'units':0.5,
          'title':'Forensic Accounting'
        },
        {
          'subject':'ACC',
          'catalog_number':'680',
          'units':0.5,
          'title':'Performance Measurement and Control systems for Implementing Strategy'
        },
        {
          'subject':'SYDE',
          'catalog_number':'322',
          'units':0.5,
          'title':'Software Design'
        },
        {
          'subject':'SCI',
          'catalog_number':'255',
          'units':0.5,
          'title':'The Biology of Aging'
        },
        {
          'subject':'ACINTY',
          'catalog_number':'600',
          'units':0,
          'title':'Academic Integrity Module'
        }
      ]
    }.to_json
  end
end
