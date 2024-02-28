module GildedRose

  def self.new(name:, days_remaining:, quality:)
    @item = class_for(name).new(quality, days_remaining)
  end

  def self.class_for(name)
    case name
    when 'Normal Item'
      NormalItem
    when 'Aged Brie'
      Brie
    when 'Sulfuras, Hand of Ragnaros'
      Sulfuras
    when 'Backstage passes to a TAFKAL80ETC concert'
      Backstage
    end
  end

  class Item
    attr_reader :quality, :days_remaining

    def initialize(quality, days_remaining)
      @quality, @days_remaining = quality, days_remaining
    end

    def tick
    end
  end

  class NormalItem < Item
    def tick
      @days_remaining -= 1
      return if @quality == 0
  
      @quality -= 1
      @quality -= 1 if @days_remaining <= 0
    end
  end

  class Brie < Item
    def tick
      @days_remaining -= 1
      return if @quality >= 50
  
      @quality += 1 
      @quality += 1 if @days_remaining <= 0 and @quality < 50
    end
  end

  class Sulfuras < Item 
    def tick
    end
  end

  class Backstage < Item
    def tick
      @days_remaining -= 1
      return if @quality >= 50
      return @quality = 0 if @days_remaining < 0
  
      @quality += 1
      @quality += 1 if @days_remaining < 10
      @quality += 1 if @days_remaining < 5
    end
  end

end
