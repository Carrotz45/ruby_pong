class Grill
 
  def width
    @sprite.width
  end

  def height
    @sprite.height
  end
 
  def right
    @x + @sprite.width
  end

  def left
    @x
  end

  def top
    @y
  end

  def bottom
    @y + @sprite.height
  end


  
end