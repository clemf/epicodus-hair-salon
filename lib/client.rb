class Client

  attr_reader(:name, :stylist_id, :id)

  def initialize(name, stylist_id, id)
    @name = name
    @stylist_id = stylist_id
    @id = id
  end

  def save
    db_id = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
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

  def self.find(id)
    result = nil
    DB.exec("SELECT * FROM clients WHERE id = #{id};").each do |client|
      id = client["id"].to_i
      name = client["name"]
      stylist_id = client["stylist_id"].to_i
      result = (Client.new(name, stylist_id, id))
    end
    result
  end

  def associate_stylist(id)
    DB.exec("UPDATE clients SET stylist_id = #{id} WHERE id = #{@id};")
    @stylist_id = id
  end
end