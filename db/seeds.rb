# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
specialty = ['Pediatrics', 'Neurology', 'Cardiology', 'Family Medicine']
time = ['9:00 AM', '10:00 AM', '11:00 AM', '12:00 PM', '1:00 PM', '2:00 PM', '3:00 PM', '4:00 PM', '5:00 PM']

10.times do
  physician = Physician.create(
    name: Faker::Name.name,
    specialty: specialty.sample
    )
    # physician will create 10 physicians, then 
    # it will generate 10 patients per physican
    # 10 appoints for each physician
    10.times do 
      patient = Patient.create(
        name: Faker::Name.name,
        age: Faker::Number.within(range: 1..100),
        phone_number: Faker::PhoneNumber.cell_phone
      )
     Appointment.create(
      date: Faker::Date.forward(days: 90),
      time: time.sample,
      patient_id: patient.id,
      physician_id: physician.id
      )
      
      
  end
end

puts 'Data seeded.'