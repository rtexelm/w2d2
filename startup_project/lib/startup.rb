require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = Array.new
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup)
        @funding > startup.funding
    end

    def hire(employee_name, title)

        unless @salaries.has_key?(title)
            raise ArgumentError.new "Title must be in company database"
        end

        @employees << Employee.new(employee_name, title)
    end

    def size
        @employees.size
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]

        unless @funding > salary
            raise ArgumentError.new "That's way too much"
        end

        employee.pay(salary)
        @funding -= salary
    end

    def payday
        @employees.each {|e| pay_employee(e)}
    end

    def average_salary
        all_salaries = @employees.map {|e| @salaries[e.title]}.sum(0.0)
        all_salaries / @employees.size
    end

    def close
        @employees = Array.new
        @funding = 0
    end
    
    def acquire(startup)
        @funding += startup.funding
        @salaries = startup.salaries.merge(@salaries)
        @employees += startup.employees
        startup.close
    end
end
