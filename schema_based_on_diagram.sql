CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE
);

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admited_at TIMESTAMP,
    patient_id INTEGER REFERENCES patients(id) ON DELETE CASCADE,
    status VARCHAR(100),
    UNIQUE (patient_id)
);

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INTEGER REFERENCES medical_histories(id) ON DELETE CASCADE,
    UNIQUE (medical_history_id)
);
