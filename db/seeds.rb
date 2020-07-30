require 'faker'

Doctor.destroy_all
Patient.destroy_all
City.destroy_all
Appointment.destroy_all
DoctorSpeciality.destroy_all
Speciality.destroy_all

nbdoctor = 120
nbpatient = 800
doctors = Array.new
patients = Array.new
cities = Array.new
specialities = Array.new
array_of_specialities = ["Cardiology" ,"Clinical neurophysiology","Craniofacial surgery","Dermatology","Endocrinology","Family and General Medicine","Gastroenterologic surgery","Gastroenterology","General Practice","General surgery","Geriatrics","Hematology","Immunology","Infectious diseases","Internal medicine","Laboratory medicine","Nephrology","Neuropsychiatry","Neurology", "General", "Anesthesiology", "Cardiothoracic surgery", "Dermatology"]

50.times do 
  city = City.create(name: Faker::Address.city)
  cities << city
  puts "Seeding City #{city.name}"
end

array_of_specialities.size.times do |i|
  speciality = Speciality.create(name: array_of_specialities[i])
  specialities << speciality
  puts "Seeding Speciality #{speciality.name}"
end

120.times do 
  doctor = Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Address.zip_code,
    city_id: cities[rand(0..49)].id)
    doctors << doctor
    puts "Seeding Doctor #{doctor.first_name} #{doctor.last_name}"
end

800.times do
  patient = Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city_id: cities[rand(0..49)].id)
    patients << patient
    puts "Seeding Patient #{patient.first_name} #{patient.last_name}"
end

1200.times do
  appointment = Appointment.create(
    doctor_id: doctors[rand(0..nbdoctor-1)].id,
    patient_id: patients[rand(0..nbpatient-1)].id,
    city_id: cities[rand(0..49)].id,
    date: Time.at(rand * Time.now.to_i))
    puts "Seeding Appointment #{appointment.city_id}"
end

  120.times do |i|
    doc_spe = DoctorSpeciality.create(
        doctor_id: doctors[i].id,
        speciality_id: specialities[rand(1..array_of_specialities.size-1)].id)
    puts "Seeding a Speciality to Doctor #{doctors[i].last_name}"
  end

  65.times do
    doc_spe = DoctorSpeciality.create(
        doctor_id: doctors[rand(0..nbdoctor-1)].id,
        speciality_id: specialities[rand(1..array_of_specialities.size-1)].id)
    puts "Seeding an another Random speciality to a random Doctor "
  end