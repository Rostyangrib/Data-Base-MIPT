CREATE TABLE OWNER (
    owner_id INTEGER PRIMARY KEY,
    first_name VARCHAR(200) NOT NULL,                
    last_name VARCHAR(200) NOT NULL,                
    birth DATE NOT NULL,
    gender CHAR(1),
    phone_number VARCHAR(20) NOT NULL CHECK (phone_number ~ '^\+7\d{10}$')
);

CREATE TABLE DOCTOR (
    doctor_id INTEGER PRIMARY KEY,    
    first_name VARCHAR(200) NOT NULL,                   
    last_name VARCHAR(200) NOT NULL,     
    specialty TEXT NOT NULL               
);

CREATE TABLE CLINIC_SERVICES (
    clinic_services_id INTEGER PRIMARY KEY,       
    type_services TEXT NOT NULL
);

CREATE TABLE PATIENT (
    patient_id INTEGER PRIMARY KEY,     
    owner_id INTEGER NOT NULL,                     
    nickname VARCHAR(200),              
    animal VARCHAR(200) NOT NULL,     
    breed VARCHAR(200) NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES OWNER(owner_id)
);

CREATE TABLE APPOINTMENT (
    appointment_id INTEGER PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    doctor_id INTEGER NOT NULL,
    clinic_services_id INTEGER NOT NULL,
    appointment_time TIMESTAMP NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES DOCTOR(doctor_id),
    FOREIGN KEY (clinic_services_id) REFERENCES CLINIC_SERVICES(clinic_services_id)
);

CREATE TABLE MEDICAL_HISTORY (
    medical_history_id  INTEGER PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    appointment_id INTEGER NOT NULL,
    entry TEXT NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id),
    FOREIGN KEY (appointment_id) REFERENCES APPOINTMENT(appointment_id)        
);

CREATE TABLE VACCINATIONS (
    vaccinations_id INTEGER PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id)
);

CREATE TABLE PATIENT_HISTORY (
    history_id INTEGER PRIMARY KEY,
    patient_id INTEGER NOT NULL,
    owner_id INTEGER NOT NULL,
    old_nickname VARCHAR(200) NOT NULL,
    new_nickname VARCHAR(200) NOT NULL,
    changed_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (patient_id) REFERENCES PATIENT(patient_id),
    FOREIGN KEY(owner_id) REFERENCES OWNER(owner_id)
);







