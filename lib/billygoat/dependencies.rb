module Dependencies

    def gem_require(name)

      begin
        require(name)
      rescue LoadError
        puts "#{name} gem not available but is required"
        puts "try: gem install #{name}"
        fail "required gem not available"
      end

    end
    module_function :gem_require

end