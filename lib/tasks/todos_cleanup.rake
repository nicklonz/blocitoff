task clean_up: :environment do
  items_before = Item.all.count
  Item.where("created_at <= ?", 7.days.ago).destroy_all
  puts "Deleted #{items_before - Item.all.count} expired todo items"
end