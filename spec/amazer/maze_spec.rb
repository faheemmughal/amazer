RSpec.describe Amazer::Maze do

  let(:subject) { Amazer::Maze.new width: 20, height: 10 }
  let(:vertex) { Amazer::Vertex.new(19, 9) }
  let(:outside_vertex) { Amazer::Vertex.new(20, 10) }

  describe '.initialize' do
    it 'has correct height and width' do
      expect(subject.height).to eq(10)
      expect(subject.width).to eq(20)
    end

    it 'has empty maze' do
      expect(subject.maze.keys.size).to eq(0)
    end
  end

  describe '#tunnelable?' do
    context 'when outside vertex' do
      it 'returns false' do
        expect(subject.tunnelable?(outside_vertex)).to be_falsey
      end
    end

    context 'when inside and unvisited vertex' do
      it 'returns true' do
        expect(subject.tunnelable?(vertex)).to be_truthy
      end
    end
  end

  describe '#inside_maze_width?' do
    context 'when outside' do
      it 'returns false' do
        expect(subject.inside_maze_width?(outside_vertex)).to be_falsey
      end
    end

    context 'when outside in negative coordiantes' do
      let(:outside_vertex_in_minus) { Amazer::Vertex.new(-1, -1) }

      it 'returns false' do
        expect(subject.inside_maze_width?(outside_vertex_in_minus)).to be_falsey
      end
    end

    context 'when inside' do
      it 'returns true' do
        expect(subject.inside_maze_width?(vertex)).to be_truthy
      end
    end
  end

  describe '#inside_maze_height?' do
    context 'when outside' do
      it 'returns false' do
        expect(subject.inside_maze_height?(outside_vertex)).to be_falsey
      end
    end

    context 'when outside in negative coordiantes' do
      let(:outside_vertex_in_minus) { Amazer::Vertex.new(-1, -1) }

      it 'returns false' do
        expect(subject.inside_maze_height?(outside_vertex_in_minus)).to be_falsey
      end
    end

    context 'when inside' do
      it 'returns true' do
        expect(subject.inside_maze_height?(vertex)).to be_truthy
      end
    end
  end

  describe '#new_vertex?' do
    context 'when vertex has not been visited' do
      it 'returns true' do
        expect(subject.new_vertex?(vertex)).to be_truthy
      end
    end

    context 'when vertex has been visited' do
      before { subject[vertex] = 5 }

      it 'returns false' do
        expect(subject.new_vertex?(vertex)).to be_falsey
      end
    end
  end

end
