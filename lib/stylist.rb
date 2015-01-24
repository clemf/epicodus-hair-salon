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

  def self.find(id)
    result = nil
    DB.exec("SELECT * FROM stylists WHERE id = #{id};").each do |stylist|
      id = stylist["id"].to_i
      name = stylist["name"]
      result = (Stylist.new(name, id))
    end
    result
  end

  def list_clients
    results = []
    DB.exec("SELECT * FROM clients WHERE stylist_id = #{@id}").each do |client|
      id = client["id"].to_i
      results.push(id)
    end
    results
  end
end