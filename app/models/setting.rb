class Setting < ActiveRecord::Base
  FIELD_TYPES = ["string", "float", "integer", "boolean", "setting"]
  CACHE_TIME = 2.minutes
  
  validates :label, :presence=>true
  validates :identifier, :uniqueness=>true, :presence=>true
  validates :field_type, :inclusion=>{:in=>Setting::FIELD_TYPES}
  serialize :value

  after_save :extract_to_configatron

  attr_accessible :value
  
  def self.load(identifier)
    identifier = identifier.to_s if identifier.is_a?(Symbol)
    
    find_by_identifier!(identifier)
  end
  
  # Return the value for a setting
  def self.get(identifier, create_new=false)
    Setting.extract_all_to_configatron if configatron.settings_update_time.nil? || configatron.settings_update_time < Time.now - Setting::CACHE_TIME
    ret = configatron.settings[identifier.to_sym]
    return ret unless ret.nil?

    begin
      setting = Setting.load(identifier)
    rescue
      setting = nil
    end
    
    if setting.nil?
      if create_new
        s = Setting.new
        s.identifier = identifier
        s.label = identifier
        s.save!
        s.value
      else
        return ""
      end
    else
      return setting.extract_value
    end
  end

  def extract_value
    return (value == "t" ? true : false) if field_type == "boolean"
    return value.to_i if field_type == "integer"
    return value.to_f if field_type == "float"
    return value
  end

  def self.extract_all_to_configatron
    configatron.settings = {}
    Setting.all.each do |s|
      configatron.settings.merge!({s.identifier.to_sym => s.extract_value})
    end
    configatron.settings_update_time = Time.now
  end

  private

  def extract_to_configatron
    Setting.extract_all_to_configatron
  end
  
end
