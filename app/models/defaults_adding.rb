module DefaultsAdding

  def self.increase_all_indexes(db)
    db.all.each { |item|
      item.show_index += 10000
      item.save
    }
  end

  def self.create_plain_arts(db, paths)
    i = 1
    paths.each { |image_path|
      puts 'i = ', i, ' ', image_path
      item = db.new
      item.image = File.open(image_path)
      item.name = File.basename(image_path, ".*")
      item.show_index = i
      if item.save
        puts 'success'
        i += 1
      else
        puts 'failure'
      end
    }
  end

  PNGS_PREFIX = 'app/assets/images/pngs/'

  def self.get_paths_from_dir(dir)
    Dir[dir + '*']
  end

  def self.add_defaults_example(db)
    increase_all_indexes(db)
    dir_with_logos = pngs_prefix + 'logo/'
    default_logos = get_paths_from_dir(dir_with_logos)
    create_plain_arts(db, default_logos)
  end

end