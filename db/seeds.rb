# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

desc = 'A short description about the breed. Let\'s aim for 30-50 characters'

lily = Breed.create(
    name: 'Lily',
    description: desc,
    max_growth: 25
)
if lily.spritesheet.attach(io: File.open(Rails.root + "app/assets/lily.png"), filename: 'lily.jpg')
    puts 'breed created and attached!'
end

bamboo = Breed.create(
    name: 'Bamboo',
    description: desc,
    max_growth: 19
)
if bamboo.spritesheet.attach(io: File.open(Rails.root + "app/assets/bamboo.png"), filename: 'bamboo.jpg')
    puts 'breed created and attached!'
end

beet = Breed.create(
    name: 'Beet',
    description: desc,
    max_growth: 14
)
if beet.spritesheet.attach(io: File.open(Rails.root + "app/assets/beet.png"), filename: 'beet.jpg')
    puts 'breed created and attached!'
end

bell = Breed.create(
    name: 'Bell',
    description: desc,
    max_growth: 25
)
if bell.spritesheet.attach(io: File.open(Rails.root + "app/assets/bell.png"), filename: 'bell.jpg')
    puts 'breed created and attached!'
end

cactus = Breed.create(
    name: 'Cactus',
    description: desc,
    max_growth: 25
)
if cactus.spritesheet.attach(io: File.open(Rails.root + "app/assets/cactus.png"), filename: 'cactus.jpg')
    puts 'breed created and attached!'
end

carrot = Breed.create(
    name: 'Carrot',
    description: desc,
    max_growth: 20
)
if carrot.spritesheet.attach(io: File.open(Rails.root + "app/assets/carrot.png"), filename: 'carrot.jpg')
    puts 'breed created and attached!'
end

chamomile = Breed.create(
    name: 'Chamomile',
    description: desc,
    max_growth: 25
)
if chamomile.spritesheet.attach(io: File.open(Rails.root + "app/assets/chamomile.png"), filename: 'chamomile.jpg')
    puts 'breed created and attached!'
end

corn = Breed.create(
    name: 'Corn',
    description: desc,
    max_growth: 25
)
if corn.spritesheet.attach(io: File.open(Rails.root + "app/assets/corn.png"), filename: 'corn.jpg')
    puts 'breed created and attached!'
end

eggplant = Breed.create(
    name: 'Eggplant',
    description: desc,
    max_growth: 25
)
if eggplant.spritesheet.attach(io: File.open(Rails.root + "app/assets/eggplant.png"), filename: 'eggplant.jpg')
    puts 'breed created and attached!'
end

fern = Breed.create(
    name: 'Fern',
    description: desc,
    max_growth: 25
)
if fern.spritesheet.attach(io: File.open(Rails.root + "app/assets/fern.png"), filename: 'fern.jpg')
    puts 'breed created and attached!'
end

lotos = Breed.create(
    name: 'Lotos',
    description: desc,
    max_growth: 20
)
if lotos.spritesheet.attach(io: File.open(Rails.root + "app/assets/lotos.png"), filename: 'lotos.jpg')
    puts 'breed created and attached!'
end

mushroom = Breed.create(
    name: 'Mushroom',
    description: desc,
    max_growth: 25
)
if mushroom.spritesheet.attach(io: File.open(Rails.root + "app/assets/mushroom.png"), filename: 'mushroom.jpg')
    puts 'breed created and attached!'
end

pumpkin = Breed.create(
    name: 'Pumpkin',
    description: desc,
    max_growth: 25
)
if pumpkin.spritesheet.attach(io: File.open(Rails.root + "app/assets/pumpkin.png"), filename: 'pumpkin.jpg')
    puts 'breed created and attached!'
end

rose = Breed.create(
    name: 'Rose',
    description: desc,
    max_growth: 18
)
if rose.spritesheet.attach(io: File.open(Rails.root + "app/assets/rose.png"), filename: 'rose.jpg')
    puts 'breed created and attached!'
end

salvia = Breed.create(
    name: 'Salvia',
    description: desc,
    max_growth: 25
)
if salvia.spritesheet.attach(io: File.open(Rails.root + "app/assets/salvia.png"), filename: 'salvia.jpg')
    puts 'breed created and attached!'
end

seaweed = Breed.create(
    name: 'Seaweed',
    description: desc,
    max_growth: 19
)
if seaweed.spritesheet.attach(io: File.open(Rails.root + "app/assets/seaweed.png"), filename: 'seaweed.jpg')
    puts 'breed created and attached!'
end

monster = Breed.create(
    name: 'Monster',
    description: desc,
    max_growth: 17
)
if monster.spritesheet.attach(io: File.open(Rails.root + "app/assets/monster.png"), filename: 'monster.jpg')
    puts 'breed created and attached!'
end

sprout = Breed.create(
    name: 'Sprout',
    description: desc,
    max_growth: 25
)
if sprout.spritesheet.attach(io: File.open(Rails.root + "app/assets/sprout.png"), filename: 'sprout.jpg')
    puts 'breed created and attached!'
end

violet = Breed.create(
    name: 'Violet',
    description: desc,
    max_growth: 25
)
if violet.spritesheet.attach(io: File.open(Rails.root + "app/assets/violet.png"), filename: 'violet.jpg')
    puts 'breed created and attached!'
end

wheat = Breed.create(
    name: 'Wheat',
    description: desc,
    max_growth: 20
)
if wheat.spritesheet.attach(io: File.open(Rails.root + "app/assets/wheat.png"), filename: 'wheat.jpg')
    puts 'breed created and attached!'
end