require_relative "../test_helper"

class Kloudless::CollectionTest < Minitest::Test
  Model = Struct.new(:id)

  def setup
    @raw = <<-JSON
    {
      "total": 2,
      "count": 2,
      "page": 1,
      "objects": [
        {
            "id": 1
        },
        {
            "id": 2
        }
      ]
    }
    JSON
    @json = JSON.parse(@raw)
    @collection = Kloudless::Collection.new(Model, @json)
  end

  def test_total
    assert_equal 2, @collection.total
  end

  def test_count
    assert_equal 2, @collection.count
  end

  def test_page
    assert_equal 1, @collection.page
  end

  def test_objects
    assert_equal 2, @collection.objects.size
    assert_equal 1, @collection.objects[0]["id"]
    assert_equal 2, @collection.objects[1]["id"]
  end

  def test_each
    @collection.each do |record|
      assert_kind_of Model, record
    end
  end
end
