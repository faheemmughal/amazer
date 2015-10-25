RSpec.describe Amazer::MazeGenerator do

  let(:subject) { described_class.new size: { width: 20, height: 15 } }

  describe '.generate' do
    let(:maze) { subject.generate }
    let(:keys) { maze.maze.keys }
    let(:values) { maze.maze.values }

    it 'has correct height and width' do
      expect(maze.height).to eq(15)
      expect(maze.width).to eq(20)
    end

    it 'all vertices have been visited and are valid' do
      expect(keys.size).to eq(300)
      expect(values).to all( be > 0 )
    end
  end

end
