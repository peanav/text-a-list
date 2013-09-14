class Queries

  def self.collection(collection)
    @collection = collection
  end

  def self.add_list_item(list, item)
    begin
      Mongoloid.lists.insert [list: list.strip.downcase, item: item.strip]
    rescue
      puts "error adding #{item} to the list: #{list}"
    end
  end

  def self.lists
    Mongoloid.lists.distinct('list').to_a.map { |list| list.capitalize }
  end

  def self.items(list)
    Mongoloid.lists.find({"list" => list.downcase}, {:fields => ['item']}).to_a.map {|item| item['item'] }
  end

  def self.clear_list(list)
    Mongoloid.lists.remove({"list" => list.downcase})
  end
end
