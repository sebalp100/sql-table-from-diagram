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

CREATE INDEX idx_patient_id ON medical_histories (patient_id ASC);

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INTEGER REFERENCES medical_histories(id) ON DELETE CASCADE,
    UNIQUE (medical_history_id)
);

CREATE INDEX idx_medical_history_id ON invoices (medical_history_id ASC);

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(150),
    name VARCHAR(100)
);

CREATE TABLE medical_history_treatments (
    medical_history_id INTEGER REFERENCES medical_histories(id) ON DELETE CASCADE,
    treatment_id INTEGER REFERENCES treatments(id) ON DELETE CASCADE,
    UNIQUE (medical_history_id, treatment_id)
);

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INTEGER,
    total_price DECIMAL,
    invoice_id INTEGER REFERENCES invoices(id) ON DELETE CASCADE,
    treatment_id INTEGER REFERENCES treatments(id) ON DELETE CASCADE,
    UNIQUE (invoice_id, treatment_id)
);

CREATE INDEX idx_invoice_id ON invoice_items (invoice_id ASC);
CREATE INDEX idx_treatment_id ON invoice_items (treatment_id ASC);
