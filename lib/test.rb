# Hashmap sınıfını kullanarak bir örnek oluşturun.
hash_map = Hashmap.new

# Değer ekleme
hash_map.set('apple', 'red')
hash_map.set('banana', 'yellow')

# Anahtar alıp değerini kontrol etme
puts hash_map.get('apple')   # => 'red'
puts hash_map.get('banana')  # => 'yellow'

# Anahtar olup olmadığını kontrol etme
puts hash_map.has?('apple')  # => true
puts hash_map.has?('grape')  # => false

# Değeri silme ve kontrol etme
puts hash_map.remove('apple')  # => 'red'
puts hash_map.get('apple')      # => nil

# Uzunluk kontrolü
puts hash_map.length   # => 1

# Tüm anahtarları ve değerleri kontrol etme
puts hash_map.keys     # => ['banana']
puts hash_map.values   # => ['yellow']

# Tüm girişleri kontrol etme
puts hash_map.entries  # => [['banana', 'yellow']]

# Haritayı temizleme
# hash_map.clear
puts hash_map.length   # => 0

