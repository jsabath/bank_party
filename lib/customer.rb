class Customer
    attr_reader :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def accounts
        Account.all.select do |acct|
            acct.customer == self
        end
    end

    def banks
        accounts.map do |acct|
            acct.bank.name
        end.uniq
    end
    

    def new_account number, balance, customer
        Account.new(number, balance, self)
    end
end