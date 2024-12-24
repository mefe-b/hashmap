require_relative 'hash_map'

class HashSet < HashMap
  def add(key)
    set(key, true)
  end

  def delete(key)
    remove(key)
  end

  def contains?(key)
    has?(key)
  end
end
