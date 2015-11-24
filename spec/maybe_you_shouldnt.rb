require 'spec_helper'
require 'active_support/core_ext/object/try'

describe 'Once upon a time', order: :defined do
  context 'in Rails-land' do
    describe 'an object, named Orion,' do
      before do
        @orion = Object.new
      end

      it 'responded to try' do
        expect(@orion).to respond_to(:try)
      end

      it "let you do silly things, like silently swallow nils" do
        def @orion.nil_method
          nil
        end
        expect { @orion.try(:nil_method).try(:lol_wut) }.to_not raise_error
      end

      context 'even when orion was nil' do
        it 'STILL let you do silly things' do
          @orion = nil
        expect { @orion.try(:uhhhhh) }.to_not raise_error
        end
      end

      context 'one day' do
        before do
          require 'maybe_you_shouldnt/try'
        end

        it "learned that, maybe you shouldn't" do
          expect { @orion.try(:does_not_exist) }.to raise_error(NoMethodError, /Avdi/)
        end

        it 'still lets you do silly things, if you want, though' do
          def @orion.nil_method
            nil
          end
          expect { @orion.try(:nil_method, force: true).try(:lol_wut) }.to_not raise_error
        end

        it 'even works with lots of args' do
          spy = double(:spy, track: nil)
          allow(@orion).to receive(:nil_method).and_return(nil)
          @orion.try(:nil_method, :arg1, :arg2, option: 1, force: true).try(:lol_wut)
          expect(@orion).to have_received(:nil_method).with(:arg1, :arg2, option: 1)
        end

        it 'even works with blocks' do
          called = false
          allow(@orion).to receive(:nil_method).and_return(nil).and_yield do
            called = true
          end

          block = -> { }
          @orion.try(:nil_method, force: true, &block).try(:lol_wut)
          expect(called).to be_truthy
        end
      end
    end
  end
end
