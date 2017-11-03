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


def sell_pet_to_customer(shop, name, customer)
    add_pet_to_customer(customer, name)
    add_or_remove_cash(shop, name[:price])
    increase_pets_sold(shop, 1)
    remove_pet_by_name(shop, name)
    customer[:cash] -= name[:price]
end
# #These are 'integration' tests so we want multiple asserts.
# #If one fails the entire test should fail
# def test_sell_pet_to_customer__pet_found
#   customer = @customers[0]
#   pet = find_pet_by_name(@pet_shop,"Arthur")
#
#   sell_pet_to_customer(@pet_shop, pet, customer)
#
#   assert_equal(1, customer_pet_count(customer))
#   assert_equal(1, pets_sold(@pet_shop))
#   assert_equal(1900, total_cash(@pet_shop))
# end
