-- Inserção de dados fictícios na tabela de pessoas
INSERT INTO crm.person (name, email) VALUES
('João Silva', 'joao.silva@example.com'),
('Maria Oliveira', 'maria.oliveira@example.com'),
('Carlos Pereira', 'carlos.pereira@example.com'),
('Ana Costa', 'ana.costa@example.com');

-- Inserção de dados fictícios na tabela de endereços
INSERT INTO crm.address (person_id, street, postalcode) VALUES
(1, 'Rua das Flores', '01001-000'),
(1, 'Avenida Paulista', '01310-100'),
(2, 'Rua dos Lírios', '20001-000'),
(3, 'Rua dos Girassóis', '30140-100'),
(4, 'Rua das Margaridas', '90050-000');