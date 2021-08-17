class Book
    # Class Variable, denoted with @@, exists on class, not instance.
    @@search_count = 0

    def initialize(title, author, pub_year)
        @title = title
        @author = author
        @pub_year = pub_year
    end

    # Class method. Called on class, not an instance. Independent of instance state. Defined with self.<MethodName>.
    def self.find(title)
        @@search_count += 1
        "I am found!"
    end

    # attr_accessor shortcuts don't work for class variables, must define custom getter/setter as a class method.
    def self.search_count
        @@search_count
    end

    # Allow direct comparison of book objects.
    def <=>(other_book)
        title <=> other_book.title
    end

    # Read only access to get access to instance variables
    attr_reader :title, :author, :pub_year
end

b = Book.new("The Best Book", "Donald Trump", 2021)
p Book.search_count

class Collection
    attr_reader :name

    def initialize(name)
        @name = name
        @books = []
    end

    # Custom append operator for class.
    def <<(book)
        @books << book
    end

    # Allow direct comparison of collection objects.
    def <=>(other_collection)
        name <=> other_collection.name
    end

    # Redefine double == to return true when names are the same.
    def ==(other)
        name == other.name
    end

    # Alias == to eql?. Generally, we don't alias equal? as that method is reserved for strict identity checks.
    def eql?(other)
        self == other
    end
end

c = Collection.new("World Leaders")
c << b
c << Book.new("People Kind", "Justin Trudeau", 2028)
p c