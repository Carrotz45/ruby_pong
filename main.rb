require 'gosu'
require_relative 'assets/ball'
require_relative 'assets/paddle'

class Pong < Gosu::Window

  def initialize 
    @win_dim_x = 1920
    @win_dim_y = 1080

    super @win_dim_x, @win_dim_y

    @paddle_img = Gosu::Image.new('media/img/paddle.png')
    @ball_img = Gosu::Image.new('media/img/ball.png')
    
    @player1_pos = 0
    @player2_pos = @win_dim_x - @paddle_img.width

    

    @player1 = Paddle.new(@paddle_img, Gosu::KB_W, Gosu::KB_S, @player1_pos, @win_dim_y/2, @win_dim_x, @win_dim_y)
    @player2 = Paddle.new(@paddle_img, Gosu::KB_UP, Gosu::KB_DOWN, @player2_pos, @win_dim_y/2, @win_dim_x, @win_dim_y)

    @ball =  Ball.new(@ball_img, @win_dim_x/2, @win_dim_y/2, @win_dim_x, @win_dim_y)
  end

  def update 
    @player1.update
    @player2.update

    @ball.update(@player1.y, @player2.y, @paddle_img.width, @paddle_img.height)

    puts @ball.points
  end

  def draw
    @player1.draw
    @player2.draw

    @ball.draw
  end

end

window = Pong.new
window.show