require_relative '../lib/game.rb'

describe Game do
  subject(:game) { described_class.new }
    
describe '#check_win' do
  context 'When the top row is x, x, x,' do  
    before do 
      subject.instance_variable_set(:@places, 'a1' => 'x', 'b1' => 'x', 'c1' => 'x')
    end
    it 'player 1 wins, and x_win should be called' do
      called_x_win =  false
      subject.stub(:x_win) {called_x_win = true}
      subject.check_win
      expect(called_x_win).to eq(true)
    end
  end
  context 'When diagonal win condition is met' do  
    before do 
      subject.instance_variable_set(:@places, 'a1' => 'o', 'b2' => 'o', 'c3' => 'o')
    end
    it 'player 2 wins, and o_win is called' do
      called_o_win =  false
      subject.stub(:o_win) {called_o_win = true}
      subject.check_win
      expect(called_o_win).to eq(true)
    end
  end
  context 'When no player has won' do  
    before do 
      subject.instance_variable_set(:@places, 'a1' => 'o', 'b2' => 'x', 'c3' => 'o')
    end
    it 'no player wins, and play is called' do
      called_play=  false
      subject.stub(:play) {called_play = true}
      subject.check_win
      expect(called_play).to eq(true)
    end
  end
end
 
 
end

#tests for determining if win/lose is being declared correctly
#player1
#player2
#play
#change_grid
#check_win

