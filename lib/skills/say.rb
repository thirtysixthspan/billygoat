module Say

  #
  # Say it like a goat
  #
  def like_a_goat(*args)
    words = args.join(" ")
    puts <<-EOS
+-#{"-"*words.length}-+
| #{words} |
+-#{"-"*words.length}-+
    |    (_(
    +--  /_/'_____/)
         "  |      |
            |""""""|
    EOS
  end

end