# Pet Shelter

class Pet
  attr_reader :pet_type, :name

  def initialize(pet_type, name)
    @pet_type = pet_type
    @name = name
  end

  def to_s
    "a #{pet_type} named #{name}."
  end
end

class Owner # keeps track of who the owner is and how many pets they have
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet) # adding pets to array
    @pets << pet
  end

  def number_of_pets
    pets.size 
  end

  def print_pets
    puts pets
  end
end

class Shelter
  def initialize
    @adoptions = {}
  end

  def adopt(owner, pet) # take an owner and a pet
    owner.add_pet(pet)
    @adoptions[owner.name] ||= owner
  end

  def print_adoptions # P Hanson has adopted the following pets:
    @adoptions.each do |name, owner|
      puts "#{name} has adopted the following pets:"
      owner.print_pets
      puts
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."