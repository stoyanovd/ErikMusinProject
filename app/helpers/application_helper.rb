module ApplicationHelper

  def get_dir_entries(s)
    if s == nil
      return []
    end
    ans = Dir.entries(s)
    ans.keep_if { |f| f[0] != '.' }
    if ans.include?('preview.png')
      ans.delete('preview.png')
    end
    ans
  end

end
