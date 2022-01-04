CREATE TABLE patients(
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR,
    date_of_birth date
);

CREATE TABLE treatments(
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    type VARCHAR,
    name VARCHAR
);

CREATE TABLE invoices(
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id INT,
     CONSTRAINT fk_medical_his FOREIGN KEY(medical_history_id)
    REFERENCES medical_histories(id)
);

CREATE TABLE medical_histories(
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    admitted_at timestamp,
    patient_id INT,
    status VARCHAR,
     CONSTRAINT fk_patients FOREIGN KEY(patient_id)
    REFERENCES patients(id)
);

CREATE TABLE invoice_items(
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    unit_price decimal,
    quantity INT,
    total_price decimal,
    invoice_id INT,
    treatment_id INT,
     CONSTRAINT fk_invoice FOREIGN KEY(invoice_id)
    REFERENCES invoices(id),
  CONSTRAINT fk_treatment FOREIGN KEY(treatment_id)
    REFERENCES treatments(id)
);

-- creating a many to many relationship between treatment and medical_history
CREATE TABLE medical_treatment(
    medical_id INT,
    treatment_id INT,
    CONSTRAINT fk_medical_history FOREIGN KEY(medical_id)
    REFERENCES medical_histories(id),
    CONSTRAINT fk_medical_treatment FOREIGN KEY(treatment_id)
    REFERENCES treatments(id)
);