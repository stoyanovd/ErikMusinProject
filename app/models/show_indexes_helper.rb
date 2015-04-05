module ShowIndexesHelper

  def self.idealize_show_index(db)
    i = 1
    db.order('show_index').each { |item|
      item.show_index = i
      item.save
      i += 1
    }
  end

  def self.swapping_show_indexes(x, y)
    temp = x.show_index
    x.show_index = y.show_index
    y.show_index = temp
  end


  def self.move_forward(item, db)
    previous = get_previous(item, db)
    if previous != nil
      swapping_show_indexes(item, previous)
      item.save
      previous.save
    end
  end

  def self.move_backward(item, db)
    successive= get_successive(item, db)
    if successive != nil
      swapping_show_indexes(item, successive)
      item.save
      successive.save
    end
  end

  def self.move_up(item, db)
    move_backward(item, db) # depends on styling
  end

  def self.move_down(item, db)
    move_forward(item, db) # depends on styling
  end


  def self.get_previous(item, db)
    db.where('show_index < ?', item.show_index).order('show_index').last
  end

  def self.get_successive(item, db)
    db.where('show_index > ?', item.show_index).order('show_index').first
  end

end