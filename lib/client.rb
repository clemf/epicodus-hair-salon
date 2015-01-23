class Client

  attr_reader(:name, :stylist_id, :id)

  def initialize(name, stylist_id, id)
    @name = name
    @stylist_id = stylist_id
    @id = id
  end

  def save
    db_id = DB.exec("INSERT INTO clients (name) VALUES ('#{@name}') RETURNING id;")
    @id = db_id[0]["id"].to_i
  end

  def self.all
    results = []
    DB.exec("SELECT * FROM clients;").each do |client|
      id = client["id"].to_i
      name = client["name"]
      stylist_id = client["stylist_id"].to_i
      results.push(Client.new(name, stylist_id, id))
    end
    results
  end

  def ==(comparison)
    name == comparison.name
  end

end