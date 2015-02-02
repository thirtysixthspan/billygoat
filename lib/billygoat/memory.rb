class Memory

  attr_accessor :brain, :skills, :credentials

  def say(*args)
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
