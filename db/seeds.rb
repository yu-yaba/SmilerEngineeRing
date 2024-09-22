# db/seeds.rb

require "securerandom"

# データベースの既存データを削除（開発環境のみ）
puts "Cleaning database..."
Link.destroy_all
CustomField.destroy_all
Place.destroy_all
Event.destroy_all
Person.destroy_all
User.destroy_all

# ユーザーの作成
puts "Creating users..."
user1 = User.create!(
  user_id: SecureRandom.uuid,
  email: "john.doe@example.com",
  password: "password123",            # Devise によって encrypted_password が自動生成される
  password_confirmation: "password123",
  username: "johndoe",
  last_login: Time.current,
  is_active: true
)

user2 = User.create!(
  user_id: SecureRandom.uuid,
  email: "jane.smith@example.com",
  password: "password123",
  password_confirmation: "password123",
  username: "janesmith",
  last_login: Time.current,
  is_active: true
)

puts "Created #{User.count} users."

# 人物の作成
puts "Creating people..."
person1 = Person.create!(
  person_id: SecureRandom.uuid,
  user_id: user1.user_id,
  name: "Alice Johnson",
  phone_number: "123-456-7890",
  email: "alice.johnson@example.com",
  address: "123 Maple Street, Springfield",
  organization: "Tech Corp",
  met_date: Date.today - 30,
  notes: "Met at Tech Conference.",
  url: "https://alicejohnson.com"
)

person2 = Person.create!(
  person_id: SecureRandom.uuid,
  user_id: user2.user_id,
  name: "Bob Williams",
  phone_number: "987-654-3210",
  email: "bob.williams@example.com",
  address: "456 Oak Avenue, Metropolis",
  organization: "Innovate LLC",
  met_date: Date.today - 60,
  notes: "Collaborated on project X.",
  url: "https://bobwilliams.com"
)

puts "Created #{Person.count} people."

# イベントの作成
puts "Creating events..."
event1 = Event.create!(
  event_id: SecureRandom.uuid,
  user_id: user1.user_id,
  name: "Tech Conference 2024",
  event_date: Date.today + 10,
  description: "Annual tech conference focusing on AI and Machine Learning.",
  url: "https://techconference2024.com"
)

event2 = Event.create!(
  event_id: SecureRandom.uuid,
  user_id: user2.user_id,
  name: "Startup Meetup",
  event_date: Date.today + 20,
  description: "Networking event for startup founders and investors.",
  url: "https://startupmeetup.com"
)

puts "Created #{Event.count} events."

# 場所の作成
puts "Creating places..."
place1 = Place.create!(
  place_id: SecureRandom.uuid,
  user_id: user1.user_id,
  name: "Central Park",
  address: "789 Pine Road, Gotham",
  visited_date: Date.today - 15,
  description: "A beautiful park in the heart of the city.",
  url: "https://centralpark.com"
)

place2 = Place.create!(
  place_id: SecureRandom.uuid,
  user_id: user2.user_id,
  name: "Innovation Hub",
  address: "321 Birch Lane, Star City",
  visited_date: Date.today - 45,
  description: "A hub for innovation and creativity.",
  url: "https://innovationhub.com"
)

puts "Created #{Place.count} places."

# リンクの作成
puts "Creating links..."
link1 = Link.create!(
  link_id: SecureRandom.uuid,
  user_id: user1.user_id,
  from_node_type: "Person",
  from_node_id: person1.person_id,
  to_node_type: "Event",
  to_node_id: event1.event_id,
)

link2 = Link.create!(
  link_id: SecureRandom.uuid,
  user_id: user2.user_id,
  from_node_type: "Event",
  from_node_id: event2.event_id,
  to_node_type: "Place",
  to_node_id: place2.place_id,
)

link3 = Link.create!(
  link_id: SecureRandom.uuid,
  user_id: user1.user_id,
  from_node_type: "Person",
  from_node_id: person1.person_id,
  to_node_type: "Place",
  to_node_id: place1.place_id,
)

puts "Created #{Link.count} links."

# カスタムフィールドの作成
puts "Creating custom fields..."
custom_field1 = CustomField.create!(
  custom_field_id: SecureRandom.uuid,
  user_id: user1.user_id,
  entity_type: "Person",
  entity_id: person1.person_id,
  field_name: "Nickname",
  field_value: "Ally"
)

custom_field2 = CustomField.create!(
  custom_field_id: SecureRandom.uuid,
  user_id: user2.user_id,
  entity_type: "Event",
  entity_id: event2.event_id,
  field_name: "Organizer",
  field_value: "Jane Smith"
)

custom_field3 = CustomField.create!(
  custom_field_id: SecureRandom.uuid,
  user_id: user1.user_id,
  entity_type: "Place",
  entity_id: place1.place_id,
  field_name: "Capacity",
  field_value: "500 people"
)

puts "Created #{CustomField.count} custom fields."

puts "Seeding completed successfully."
