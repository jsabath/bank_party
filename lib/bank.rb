class Bank
    attr_reader :name, :city

    @@all = []

    def initialize(name, city)
        @name = name
        @city = city
        @@all << self
    end

    def self.all
        @@all
    end

    def accounts
        Account.all.select do |acct|
            acct.bank == self
        end
    end

    def customers
        accounts.map do |acct|
            acct.customer
        end
    end

    # def new_account number, balance, bank
    #     Account.new(number, balance, self)
    # end

    def oldest_account
        accounts.min_by do |acct|
            acct.open_year
        end
    end

    # def self.most
    #     accounts.reduce do |sum, n|
    #         sum += n
    #     end
    # end

    def most
        accounts.sort_by{|sum, n| n}.last
    end
end
