# frozen_string_literal: true

User.create!(email: 'fillson@example.com', password: '11111111', password_confirmation: '11111111')
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end

Category.create(title: 'Healing potions')
Category.create(title: 'Mana potions')
Category.create(title: 'Herbs')
Category.create(title: 'Ore')
Category.create(title: 'Leather')
Product.create(name: 'Minor Healing Potion', description: 'Use: Restores 25 health. (5 Min Cooldown)',
               image: 'Healing/Minor_Healing_Potion.jpg', price: 0.25, category_id: 1)
Product.create(name: 'Lesser Healing Potion', description: 'Use: Restores 50 health. (5 Min Cooldown)',
               image: 'Healing/Lesser_Healing_Potion.jpg', price: 0.50, category_id: 1)
Product.create(name: 'Healing Potion', description: 'Use: Restores 75 health. (5 Min Cooldown)',
               image: 'Healing/Healing_Potion.jpg', price: 0.75, category_id: 1)
Product.create(name: 'Greater Healing Potion', description: 'Use: Restores 100 health. (5 Min Cooldown)',
               image: 'Healing/Greater_Healing_Potion.jpg', price: 1.00, category_id: 1)
Product.create(name: 'Superior Healing Potion', description: 'Use: Restores 125 health. (5 Min Cooldown)',
               image: 'Healing/Superior_Healing_Potion.jpg', price: 1.25, category_id: 1)

Product.create(name: 'Minor Mana Potion', description: 'Use: Restores 25 mana. (5 Min Cooldown)',
               image: 'Mana/Minor_Mana_Potion.jpg', price: 0.25, category_id: 2)
Product.create(name: 'Lesser Mana Potion', description: 'Use: Restores 50 mana. (5 Min Cooldown)',
               image: 'Mana/Lesser_Mana_Potion.jpg', price: 0.50, category_id: 2)
Product.create(name: 'Mana Potion', description: 'Use: Restores 75 mana. (5 Min Cooldown)',
               image: 'Mana/Mana_Potion.jpg', price: 0.75, category_id: 2)
Product.create(name: 'Greater Mana Potion', description: 'Use: Restores 100 mana. (5 Min Cooldown)',
               image: 'Mana/Greater_Mana_Potion.jpg', price: 1.00, category_id: 2)
Product.create(name: 'Superior Mana Potion', description: 'Use: Restores 125 mana. (5 Min Cooldown)',
               image: 'Mana/Superior_Mana_Potion.jpg', price: 1.25, category_id: 2)

Product.create(name: 'Peacebloom', description: 'Crafting Reagent',
               image: 'Herbs/Peacebloom.jpg', price: 0.10, category_id: 3)
Product.create(name: 'Mageroyal', description: 'Crafting Reagent',
               image: 'Herbs/Mageroyal.jpg', price: 0.20, category_id: 3)
Product.create(name: 'Blindweed', description: 'Crafting Reagent',
               image: 'Herbs/Blindweed.jpg', price: 0.30, category_id: 3)
Product.create(name: 'Kingsblood', description: 'Crafting Reagent',
               image: 'Herbs/Kingsblood.jpg', price: 0.40, category_id: 3)
Product.create(name: 'Steelbloom', description: 'Crafting Reagent',
               image: 'Herbs/Steelbloom.jpg', price: 0.50, category_id: 3)

Product.create(name: 'Copper ore', description: 'Crafting Reagent',
               image: 'Ore/Copper_ore.jpg', price: 0.75, category_id: 4)
Product.create(name: 'Tin ore', description: 'Crafting Reagent',
               image: 'Ore/Tin_ore.jpg', price: 1.00, category_id: 4)
Product.create(name: 'Iron ore', description: 'Crafting Reagent',
               image: 'Ore/Iron_ore.jpg', price: 1.25, category_id: 4)
Product.create(name: 'Silver ore', description: 'Crafting Reagent',
               image: 'Ore/Silver_ore.jpg', price: 1.50, category_id: 4)
Product.create(name: 'Gold ore', description: 'Crafting Reagent',
               image: 'Ore/Gold_ore.jpg', price: 1.75, category_id: 4)

Product.create(name: 'Light leather', description: 'Crafting Reagent',
               image: 'Leather/Light.jpg', price: 0.75, category_id: 5)
Product.create(name: 'Medium leather', description: 'Crafting Reagent',
               image: 'Leather/Medium.jpg', price: 1.00, category_id: 5)
Product.create(name: 'Thick leather', description: 'Crafting Reagent',
               image: 'Leather/Thick.jpg', price: 1.25, category_id: 5)
Product.create(name: 'Heavy leather', description: 'Crafting Reagent',
               image: 'Leather/Heavy.jpg', price: 1.50, category_id: 5)
Product.create(name: 'Rugged leather', description: 'Crafting Reagent',
               image: 'Leather/Rugged.jpg', price: 1.75, category_id: 5)
