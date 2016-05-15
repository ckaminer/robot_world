class Robot
  attr_reader :name,
              :city,
              :state,
              :avatar,
              :birthdate,
              :date_hired,
              :department,
              :id

  def initialize(data)
    @id         = data[:id]
    @name       = data[:name]
    @city       = data[:city]
    @state      = data[:state]
    @avatar     = data[:avatar]
    @birthdate  = data[:birthdate]
    @date_hired = data[:date_hired]
    @department = data[:department]
  end

  def age
    diff = Time.now - Time.parse(birthdate)
    age = (((diff / 60) / 60) / 24) / 365.35
    age.to_i
  end

end
