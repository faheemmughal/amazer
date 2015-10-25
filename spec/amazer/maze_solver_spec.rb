RSpec.describe Amazer::MazeSolver do

  let(:width) { 20 }
  let(:height) { 15 }
  let(:maze) do
    Amazer::MazeGenerator.generate(size: { width: width, height: height })
  end
  let(:solution) { described_class.solve maze }
  let(:start_vertex) { Amazer::Vertex.new(0, 0) }
  let(:end_vertex) { Amazer::Vertex.new(width - 1, height - 1) }

  describe '.solve' do
    it 'is successful' do
      expect(solution).to be_a(Amazer::Maze)
    end

    it 'visits start and end vertex' do
      expect(solution[start_vertex]).not_to be_zero
      expect(solution[end_vertex]).not_to be_zero
    end
  end

end
