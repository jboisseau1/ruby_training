module Playable
  def blam
    @health -= 10
  end

  def w00t
    @health +=15
  end

  def strong?
      @health > 100
  end
end
