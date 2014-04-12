def stubbed_user_address
  "1022 park st 32204"
end

def geocoded_address
  '1022 Park St., Jacksonville, FL, 32204, USA'
end

Geocoder::Lookup::Test.add_stub(
  stubbed_user_address, [
    {
      'latitude'     => 123.0,
      'longitude'    => 456.0,
      'address'      => geocoded_address,
      'state'        => 'Florida',
      'state_code'   => 'FL',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)

Geocoder::Lookup::Test.add_stub(
  "500 Bay St", [
    {
      'latitude'     => 123.0,
      'longitude'    => 456.0,
      'address'      => "500 Bay St",
      'state'        => 'Florida',
      'state_code'   => 'FL',
      'country'      => 'United States',
      'country_code' => 'US'
    }
  ]
)
