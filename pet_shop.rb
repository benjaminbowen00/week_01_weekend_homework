def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, amount)
  shop[:admin][:total_cash] += amount
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, number)
  shop[:admin][:pets_sold] += number
end

def stock_count(shop)
  return shop[:pets].length
end

def pets_by_breed(shop, breed)
  pets =[]
  for pet in shop[:pets]
    if pet[:breed] == breed
      pets << pet
    end
  end
  return pets
end

def find_pet_by_name(shop, name)
  for pet in shop[:pets]
    if pet[:name] == name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(shop, name)
  for pet in shop[:pets]
    if pet[:name] == name
      shop[:pets].delete(pet)
    end
  end
end
#is it OK to update an array when you are looping through it
#Asked Sandy who said best not to - instead set up variable and delete after the loop

def add_pet_to_stock(shop, new_pet)
  shop[:pets] << new_pet
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

def customer_can_afford_pet(customer, pet)
  (customer[:cash] >= pet[:price])? true:false
end

# first selling to customer test passing
# def sell_pet_to_customer(shop, name, customer)
#     add_pet_to_customer(customer, name)
#     add_or_remove_cash(shop, name[:price])
#     increase_pets_sold(shop, 1)
#     remove_pet_by_name(shop, name)
#     customer[:cash] -= name[:price]
# end

# second selling to customer test passing - inc if name not on list
# def sell_pet_to_customer(shop, name, customer)
#   if name != nil
#     add_pet_to_customer(customer, name)
#     add_or_remove_cash(shop, name[:price])
#     increase_pets_sold(shop, 1)
#     remove_pet_by_name(shop, name)
#     customer[:cash] -= name[:price]
#   end
# end

#all three selling to customer tests passing - inc not enough money
# def sell_pet_to_customer(shop, name, customer)
#   if name != nil
#     if customer_can_afford_pet(customer, name) == true
#       add_pet_to_customer(customer, name)
#       add_or_remove_cash(shop, name[:price])
#       increase_pets_sold(shop, 1)
#       remove_pet_by_name(shop, name)
#       customer[:cash] -= name[:price]
#     end
#   end
# end

#Now updated as input is pet, not the name of the pet.
def sell_pet_to_customer(shop, pet, customer)
  if pet != nil
    if customer_can_afford_pet(customer, pet) == true
      add_pet_to_customer(customer, pet)
      add_or_remove_cash(shop, pet[:price])
      increase_pets_sold(shop, 1)
      remove_pet_by_name(shop, pet[:name])
      customer[:cash] -= pet[:price]
    end
  end
end
