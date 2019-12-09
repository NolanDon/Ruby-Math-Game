class Players
  attr_reader :name
  attr_accessor :life, :turn

    def initialize(name = 'Player')
    @name = name.upcase
    @life = 3
    @turn = true
  end

end

