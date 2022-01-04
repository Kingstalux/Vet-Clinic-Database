CREATE TABLE patients(
    ID SERIAL GENERATED AS IDENTITY PRIMARY KEY,
    name VARCHAR,
    date_of_birth date
);

CREATE TABLE treatments(
    ID SERIAL GENERATED AS IDENTITY PRIMARY KEY,
    type VARCHAR,
    name VARCHAR
);

CREATE TABLE invoices(
    ID SERIAL GENERATED AS IDENTITY PRIMARY KEY,
    total_amount decimal,
    generated_at timestamp,
    payed_at timestamp,
    medical_history_id INT
);

CREATE TABLE medical_histories(
    ID SERIAL GENERATED AS IDENTITY PRIMARY KEY,
    admitted_at timestamp,
    patient_id INT,
    status VARCHAR
);

CREATE TABLE invoice_items(
    ID SERIAL GENERATED AS IDENTITY PRIMARY KEY,
    unit_price decimal,
    quantity INT,
    total_price decimal,
    invoice_id INT,
    treatment_id INT
);