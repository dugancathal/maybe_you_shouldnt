require 'rails'
module MaybeYouShouldnt
  class Railtie < Rails::Railtie
    initializer 'maybe_you_shouldnt.make_try_better' do
      require 'maybe_you_shouldnt/try'
    end
  end
end
