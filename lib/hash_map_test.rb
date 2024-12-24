require 'minitest/autorun'
require_relative 'hash_map'

class TestHashMap < Minitest::Test
  def setup
    @hash_map = HashMap.new
  end

  def test_set_and_get
    @hash_map.set('key1', 'value1')
    assert_equal 'value1', @hash_map.get('key1')
  end

  def test_has_key
    @hash_map.set('key1', 'value1')
    assert @hash_map.has?('key1')
  end

  def test_remove
    @hash_map.set('key1', 'value1')
    @hash_map.remove('key1')
    refute @hash_map.has?('key1')
  end

  def test_length
    @hash_map.set('key1', 'value1')
    @hash_map.set('key2', 'value2')
    assert_equal 2, @hash_map.length
  end

  def test_resize
    (1..100).each { |i| @hash_map.set("key#{i}", "value#{i}") }
    assert_equal 100, @hash_map.length
  end

  def test_clear
    @hash_map.set('key1', 'value1')
    @hash_map.clear
    assert_equal 0, @hash_map.length
  end

  def test_collision_handling
    @hash_map.set('key1', 'value1')
    @hash_map.set('ke1y', 'value2')  # Farklı anahtarlarla çarpışmayı kontrol et
    assert_equal 'value2', @hash_map.get('ke1y')
  end
end

