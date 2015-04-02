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


  def self.move_up(item)
    previous = get_previous(item)
    if previous != nil
      swapping_show_indexes(item, previous)
      item.save
      previous.save
    end
    redirect_to art_logos_url, notice: 'moves up'
  end

  def self.move_down(item)
    successive= get_successive(item)
    if successive != nil
      swapping_show_indexes(item, successive)
      item.save
      successive.save
    end
    redirect_to art_logos_url, notice: 'moves down'
  end


  def self.get_previous(item)
    ArtLogo.where('show_index < ?', item.show_index).order('show_index').last
  end

  def self.get_successive(item)
    ArtLogo.where('show_index > ?', item.show_index).order('show_index').first
  end

end