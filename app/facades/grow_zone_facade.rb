class GrowZoneFacade
  def self.get_zone(zipcode)
    json = GrowZoneService.get_zone(zipcode)

    raise GrowZoneError if json.nil?

    json_to_poro(json).zone
  end

  def self.json_to_poro(json)
    GrowZone.new(json)
  end
end
