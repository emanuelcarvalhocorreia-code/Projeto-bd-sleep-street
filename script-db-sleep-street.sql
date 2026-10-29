ADD CONSTRAINT fk_viagem_usuario
FOREIGN KEY (id_viajante) REFERENCES usuario (id_usuario);

CREATE TABLE viagem (
id_viagem   SERIAL PRIMARY KEY,
id_viajante INT not null,
titulo_viagem varchar(255) not null,
destino_cidade varchar(100) not null,
destino_pais varchar(100) not null,
fuso_horario_destino varchar(50) not null,
data_inicio date not null,
data_fim date not null,
orcamento_total decimal(12,2) not null,
ativa boolean,
data_criacao timestamp

)

INSERT INTO viagem (
id_viagem,
id_viajante,
titulo_viagem,
destino_cidade,
destino_pais,
fuso_horario_destino,
data_inicio,
data_fim,
orcamento_total,
ativa,
data_criacao
)
VALUES
(1, 123, 'Férias na praia', 'Rio de Janeiro', 'Brasil', 'BRT', '2025-12-15', '2025-12-20', 4500.00, TRUE, NOW()),
(2, 456, 'Trabalho em Paris', 'Paris', 'França', 'CET', '2025-11-10', '2025-11-15', 3200.00, FALSE, NOW()),
(3, 789, 'Viagem para Tóquio', 'Tóquio', 'Japão', 'JST', '2025-10-25', '2025-10-30', 1800.00, TRUE, NOW()),
(4, 123, 'Casamento em Florença', 'Florença', 'Itália', 'CET', '2025-08-10', '2025-08-15', 5200.00, TRUE, NOW());

SELECT * FROM viagem;

ADD CONSTRAINT fk_viagem_usuario
FOREIGN KEY (id_viajante) REFERENCES usuario (id_usuario);

CREATE TABLE usuario (
id_usuario            SERIAL PRIMARY KEY,
nome                  varchar(100) NOT NULL,
email                 varchar(100) NOT NULL UNIQUE,
senha_hash            varchar(255) NOT NULL,
data_nascimento       date NOT NULL,
eh_maior_idade        boolean NOT NULL,
id_responsavel_legal  int,
tipo_perfil           varchar(50) NOT NULL,
consentimento_lgpd_geo boolean NOT NULL,
data_cadastro         timestamp DEFAULT now()
    
INSERT INTO usuario (
    id_usuario,
    nome,
    email,
    senha_hash,
    data_nascimento,
    eh_maior_idade,
    id_responsavel_legal,
    tipo_perfil,
    consentimento_lgpd_geo,
    data_cadastro
)
VALUES
    (1, 'João Silva', 'joao@email.com', '$2a$10$ExemploSenhaHash123', '1995-05-15', TRUE, NULL, 'viajante', TRUE, NOW()),
    (2, 'Maria Santos', 'maria@email.com', '$2a$10$ExemploSenhaHash456', '1998-08-22', TRUE, NULL, 'viajante', TRUE, NOW()),
    (3, 'Pedro Oliveira', 'pedro@email.com', '$2a$10$ExemploSenhaHash789', '1992-11-10', TRUE, NULL, 'viajante', TRUE, NOW()),
    (4, 'Ana Costa', 'ana@email.com', '$2a$10$ExemploSenhaHash012', '2000-03-05', TRUE, NULL, 'viajante', TRUE, NOW()),
    (5, 'Lucas Mendes', 'lucas@email.com', '$2a$10$ExemploSenhaHash345', '1997-07-30', TRUE, NULL, 'viajante', TRUE, NOW()),
    (6, 'Beatriz Lima', 'beatriz@email.com', '$2a$10$ExemploSenhaHash678', '1994-12-12', TRUE, NULL, 'viajante', TRUE, NOW()),
    (7, 'Carlos Ferreira', 'carlos@email.com', '$2a$10$ExemploSenhaHash901', '1999-06-25', TRUE, NULL, 'viajante', TRUE, NOW()),
    (8, 'Fernanda Rocha', 'fernanda@email.com', '$2a$10$ExemploSenhaHash234', '1996-09-18', TRUE, NULL, 'viajante', TRUE, NOW()),
    (9, 'Thiago Nunes', 'thiago@email.com', '$2a$10$ExemploSenhaHash567', '2001-04-08', TRUE, NULL, 'viajante', TRUE, NOW()),
    (10, 'Juliana Almeida', 'juliana@email.com', '$2a$10$ExemploSenhaHash890', '1993-01-20', TRUE, NULL, 'viajante', TRUE, NOW());
     select * from usuario

CREATE TABLE estabelecimento_favorito(
id_favorito SERIAL PRIMARY KEY,
id_usuario int not null,
id_estabelecimento int not null,
data_adicao timestamp
) 
INSERT INTO estabelecimento_favorito (
    id_usuario,
    id_estabelecimento,
    data_adicao
)
VALUES
    (123, 101, NOW()),
    (123, 102, NOW()),
    (456, 103, NOW()),
    (456, 104, NOW()),
    (789, 105, NOW()),
    (123, 106, NOW()),
    (456, 107, NOW()),
    (789, 108, NOW()),
    (123, 109, NOW()),
    (456, 110, NOW());

CREATE TABLE estabelecimento(
id_estabelecimento  SERIAL PRIMARY KEY,
nome varchar(150) not null,
categoria_estabelecimento varchar(255) not null,
faixa_preco varchar(255) not null,
avaliacao_media decimal(3,2),
latitude decimal(10,8) not null,
longitude decimal(11,8) not null,
horario_abertura time,
horario_fechamento time,
ativo boolean
)
    
INSERT INTO estabelecimento (
    id_estabelecimento,
    nome,
    categoria_estabelecimento,
    faixa_preco,
    avaliacao_media,
    latitude,
    longitude,
    horario_abertura,
    horario_fechamento,
    ativo
)
VALUES
    (101, 'Café do Povo', 'Cafeteria', 'Barato', 4.8, -25.4284, -49.2733, '07:00', '18:00', TRUE),
    (102, 'Padaria do Tio Zé', 'Padaria', 'Barato', 4.5, -25.4284, -49.2733, '06:00', '20:00', TRUE),
    (103, 'Churrascaria do Zé', 'Restaurante', 'Médio', 4.9, -25.4284, -49.2733, '12:00', '23:00', TRUE),
    (104, 'Mercado Central', 'Supermercado', 'Barato', 4.7, -25.4284, -49.2733, '08:00', '22:00', TRUE),
    (105, 'Lanchonete da Maria', 'Lanchonete', 'Barato', 4.6, -25.4284, -49.2733, '08:00', '22:00', TRUE),
    (106, 'Bar do Chico', 'Bar', 'Médio', 4.4, -25.4284, -49.2733, '16:00', '02:00', TRUE),
    (107, 'Sorveteria Geladinha', 'Sorveteria', 'Barato', 4.9, -25.4284, -49.2733, '11:00', '23:00', TRUE),
    (108, 'Restaurante do João', 'Restaurante', 'Médio', 4.8, -25.4284, -49.2733, '12:00', '23:00', TRUE),
    (109, 'Pet Shop do Bidu', 'Pet Shop', 'Barato', 4.7, -25.4284, -49.2733, '09:00', '20:00', TRUE),
    (110, 'Clínica do Dr. Pedro', 'Clínica', 'Médio', 4.9, -25.4284, -49.2733, '08:00', '20:00', TRUE);

CREATE TABLE despesa_viagem(
id_despesa  SERIAL PRIMARY KEY,
id_viagem int not null,
categoria_despesa_enum varchar not null,
descricao varchar(150) not null,
valor_despesa decimal(10,2) not null,
data_despesa timestamp
)

INSERT INTO despeja_viagem (
id_despeja_viagem,
id_usuario,
id_estabelecimento,
id_viajem,
data_hora_despeja,
quantidade,
observacao
)
VALUES
(1, 123, 101, 1, NOW(), 2.5, 'Café expresso duplo'),
(2, 123, 102, 2, NOW(), 1.0, 'Pão de queijo 3 unidades'),
(3, 456, 103, 1, NOW(), 0.8, 'Cerveja artesanal 500ml'),
(4, 456, 104, 3, NOW(), 3.0, 'Água mineral 2L'),
(5, 789, 105, 2, NOW(), 4.0, 'Lanche misto 2 unidades'),
(6, 789, 106, 1, NOW(), 1.2, 'Cerveja lager 600ml'),
(7, 123, 107, 4, NOW(), 1.5, 'Sorvete de chocolate 200g'),
(8, 456, 108, 2, NOW(), 2.0, 'Suco natural laranja 300ml'),
(9, 789, 109, 1, NOW(), 0.5, 'Ração para cães 500g'),
(10, 123, 110, 3, NOW(), 1.0, 'Medicamento para pets 100ml');

CREATE TABLE historico_status_reembolso(
id_historico  SERIAL PRIMARY KEY,
id_reembolso int not null,
status_reembolso varchar(255),
status_reembolso_enum varchar not null,
observacao_moderador text,
id_modificador int not null,
data_modificacao timestamp
)
INSERT INTO historico_reembolso (
id_historico_reembolso,
id_usuario,
id_viajem,
data_hora,
valor_reembolso,
metodo_pagamento,
status,
observacao
)
VALUES
(1, 123, 1, NOW(), 120.50, 'Cartão de Crédito', 'concluido', 'Reembolso de passagem aérea'),
(2, 123, 2, NOW(), 85.00, 'Cartão de Crédito', 'concluido', 'Reembolso de hotel'),
(3, 456, 3, NOW(), 45.30, 'Dinheiro', 'concluido', 'Reembolso de alimentação'),
(4, 456, 4, NOW(), 210.00, 'Transferência', 'pendente', 'Aguardando liberação do banco'),
(5, 789, 5, NOW(), 68.75, 'Cartão de Crédito', 'concluido', 'Reembolso de transporte local'),
(6, 789, 6, NOW(), 95.40, 'Cartão de Crédito', 'concluido', 'Reembolso de alimentação'),
(7, 123, 7, NOW(), 152.00, 'Dinheiro', 'concluido', 'Reembolso de ingresso'),
(8, 456, 8, NOW(), 37.50, 'Cartão de Crédito', 'concluido', 'Reembolso de compra local'),
(9, 789, 9, NOW(), 120.00, 'Transferência', 'concluido', 'Reembolso de depósito'),
(10, 123, 10, NOW(), 55.00, 'Cartão de Crédito', 'pendente', 'Aguardando aprovação');

CREATE TABLE bagagem (
id_checklist_item  SERIAL PRIMARY KEY,
id_viagem int not null,
nome_item varchar(100) not null,
item_checado boolean,
incluso_manualmente boolean
)
INSERT INTO bagagem (
id_bagagem,
id_usuario,
id_viajem,
peso_kg,
dimensoes,
data_checkin,
status,
observacao
)
VALUES
(1, 123, 1, 12.5, '55x40x20', '2025-12-15 06:00', 'pendente', 'Bagagem de mão'),
(2, 123, 2, 15.0, '65x45x30', '2025-12-18 07:30', 'checkin', 'Bagagem grande'),
(3, 456, 3, 8.0, '45x30x20', '2025-11-10 08:00', 'embarcado', 'Bagagem de mão'),
(4, 456, 4, 20.0, '70x50x30', '2025-11-12 10:00', 'checkin', 'Bagagem despachada'),
(5, 789, 5, 10.0, '50x40x25', '2025-10-25 05:30', 'pendente', 'Bagagem de mão'),
(6, 789, 6, 7.5, '45x30x20', '2025-10-28 09:00', 'checkin', 'Bagagem de mão'),
(7, 123, 7, 18.0, '60x45x25', '2025-08-10 06:00', 'checkin', 'Bagagem despachada'),
(8, 456, 8, 9.0, '50x40x25', '2025-08-12 08:30', 'embarcado', 'Bagagem de mão'),
(9, 789, 9, 6.0, '40x30x20', '2025-08-10 07:00', 'checkin', 'Bagagem pequena'),
(10, 123, 10, 14.0, '55x40x25', '2025-08-15 05:00', 'checkin', 'Bagagem de mão');

CREATE TABLE  item_bagagem_catalogo(
id_item_bagagem_catalogo  SERIAL PRIMARY KEY ,
nome_item varchar(100) not null ,
perfil_viagem  varchar(255),
tipo_viagem varchar(255),
clima_indicado varchar(30)
)
INSERT INTO item_bagagem_catalago (
id_item_bagagem_catalago,
nome_item,
tipo,
dimensoes,
peso_maximo_kg,
descricao,
status
)
VALUES
(1, 'Mochila de viagem', 'Mochila', '45x30x20', 5.0, 'Mochila impermeável com compartimento interno', 'disponivel'),
(2, 'Maleta de cabine', 'Maleta', '55x35x20', 7.0, 'Maleta rígida com rodas', 'disponivel'),
(3, 'Valise grande', 'Maleta', '70x45x30', 12.0, 'Valise para despache com compartimento expandível', 'disponivel'),
(4, 'Saco de dormir', 'Acessório', '120x70x40', 1.5, 'Saco de dormir leve e confortável', 'disponivel'),
(5, 'Saco de lona', 'Acessório', '80x60x30', 2.0, 'Saco de lona para compras e equipamentos', 'disponivel'),
(6, 'Cinto de segurança', 'Acessório', '100x3', 0.3, 'Cinto de segurança para aviões', 'disponivel'),
(7, 'Kit de primeiros socorros', 'Acessório', '30x20x10', 1.2, 'Kit de primeiros socorros completo', 'disponivel'),
(8, 'Monitor de ar', 'Acessório', '20x15x10', 0.8, 'Monitor de ar com medidor de pressão', 'disponivel'),
(9, 'Guarda-chuva dobrável', 'Acessório', '120x80x10', 0.4, 'Guarda-chuva resistente à chuva', 'disponivel'),
(10, 'Lanterna LED', 'Acessório', '15x10x5', 0.2, 'Lanterna LED recarregável', 'disponivel');

CREATE TABLE solicitacao_reembolso(
id_reembolso  SERIAL PRIMARY KEY ,
id_viagem int not null,
id_solicitante INT NOT NULL,
descricao_incidente text not null,
valor_total_pleiteado decimal (10,2) not null,
url_comprovante_anexo varchar(255)not null,
status_reembolso varchar(255)not null,
id_moderador_analista int,
data_soliticao timestamp,
data_atualizacao timestamp
)

INSERT INTO solicitacao_reembolso (
id_solicitacao_reembolso,
id_usuario,
id_viajem,
data_solicitacao,
valor_solicitado,
descricao,
status,
arquivo_comprovante
)
VALUES
(1, 123, 1, NOW(), 350.00, 'Passagem aérea ida e volta', 'aprovado', 'comprovante_1.pdf'),
(2, 123, 2, NOW(), 280.00, 'Hotel 5 noites', 'aprovado', 'comprovante_2.pdf'),
(3, 456, 3, NOW(), 120.00, 'Alimentação e transporte local', 'aprovado', 'comprovante_3.pdf'),
(4, 456, 4, NOW(), 450.00, 'Ingressos e passeios', 'pendente', NULL),
(5, 789, 5, NOW(), 190.00, 'Transporte local e táxi', 'aprovado', 'comprovante_5.pdf'),
(6, 789, 6, NOW(), 95.00, 'Alimentação', 'aprovado', 'comprovante_6.pdf'),
(7, 123, 7, NOW(), 280.00, 'Ingresso para concerto', 'aprovado', 'comprovante_7.pdf'),
(8, 456, 8, NOW(), 75.00, 'Compras e souvenirs', 'aprovado', 'comprovante_8.pdf'),
(9, 789, 9, NOW(), 200.00, 'Depósito na conta', 'aprovado', 'comprovante_9.pdf'),
(10, 123, 10, NOW(), 85.00, 'Compras no aeroporto', 'pendente', NULL);

CREATE TABLE   avaliacao_estabelecimento( 
id_avaliacao  SERIAL PRIMARY KEY  ,
id_usuarío INT NOT NULL,
id_viagem        int not null,
nome                int not null,
comentario           text,
data_avaliacao timestamp
)
 INSERT INTO avaliacao_estabelecimento (
    id_avaliacao,
    id_estabelecimento,
    id_usuario,
    data_avaliacao,
    nota,
    comentario,
    status
)
VALUES
    (1, 101, 123, NOW(), 5.0, 'Excelente café, super recomendo! Atendimento ótimo e preço justo.', 'aprovado'),
    (2, 102, 123, NOW(), 4.8, 'Pão de queijo delicioso, sempre fresquinho. Melhor padaria da região!', 'aprovado'),
    (3, 103, 456, NOW(), 4.9, 'Churrasco incrível, carne suculenta e porções generosas.', 'aprovado'),
    (4, 104, 456, NOW(), 4.7, 'Mercado completo com preços acessíveis e produtos de qualidade.', 'aprovado'),
    (5, 105, 789, NOW(), 4.5, 'Lanche bom e rápido, sempre gostoso.', 'aprovado'),
    (6, 106, 789, NOW(), 4.6, 'Barzinho agradável, drinks bem feitos e clima ótimo.', 'aprovado'),
    (7, 107, 123, NOW(), 5.0, 'Sorvete da melhor qualidade, textura perfeita!', 'aprovado'),
    (8, 108, 456, NOW(), 4.8, 'Restaurante com comida deliciosa e ambiente bonito.', 'aprovado'),
    (9, 109, 789, NOW(), 4.9, 'Pet shop com atendimento excelente, produtos de qualidade.', 'aprovado'),
    (10, 110, 123, NOW(), 4.7, 'Clínica profissional, sempre atende muito bem.', 'aprovado');
