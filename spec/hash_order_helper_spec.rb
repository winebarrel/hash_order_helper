require 'spec_helper'

describe HashOrderHelper do
  let(:hash) { {b: 200, a: 100, c: 150} }
  let(:org_hash) { {} }
  let(:result) { [] }
  let(:args) { [] }
  let(:expected_type) { Hash }

  subject do
    org_hash.replace(hash)
    org_hash.freeze

    if args.last.is_a?(Proc)
      block = args.pop
      retval = hash.send(described_class, *args, &block)
    else
      retval = hash.send(described_class, *args)
    end

    expect(retval).to be_kind_of expected_type

    retval = retval.to_a
    result.replace(retval)
    result.freeze
    retval
  end

  describe :sort_pair do
    it do
      is_expected.to eq [[:a, 100], [:b, 200], [:c, 150]]
      expect(hash.to_a).to eq org_hash.to_a
    end
  end

  describe :sort_pair! do
    it do
      is_expected.to eq [[:a, 100], [:b, 200], [:c, 150]]
      expect(hash.to_a).to eq result
    end
  end

  describe :sort_pair_by do
    let(:args) { [proc {|k, v| v } ] }

    it do
      is_expected.to eq [[:a, 100], [:c, 150], [:b, 200]]
      expect(hash.to_a).to eq org_hash.to_a
    end
  end

  describe :sort_pair_by! do
    let(:args) { [proc {|k, v| v } ] }

    it do
      is_expected.to eq [[:a, 100], [:c, 150], [:b, 200]]
      expect(hash.to_a).to eq result
    end
  end

  describe :at do
    let(:args) { [1] }
    let(:expected_type) { Array }

    it do
      is_expected.to eq [:a, 100]
    end
  end

  describe :insert do
    let(:args) { [1, :d, 300] }

    it do
      is_expected.to eq [[:b, 200], [:d, 300], [:a, 100], [:c, 150]]
      expect(hash.to_a).to eq result
    end
  end

  describe :last do
    let(:expected_type) { Array }

    context 'without argument' do
      it do
        is_expected.to eq [:c, 150]
      end
    end

    context 'with argument' do
      let(:args) { [2] }

      it do
        is_expected.to eq [[:a, 100], [:c, 150]]
      end
    end
  end

  describe :pop do
    let(:expected_type) { Array }

    context 'without argument' do
      it do
        is_expected.to eq [:c, 150]
        expected_hash = org_hash.dup
        expected_hash.delete(:c)
        expect(hash.to_a).to eq expected_hash.to_a
      end
    end

    context 'with argument' do
      let(:args) { [2] }

      it do
        is_expected.to eq [[:a, 100], [:c, 150]]
        expected_hash = org_hash.dup
        [:a, :c].each {|k| expected_hash.delete(k) }
        expect(hash.to_a).to eq expected_hash.to_a
      end
    end
  end

  describe :push do
    let(:args) { [:d, 300] }

    it do
      is_expected.to eq [[:b, 200], [:a, 100], [:c, 150], [:d, 300]]
      expect(hash.to_a).to eq result
    end
  end

  describe :unshift do
    let(:args) { [:d, 300] }

    it do
      is_expected.to eq [[:d, 300], [:b, 200], [:a, 100], [:c, 150]]
      expect(hash.to_a).to eq result
    end
  end
end
