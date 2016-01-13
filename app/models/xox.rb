class Xox < ActiveRecord::Base
  has_many :matches

def allmoves
    self.moves
  end  

  def totalmoves
    allmoves.length
  end  

  def endgame
    if totalmoves == 9
      then
    return true
      else
    return false
    end
  end      

  def move(position)
    self.moves << position
    self.save
    if self.moves.length.odd? && self.moves.length ==5
      wincheck(onemoves)
    else
      wincheck(twomoves)
    end 
  end

  def whowon
    if self.moves.count.even?
      self.winner = "Player 1"
    else
      self.winner = "Player 2"
    end         
    self.save
  end

  def onemoves
    self.moves.select.each_with_index{ |k,i| k if i.even?}
  end

  def twomoves
    self.moves.select.each_with_index{ |k,i| k if i.odd?}
  end  

  def wincheck(moves)
    winstates = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    if winstates.map { |state| (state & moves).length == 3}.any?
      whowon
    end
  end    



end


