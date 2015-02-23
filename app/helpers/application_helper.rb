module ApplicationHelper

  def get_dir_entries(s)
    ans = Dir.entries(s)
    ans.keep_if { |f| f[0] != '.' }
  end

end
