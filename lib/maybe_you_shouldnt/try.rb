class Object
  def try(*args, &block)
    message, *other_args, options = *args
    if options.is_a?(Hash) && options[:force]
      options.delete(:force)
      other_args.push(options) unless options.empty?
      self && self.public_send(message, *other_args, &block)
    else
      raise NoMethodError, <<-MSG

  Stop! Hold everything!

  I see that you just called "Object#try" on an instance of #{self.class} -
  this probably isn't what you want.

  Please, before you go any further, go read anything by 
  Sandi Metz (http://www.sandimetz.com/blog/2014/12/19/suspicions-of-nil), or
  Avdi Grimm (http://devblog.avdi.org/2011/05/30/null-objects-and-falsiness/).

  TL;DR - Nil is often a smell that indicates your code could be written differently. 
  Inruby, thing.try(:message) is equal to thing && thing.message which is, 
  in essence a type check (which you _more than likely_ don't want in your OO code).

  If you would like to continue, change the call to look like this:

  instance.try(<ALL YOUR ARGS>, force: true)
      MSG
    end
  end
end
