CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    eh_maior_idade BOOLEAN NOT NULL,
    id_responsavel_legal INT,
    tipo_perfil VARCHAR(50) NOT NULL,
    consentimento_lgpd_geo BOOLEAN NOT NULL,
    data_cadastro TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_usuario_responsavel FOREIGN KEY (id_responsavel_legal) REFERENCES usuario (id_usuario)
);

INSERT INTO usuario (id_usuario, nome, email, senha_hash, data_nascimento, eh_maior_idade, id_responsavel_legal, tipo_perfil, consentimento_lgpd_geo)
VALUES
    (1, 'João Silva', 'joao@email.com', '$2a$10$ExemploSenhaHash123', '1995-05-15', TRUE, NULL, 'viajante', TRUE),
    (2, 'Maria Santos', 'maria@email.com', '$2a$10$ExemploSenhaHash456', '1998-08-22', TRUE, NULL, 'viajante', TRUE),
    (3, 'Pedro Oliveira', 'pedro@email.com', '$2a$10$ExemploSenhaHash789', '1992-11-10', TRUE, NULL, 'viajante', TRUE),
    (4, 'Ana Costa', 'ana@email.com', '$2a$10$ExemploSenhaHash012', '2000-03-05', TRUE, NULL, 'viajante', TRUE),
    (5, 'Lucas Mendes', 'lucas@email.com', '$2a$10$ExemploSenhaHash345', '1997-07-30', TRUE, NULL, 'moderador', TRUE),
    (6, 'Beatriz Lima', 'beatriz@email.com', '$2a$10$ExemploSenhaHash678', '1994-12-12', TRUE, NULL, 'moderador', TRUE),
    (7, 'Carlos Ferreira', 'carlos@email.com', '$2a$10$ExemploSenhaHash901', '1999-06-25', TRUE, NULL, 'moderador', TRUE),
    (8, 'Fernanda Rocha', 'fernanda@email.com', '$2a$10$ExemploSenhaHash234', '1996-09-18', TRUE, NULL, 'administrador', TRUE),
    (9, 'Thiago Nunes', 'thiago@email.com', '$2a$10$ExemploSenhaHash567', '2001-04-08', TRUE, NULL, 'viajante', TRUE),
    (10, 'Juliana Almeida', 'juliana@email.com', '$2a$10$ExemploSenhaHash890', '1993-01-20', TRUE, NULL, 'viajante', TRUE);


CREATE TABLE viagem (
    id_viagem SERIAL PRIMARY KEY,
    id_viajante INT NOT NULL,
    titulo_viagem VARCHAR(255) NOT NULL,
    destino_cidade VARCHAR(100) NOT NULL,
    destino_pais VARCHAR(100) NOT NULL,
    fuso_horario_destino VARCHAR(50) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    orcamento_total DECIMAL(12,2) NOT NULL,
    ativa BOOLEAN NOT NULL DEFAULT TRUE,
    data_criacao TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_viagem_usuario FOREIGN KEY (id_viajante) REFERENCES usuario (id_usuario)
);

INSERT INTO viagem (id_viagem, id_viajante, titulo_viagem, destino_cidade, destino_pais, fuso_horario_destino, data_inicio, data_fim, orcamento_total, ativa)
VALUES
    (1, 1, 'Férias na praia', 'Rio de Janeiro', 'Brasil', 'BRT', '2025-12-15', '2025-12-20', 4500.00, TRUE),
    (2, 2, 'Trabalho em Paris', 'Paris', 'França', 'CET', '2025-11-10', '2025-11-15', 3200.00, FALSE),
    (3, 3, 'Viagem para Tóquio', 'Tóquio', 'Japão', 'JST', '2025-10-25', '2025-10-30', 1800.00, TRUE),
    (4, 1, 'Casamento em Florença', 'Florença', 'Itália', 'CET', '2025-08-10', '2025-08-15', 5200.00, TRUE);


CREATE TABLE estabelecimento (
    id_estabelecimento SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    categoria_estabelecimento VARCHAR(255) NOT NULL,
    faixa_preco VARCHAR(255) NOT NULL,
    avaliacao_media DECIMAL(3,2),
    latitude DECIMAL(10,8) NOT NULL,
    longitude DECIMAL(11,8) NOT NULL,
    horario_abertura TIME,
    horario_fechamento TIME,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

INSERT INTO estabelecimento (id_estabelecimento, nome, categoria_estabelecimento, faixa_preco, avaliacao_media, latitude, longitude, horario_abertura, horario_fechamento, ativo)
VALUES
    (101, 'Café do Povo', 'Cafeteria', 'Barato', 4.80, -25.4284, -49.2733, '07:00', '18:00', TRUE),
    (102, 'Padaria do Tio Zé', 'Padaria', 'Barato', 4.50, -25.4284, -49.2733, '06:00', '20:00', TRUE),
    (103, 'Churrascaria do Zé', 'Restaurante', 'Médio', 4.90, -25.4284, -49.2733, '12:00', '23:00', TRUE),
    (104, 'Mercado Central', 'Supermercado', 'Barato', 4.70, -25.4284, -49.2733, '08:00', '22:00', TRUE),
    (105, 'Lanchonete da Maria', 'Lanchonete', 'Barato', 4.60, -25.4284, -49.2733, '08:00', '22:00', TRUE),
    (106, 'Bar do Chico', 'Bar', 'Médio', 4.40, -25.4284, -49.2733, '16:00', '02:00', TRUE),
    (107, 'Sorveteria Geladinha', 'Sorveteria', 'Barato', 4.90, -25.4284, -49.2733, '11:00', '23:00', TRUE),
    (108, 'Restaurante do João', 'Restaurante', 'Médio', 4.80, -25.4284, -49.2733, '12:00', '23:00', TRUE),
    (109, 'Pet Shop do Bidu', 'Pet Shop', 'Barato', 4.70, -25.4284, -49.2733, '09:00', '20:00', TRUE),
    (110, 'Clínica do Dr. Pedro', 'Clínica', 'Médio', 4.90, -25.4284, -49.2733, '08:00', '20:00', TRUE);


CREATE TABLE estabelecimento_favorito (
    id_favorito SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_estabelecimento INT NOT NULL,
    data_adicao TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_favorito_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    CONSTRAINT fk_favorito_estabelecimento FOREIGN KEY (id_estabelecimento) REFERENCES estabelecimento (id_estabelecimento)
);

INSERT INTO estabelecimento_favorito (id_usuario, id_estabelecimento)
VALUES
    (1, 101), (1, 102), (1, 106),
    (2, 103), (2, 104), (2, 107),
    (3, 105), (3, 108),
    (4, 109), (4, 110);


CREATE TABLE despesa_viagem (
    id_despesa SERIAL PRIMARY KEY,
    id_viagem INT NOT NULL,
    categoria_despesa VARCHAR(100) NOT NULL,
    descricao VARCHAR(150) NOT NULL,
    valor_despesa DECIMAL(10,2) NOT NULL,
    data_despesa TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_despesa_viagem FOREIGN KEY (id_viagem) REFERENCES viagem (id_viagem)
);

INSERT INTO despesa_viagem (id_viagem, categoria_despesa, descricao, valor_despesa)
VALUES
    (1, 'Alimentação', 'Café expresso duplo', 2.50),
    (1, 'Transporte', 'Táxi para o hotel', 45.00),
    (2, 'Alimentação', 'Pão de queijo e café', 8.50),
    (2, 'Transporte', 'Passagem de metrô', 3.80),
    (3, 'Transporte', 'Passagem local', 20.00),
    (3, 'Hospedagem', 'Internet do hotel', 15.00),
    (4, 'Alimentação', 'Jantar executivo', 35.00),
    (4, 'Passeios', 'Ingresso para museu', 25.00);


CREATE TABLE solicitacao_reembolso (
    id_reembolso SERIAL PRIMARY KEY,
    id_viagem INT NOT NULL,
    id_solicitante INT NOT NULL,
    descricao_incidente TEXT NOT NULL,
    valor_total_pleiteado DECIMAL(10,2) NOT NULL,
    url_comprovante_anexo VARCHAR(255),
    status_reembolso VARCHAR(255) NOT NULL DEFAULT 'pendente',
    id_moderador_analista INT,
    data_solicitacao TIMESTAMP NOT NULL DEFAULT NOW(),
    data_atualizacao TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_reembolso_viagem FOREIGN KEY (id_viagem) REFERENCES viagem (id_viagem),
    CONSTRAINT fk_reembolso_solicitante FOREIGN KEY (id_solicitante) REFERENCES usuario (id_usuario),
    CONSTRAINT fk_reembolso_moderador FOREIGN KEY (id_moderador_analista) REFERENCES usuario (id_usuario)
);

INSERT INTO solicitacao_reembolso (id_viagem, id_solicitante, descricao_incidente, valor_total_pleiteado, url_comprovante_anexo, status_reembolso, id_moderador_analista)
VALUES
    (1, 1, 'Passagem aérea ida e volta', 350.00, 'comprovante_1.pdf', 'aprovado', 5),
    (1, 1, 'Estadia no hotel', 280.00, 'comprovante_2.pdf', 'aprovado', 5),
    (2, 2, 'Alimentação e transporte local', 120.00, 'comprovante_3.pdf', 'aprovado', 6),
    (2, 2, 'Passeios e ingressos', 450.00, NULL, 'pendente', 6),
    (3, 3, 'Transporte local e táxi', 190.00, 'comprovante_5.pdf', 'aprovado', 7);


CREATE TABLE historico_reembolso (
    id_historico SERIAL PRIMARY KEY,
    id_viagem INT NOT NULL,
    data_hora TIMESTAMP NOT NULL DEFAULT NOW(),
    valor_reembolso DECIMAL(10,2) NOT NULL,
    metodo_pagamento VARCHAR(100) NOT NULL,
    status VARCHAR(50) NOT NULL,
    observacao TEXT,
    CONSTRAINT fk_historico_viagem FOREIGN KEY (id_viagem) REFERENCES viagem (id_viagem)
);

INSERT INTO historico_reembolso (id_viagem, valor_reembolso, metodo_pagamento, status, observacao)
VALUES
    (1, 120.50, 'Cartão de Crédito', 'concluido', 'Reembolso de passagem aérea'),
    (1, 85.00, 'Cartão de Crédito', 'concluido', 'Reembolso de hospedagem'),
    (2, 45.30, 'Dinheiro', 'concluido', 'Reembolso de alimentação'),
    (2, 210.00, 'Transferência', 'pendente', 'Aguardando liberação'),
    (3, 68.75, 'Cartão de Crédito', 'concluido', 'Reembolso de transporte'),
    (4, 95.40, 'Cartão de Crédito', 'concluido', 'Reembolso de refeição');


CREATE TABLE bagagem (
    id_bagagem SERIAL PRIMARY KEY,
    id_viagem INT NOT NULL,
    nome_item VARCHAR(100) NOT NULL,
    item_checado BOOLEAN NOT NULL DEFAULT FALSE,
    incluso_manualmente BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT fk_bagagem_viagem FOREIGN KEY (id_viagem) REFERENCES viagem (id_viagem)
);

INSERT INTO bagagem (id_viagem, nome_item, item_checado, incluso_manualmente)
VALUES
    (1, 'Mochila de viagem', TRUE, TRUE),
    (1, 'Maleta de mão', FALSE, TRUE),
    (2, 'Terno de viagem', FALSE, TRUE),
    (2, 'Notebook', TRUE, TRUE),
    (3, 'Guarda-chuva', FALSE, TRUE),
    (4, 'Roupa formal', TRUE, TRUE);


CREATE TABLE item_bagagem_catalago (
    id_item_bagagem_catalago SERIAL PRIMARY KEY,
    nome_item VARCHAR(100) NOT NULL UNIQUE,
    perfil_viagem VARCHAR(255),
    tipo_viagem VARCHAR(255),
    clima_indicado VARCHAR(30)
);

INSERT INTO item_bagagem_catalago (nome_item, perfil_viagem, tipo_viagem, clima_indicado)
VALUES
    ('Mochila de viagem', 'Leve', 'Lazer', 'Médio'),
    ('Maleta de cabine', 'Executivo', 'Trabalho', 'Médio'),
    ('Valise grande', 'Turista', 'Lazer', 'Quente'),
    ('Saco de dormir', 'Aventura', 'Aventura', 'Frio'),
    ('Guarda-chuva dobrável', 'Todos', 'Todos', 'Chuva');


CREATE TABLE avaliacao_estabelecimento (
    id_avaliacao SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_viagem INT NOT NULL,
    id_estabelecimento INT NOT NULL,
    nota INT NOT NULL CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    data_avaliacao TIMESTAMP NOT NULL DEFAULT NOW(),
    CONSTRAINT fk_avaliacao_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario),
    CONSTRAINT fk_avaliacao_viagem FOREIGN KEY (id_viagem) REFERENCES viagem (id_viagem),
    CONSTRAINT fk_avaliacao_estabelecimento FOREIGN KEY (id_estabelecimento) REFERENCES estabelecimento (id_estabelecimento)
);

INSERT INTO avaliacao_estabelecimento (id_usuario, id_viagem, id_estabelecimento, nota, comentario)
VALUES
    (1, 1, 101, 5, 'Excelente café, super recomendo!'),
    (1, 1, 102, 4, 'Pão de queijo delicioso...'),
    (2, 2, 103, 5, 'Churrasco incrível...'),
    (2, 2, 104, 5, 'Mercado muito completo...'),
    (3, 3, 105, 4, 'Lanche bom e rápido...'),
    (3, 3, 106, 5, 'Barzinho muito agradável...'),
    (1, 4, 107, 5, 'Sorvete da melhor qualidade...'),
    (2, 2, 108, 5, 'Restaurante com comida deliciosa...');
