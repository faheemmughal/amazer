RSpec.describe Amazer::Vertex do

  describe '#get_vertex' do
    let(:subject) { Amazer::Vertex.new(15, 5) }
    let(:new_vertex) { subject.get_vertex(direction) }

    context 'when direction is north' do
      let(:direction) { Amazer::Direction::NORTH }

      it 'returns correct coordinates' do
        expect(new_vertex.x).to eq(15)
        expect(new_vertex.y).to eq(4)
      end
    end

    context 'when direction is south' do
      let(:direction) { Amazer::Direction::SOUTH }

      it 'returns correct coordinates' do
        expect(new_vertex.x).to eq(15)
        expect(new_vertex.y).to eq(6)
      end
    end

    context 'when direction is west' do
      let(:direction) { Amazer::Direction::WEST }

      it 'returns correct coordinates' do
        expect(new_vertex.x).to eq(14)
        expect(new_vertex.y).to eq(5)
      end
    end

    context 'when direction is east' do
      let(:direction) { Amazer::Direction::EAST }

      it 'returns correct coordinates' do
        expect(new_vertex.x).to eq(16)
        expect(new_vertex.y).to eq(5)
      end
    end
  end

end
