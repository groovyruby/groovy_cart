class Payments
  def self.load_settings_for(payments_ident)
    raw_config = File.read(Rails.root + "/config/gateways/#{payments_ident}.yml")
    config = YAML.load(raw_config)[Rails.env].symbolize_keys
    config
  end
end