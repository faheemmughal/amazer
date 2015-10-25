RSpec.describe Amazer::Direction do

  describe '#path_to?' do
    let(:subject) { described_class.path_to?(Amazer::Direction::WEST, value) }

    context 'when there is a path' do
      let(:value) { 6 }

      it 'returns true' do
        expect(subject).to be_truthy
      end
    end

    context 'when there is no path' do
      let(:value) { 8 }

      it 'returns false' do
        expect(subject).to be_falsey
      end
    end
  end

  describe '#walkable_directions_for_value' do
    let(:directions) { described_class.walkable_directions_for_value(value) }

    context 'when there is a path' do
      let(:value) { 12 }

      it 'returns the correct directions' do
        expect(directions).to include(
          Amazer::Direction::WEST,
          Amazer::Direction::SOUTH
          )
        expect(directions).not_to include(
          Amazer::Direction::NORTH,
          Amazer::Direction::EAST
          )
      end
    end
  end

end
