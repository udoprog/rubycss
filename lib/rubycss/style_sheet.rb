module RubyCSS
  module Utils
    def self.convert_value(v)
      v.to_s
    end
    
    def self.class_selector(object)
      last = object.name.split("::").last
      last.gsub!(/[^^]([A-Z])/, "-\\1")
      last.downcase!
    end

    def self.values(v)
      v.flatten!
      return v[0...-1], v.last if v.last.kind_of? Hash
      return v, {}
    end
  end

  module StyleSheet
    def self.included(base)
      if base.instance_of? Module
        ModuleMethods.setup(base)
      else
        ClassMethods.setup(base)
      end
    end

    module ModuleMethods
      def self.setup(base)
        base.extend(ModuleMethods)
        base.instance_eval{
          @cname = nil
          @cache = nil
        }
      end

      def cached?
        !@cache.nil?
      end

      def compile(o = {})
        unless cached?
          o = o.dup

          unless @cname.nil?
            o[:ns] = (o[:ns] || []) + [@cname]
          else
            o[:ns] = nil
          end

          result = []

          self.constants.each do |c|
            if self.const_defined?(c)
              const = self.const_get(c)
              result << const.compile(o)
            end
          end

          @cache = result
        end

        if o[:join]
          @cache.flatten.join(o[:join])
        else
          @cache
        end
      end

      def cname(cname)
        @cname = cname
      end
    end

    class RuleSet
      def initialize(klass)
        @class = klass
        @rules = []
      end

      #
      # extends the following ruleset with a prior
      #
      # options:
      #   :all        => include all matching rulesets
      #   :first_only => only include the first match (ignoure subsequent)
      #   :from       => search the specified stylesheet for rulesets.
      #
      def extends(name, o = {})
        all        = o[:all] || false
        first_only = o[:first] || false
        from       = o[:from] || @class

        blocks = from.get_selectors[name.to_s]

        raise StyleSheetError, "No such selector: #{name}" if blocks.nil?

        unless blocks.length == 1 or (first_only and blocks.length > 1) or all
          raise StyleSheetError, "Ambigious extend, use either :all => true or :first => true"
        end

        blocks.each do |block|
          self.instance_eval(&block)
          break if first_only
        end
      end

      #
      # define a css rule.
      #
      def rule(name, *args)
        value = args.map{|v| Utils.convert_value(v)}.join(" ")
        name = name.to_s.gsub(/_/, "-")
        @rules << [name, value]
      end

      def convert_all(*args)
        args.map do |v|
          if v.instance_of? Fixnum
            "#{v}px"
          else
            v
          end
        end
      end

      def c(*color)
        Color.new(*color)
      end

      #
      # Declare aliases
      #
      @@aliases = {
        :border_radius => [
          "border-radius", "-moz-border-radius", "-webkit-border-radius"
        ]
      }

      #
      # Declare positional rules.
      # 
      [:left, :right, :top, :bottom].each do |o|
        define_method("padding_#{o}") { |*a| rule "padding-#{o}", *convert_all(*a) }
        define_method("margin_#{o}") { |*a| rule "margin-#{o}", *convert_all(*a) }
      end

      #
      # Delcare rules.
      #
      [:padding, :margin, :left, :right, :top, :bottom, :width, :height].each do |r|
        define_method(r) { |*a| rule r, *convert_all(*a) }
      end

      [:clear, :display, :overflow, :visibility].each do |r|
        define_method(r) { |*a| rule r, *a }
      end

      [:color].each do |r|
        define_method(r) { |*a| rule r, *a }
      end

      @@aliases.each do |k, v|
        define_method(k) do |*a|
          v.each do |vv|
            rule vv, *convert_all(*a)
          end
        end
      end

      def compile(o={})
        @rules.map{|k,v| "#{k}: #{v};"}.join(" ")
      end
    end

    module ClassMethods
      def self.setup(klass)
        klass.instance_eval{
          @selectors = {}
          @abstracts = {}
          @segments = []
          @extends = []
          @cache = nil
        }

        klass.extend(ClassMethods)
      end

      def cached?
        !@cache.nil?
      end

      def compile(o = {})
        unless cached?
          result = []

          get_segments.each do |k, block|
            rules = RuleSet.new(self)
            rules.instance_eval(&block)
            compiled = rules.compile(o)
            result << "#{k} {#{compiled}}"
          end

          @cache = result
        end

        @cache
      end

      def get_selectors(stack = [])
        if stack.include? self
          raise StyleSheetError, "Circular extends: #{(stack + [self]).join(' -> ')}"
        end

        s = {}

        @extends.each do |ext|
          ext.get_selectors(stack + [self]).each do |k, v|
            s[k] = (s[k] || []) + v
          end
        end

        @selectors.each do |k,v|
          s[k] = (s[k] || []) + v
        end

        @abstracts.each do |k,v|
          s[k] = (s[k] || []) + v
        end

        s
      end

    protected
      def get_segments
        @segments
      end

      def extends(klass)
        @extends << klass
      end

      def get_extends
        @extends
      end

      def abstract(name, &block)
        name = name.to_s
        @abstracts[name] ||= []
        @abstracts[name] << block
      end

      def select(*sels, &block)
        sels, o = Utils.values(sels)
        selector sels, o, &block
      end

      def ids(*ids, &block)
        ids, o = Utils.values(ids)
        selector ids.map{|i| "##{i}"}, o, &block
      end

      def classes(*classes, &block)
        classes, o = Utils.values(classes)
        selector classes.map{|i| ".#{i}"}, o, &block
      end

    private
      def selector(selector, o={}, &block)
        sel = selector.map{|s| s}.join(",")

        blk = Proc.new do |rules|
          o.each do |k,v|
            raise StyleSheetError, "No such method: #{k}" unless self.respond_to? k
            self.send(k, *v)
          end

          self.instance_eval(&block) unless block.nil?
        end

        @selectors[sel] ||= []
        @selectors[sel] << blk
        @segments << [sel, blk]
      end
    end
  end
end
