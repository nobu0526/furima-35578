class ShippingDay < ActiveHash::Base
  self.data = [
    {id: 1, name: '--'}, 
    {id: 2, name: '1日から2日で発送'}, 
    {id: 3, name: '2日から3日で発送'}, 
    {id: 4, name: '4日から7日で発送'}, 
  ]

  include ActiveHash::Associations
  has_many :items
  
end