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
)
INSERT INTO usuario (
    id_usuario,
    id_viajante,
    nome,
    email,
    telefone,
    data_criacao
)

VALUES
    (1, 123, 'João Silva', 'joao@email.com', '(41) 98765-4321'),
    (2, 456, 'Maria Santos', 'maria@email.com', '(41) 99999-9999'),
    (3, 789, 'Pedro Oliveira', 'pedro@email.com', '(41) 98888-8888'),
    (4, 123, 'Ana Costa', 'ana@email.com', '(41) 97777-7777'),
    (5, 456, 'Lucas Mendes', 'lucas@email.com', '(41) 96666-6666'),
    (6, 789, 'Beatriz Lima', 'beatriz@email.com', '(41) 95555-5555'),
    (7, 123, 'Carlos Ferreira', 'carlos@email.com', '(41) 94444-4444'),
    (8, 456, 'Fernanda Rocha', 'fernanda@email.com', '(41) 93333-3333'),
    (9, 789, 'Thiago Nunes', 'thiago@email.com', '(41) 92222-2222'),
    (10, 123, 'Juliana Almeida', 'juliana@email.com', '(41) 91111-1111');

CREATE TABLE estabelecimento_favorito(
 id_favorito SERIAL PRIMARY KEY,
 id_usuario int not null,
 id_estabelecimento int not null,
 data_adicao timestamp
) 
 INSERT INTO estabelecimento_favorito (
    id_estabelecimento_favorito,
    id_usuario,
    id_estabelecimento,
    nome_estabelecimento,
    data_adicionado,
    nota
)
VALUES
    (1, 123, 101, 'Café do Povo', NOW(), 5.0),
    (2, 123, 102, 'Padaria do Tio Zé', NOW(), 4.5),
    (3, 456, 103, 'Churrascaria do Zé', NOW(), 4.0),
    (4, 456, 104, 'Mercado Central', NOW(), 4.8),
    (5, 789, 105, 'Lanchonete da Maria', NOW(), 4.2),
    (6, 123, 106, 'Bar do Chico', NOW(), 4.7),
    (7, 456, 107, 'Sorveteria Geladinha', NOW(), 5.0),
    (8, 789, 108, 'Restaurante do João', NOW(), 4.3),
    (9, 123, 109, 'Pet Shop do Bidu', NOW(), 4.9),
    (10, 456, 110, 'Clínica do Dr. Pedro', NOW(), 4.6);

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
);

CREATE TABLE despesa_viagem(
  id_despesa  SERIAL PRIMARY KEY,
  id_viagem int not null,
  categoria_despesa_enum varchar not null,
  descricao varchar(150) not null,
  valor_despesa decimal(10,2) not null,
  data_despesa timestamp
);

CREATE TABLE historico_status_reembolso(
  id_historico  SERIAL PRIMARY KEY,
  id_reembolso int not null,
  status_reembolso varchar(255),
   status_reembolso_enum varchar not null,
  observacao_moderador text,
  id_modificador int not null,
  data_modificacao timestamp
);

CREATE TABLE bagagem (
  id_checklist_item  SERIAL PRIMARY KEY,
  id_viagem int not null,
  nome_item varchar(100) not null,
  item_checado boolean,
  incluso_manualmente boolean
);

CREATE TABLE  item_bagagem_catalogo(
 id_item_bagagem_catalogo  SERIAL PRIMARY KEY ,
 nome_item varchar(100) not null ,
 perfil_viagem  varchar(255),
 tipo_viagem varchar(255),
 clima_indicado varchar(30)
);

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
 );

CREATE TABLE   avaliacao_estabelecimento( 
id_avaliacao  SERIAL PRIMARY KEY  ,
id_usuarío INT NOT NULL,
id_viagem        int not null,
nome                int not null,
comentario           text,
data_avaliacao timestamp
);
