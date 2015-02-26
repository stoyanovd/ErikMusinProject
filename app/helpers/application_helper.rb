module ApplicationHelper

  def get_dir_entries(s)
    if s == nil
      return []
    end
    ans = Dir.entries(s)
    ans.keep_if { |f| f[0] != '.' }
  end

end
