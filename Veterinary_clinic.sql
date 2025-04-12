CREATE TABLE owner (
    owner_id INTEGER primary key,
    first_name VARCHAR(200) not null ,                
    last_name VARCHAR(200) not null,                
    birth DATE NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'Ж')),
    phone_number VARCHAR(20) NOT NULL CHECK (phone_number ~ '^\+7\d{10}$')
);

CREATE TABLE doctor (
    doctor_id INTEGER PRIMARY KEY,    
    first_name VARCHAR(200) NOT NULL,                   
    last_name VARCHAR(200) NOT NULL,     
    specialty TEXT NOT NULL               
);

CREATE TABLE clinic_services (
    clinic_services_id INTEGER PRIMARY KEY,       
    type_services TEXT NOT NULL
);

CREATE TABLE patient (
    patient_id INTEGER PRIMARY KEY,     
    owner_id INTEGER NOT NULL,                     
    nickname VARCHAR(200),              
    animal VARCHAR(200) NOT NULL,     
    breed VARCHAR(200) NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES owner(owner_id)
);

CREATE TABLE appointment (
    appointment_id INTEGER PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    doctor_id INTEGER NOT NULL,
    clinic_services_id INTEGER NOT NULL,
    appointment_time TIMESTAMP NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id),
    FOREIGN KEY (clinic_services_id) REFERENCES clinic_services(clinic_services_id)
);

CREATE TABLE medical_history (
    medical_history_id  INTEGER PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    appointment_id INTEGER NOT NULL,
    entry TEXT NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(appointment_id)        
);

CREATE TABLE vaccinations (
    vaccinations_id INTEGER PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE patient_history (
    history_id INTEGER PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    owner_id INTEGER NOT NULL,
    old_nickname VARCHAR(200) NOT NULL,
    new_nickname VARCHAR(200) NOT NULL,
    changed_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
    FOREIGN KEY(owner_id) REFERENCES owner(owner_id)
);