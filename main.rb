require 'gosu'
require_relative 'assets/ball'
require_relative 'assets/paddle'

class PingPong < Gosu::Window

  def initialize 
    @winDimX = 1920
    @winDimY = 1080

    super @winDimX, @winDimY

    @paddleImg = Gosu::Image.new('media/img/paddle.png')
    #@ballImg = Gosu::Image.new('media/img/ball.png')
    
    @xPos = 100
    @yPos = @winDimX-@xPos-@paddleImg.width

    

    @player1 = Paddle.new(@paddleImg, Gosu::KB_W, Gosu::KB_S, @xPos, @winDimY/2, @winDimX, @winDimY)
    @player2 = Paddle.new(@paddleImg, Gosu::KB_UP, Gosu::KB_DOWN, @yPos, @winDimY/2, @winDimX, @winDimY)

    #@ball =  Ball.new()
  end

  def update 
    @player1.update
    @player2.update
    
  end

  def draw
    @player1.draw
    @player2.draw
  end

end

window = PingPong.new
window.show