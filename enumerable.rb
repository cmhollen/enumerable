module Enumerable
    def my_each
      for i in self
        yield i
      end  
      self
    end

    def my_each_with_index
        for i in 0..self.length - 1
            yield(self[i], i)
        end
        self
    end

    def my_select
      select_arr = []
      for i in self
        if yield i
          select_arr.push(i)
        end
      end
      select_arr
    end

    def my_all?
        result = true
        for i in self
            unless yield i
              result = false
            end
        end
        result
    end

    def my_any?
        result = false
        for i in self
            if yield i
                result = true
            end
        end
        result
    end

    def my_none?
        result = true
        for i in self
            if yield i
                result = false
            end
        end
        result
    end

    def my_count
        count = 0
        for i in self
            if yield i
                count += 1
            end
        end
        count
    end

    def my_map(proc=nil)
        map_arr = []
        for i in self
          if proc
            map_arr.push(proc.call i)
          elsif block_given?
            map_arr.push yield i
          end
        end
        map_arr
    end

    def my_inject(result=nil)
        result = self[0] if result.nil?
        for i in self
            result = yield(result, i)
        end
        result
    end

    

end

def multiply_els(arr)
    arr.my_inject(1) { | result, i |  result * i  }
end

my_proc = Proc.new { |i| i + 2 }

#puts [1, 2, 3].my_each { |i| puts "element: #{i}" }
#puts [1, 2, 3].my_each_with_index { | el, i | puts "element: #{el} and index: #{i}" }
#puts [1, 2, 3].my_select { | i |  i % 2 != 0  }
#puts [1, 2, 3].my_all? { | i |  i > 0  }
#puts [1, 2, 3].my_any? { | i |  i == 2  }
#puts [1, 2, 3].my_none? { | i |  i < 0  }
#puts [1, 2, 3].my_count { | i |  i > 0  }
#puts [1, 2, 3].my_map { | i |  i * 2  }
#puts [1, 2, 3].my_inject { | result, i |  result + i  }
#puts multiply_els([2, 4 , 5])
#puts [1, 2, 3].my_map(my_proc)