class Stylist

  attr_reader(:name, :id)

  def initialize(name, id)
    @name = name
    @id = id
  end

  def save
    db_id = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = db_id[0]["id"].to_i
  end

  def self.all
    results = []
    DB.exec("SELECT * FROM stylists;").each do |stylist|
      id = stylist["id"].to_i
      name = stylist["name"]
      results.push(Stylist.new(name, id))
    end
    results
  end

  def ==(comparison)
    name == comparison.name
  end

end