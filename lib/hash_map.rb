class HashMap
  def initialize
    @load_factor = 0.75
    @capacity = 16
    @size = 0
    @buckets = Array.new(@capacity) { [] }
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
  
    key.each_char do |char|
      hash_code = prime_number * hash_code + char.ord
    end
  
    hash_code % @capacity
  end

  def set(key, value)
    index = hash(key)
    @buckets[index].each do |pair|
      if pair[0] == key
        pair[1] = value
        return
      end
    end

    @buckets[index] << [key, value]
    @size += 1
    
    if @size.to_f / @capacity > @load_factor
      resize
    end
  end

  def get(key)
    index = hash(key)
    @buckets[index].each do |pair|
      return pair[1] if pair[0] == key
    end
    nil  # Anahtar bulunamazsa nil döndür.
  end

  def has?(key)
    index = hash(key)
    @buckets[index].any? { |pair| pair[0] == key }
  end

  def remove(key)
    index = hash(key)
    @buckets[index].each_with_index do |pair, i|
      if pair[0] == key
        @size -= 1
        return @buckets[index].delete_at(i)[1]  # Anahtar bulunduğunda değeri döndür ve sil.
      end
    end
    nil  # Anahtar yoksa nil döndür.
  end

  def length
    @size
  end

  def clear
    @buckets = Array.new(@capacity) { [] }
    @size = 0
  end

  def keys
    @buckets.flatten(1).map { |pair| pair[0] }
  end

  def values
    @buckets.flatten(1).map { |pair| pair[1] }
  end

  def entries
    @buckets.flatten(1)
  end

  def resize
    old_buckets = @buckets
    @capacity *= 2
    @buckets = Array.new(@capacity) { [] }
    
    old_buckets.flatten.each do |pair|
      set(pair[0], pair[1])  # Eski verileri yeni yapı ile tekrar ekle
    end
  end
end

