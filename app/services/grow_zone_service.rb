class GrowZoneService
  def self.get_zone(zipcode)
    response = conn.get("zipcodes/#{zipcode}")
    parse_json(response)
  end

  def self.conn
    Faraday.new(
      url: 'https://plant-hardiness-zone.p.rapidapi.com',
      headers: { 'X-RapidAPI-Key': ENV['X-RapidAPI-Key'] }
    )
  end

  def self.parse_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end