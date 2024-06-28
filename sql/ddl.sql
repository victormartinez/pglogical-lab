CREATE SCHEMA crm;

-- Criação da tabela de pessoas
CREATE TABLE crm.person (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de endereços
CREATE TABLE crm.address (
    id SERIAL PRIMARY KEY,
    person_id INTEGER NOT NULL,
    street VARCHAR(150) NOT NULL,
    postalcode VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (person_id) REFERENCES crm.person(id) ON DELETE CASCADE
);