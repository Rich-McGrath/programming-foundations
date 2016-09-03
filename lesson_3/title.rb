def title(string_to_make_title)
  string_to_make_title.split.map(&:capitalize).join(' ')
end


p title('world of warcraft legion')
