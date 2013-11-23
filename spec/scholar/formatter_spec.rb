require 'spec_helper'

describe Scholar::Formatter do
  let(:default) do
    Scholar::Formatter.new(:italicize, nil)
  end

  describe '#action' do
    it 'returns the action being taken upon the value' do
      default.action.should eql(:italicize)
    end
  end

  describe '#option' do
    it 'returns the option of the formatter' do
      default.option.should be_nil
    end
  end

  describe '#execute' do
    context ':period' do
      it 'adds a period to the end' do
        formatter = Scholar::Formatter.new(:period)

        formatter.execute('foo').should eql('foo.')
      end
    end

    context ':italicize' do
      it 'italicizes the value' do
        formatter = Scholar::Formatter.new(:italicize)

        formatter.execute('foo').should eql('<em>foo</em>')
      end
    end

    context ':prefix' do
      it 'adds content before the value' do
        formatter = Scholar::Formatter.new(:prefix, 'bar')

        formatter.execute('foo').should eql('bar foo')
      end
    end

    context ':suffix' do
      it 'adds content after the value' do
        formatter = Scholar::Formatter.new(:suffix, 'bar')

        formatter.execute('foo').should eql('foo bar')
      end
    end

    context ':capitalize' do
      it 'capitalizes the first letter of the value' do
        formatter = Scholar::Formatter.new(:capitalize)

        formatter.execute('foo').should eql('Foo')
      end
    end

    context ':colon' do
      it 'adds a colon to the end of the value' do
        formatter = Scholar::Formatter.new(:colon)

        formatter.execute('foo').should eql('foo:')
      end
    end

    context ':comma' do
      it 'adds a comma to the end of the value' do
        formatter = Scholar::Formatter.new(:comma)

        formatter.execute('foo').should eql('foo,')
      end
    end

    context ':ordinal' do
      it 'adds an ordinal to the end of the value' do
        formatter = Scholar::Formatter.new(:ordinal)

        formatter.execute('1').should eql('1st')
      end
    end

    context ':quotes' do
      it 'wraps the value in fancy quotes' do
        formatter = Scholar::Formatter.new(:quotes)

        formatter.execute('foo').should eql('&#8220;foo&#8221;')
      end
    end

    context ':carets' do
      it 'wraps the value in carets' do
        formatter = Scholar::Formatter.new(:carets)

        formatter.execute('foo').should eql('&#60;foo&#62;')
      end
    end
  end
end
