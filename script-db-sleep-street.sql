CREATE TABLE viagem (
 id_viagem SERIAL PRIMARY KEY,
 id_viajante INT not null ,
 titulo_viagem varchar(255) not null,
 destino_cidade varchar(100) not null,
 destino_pais varchar(100) not null,
 fuso_horario_destino varchar(50) not null,
 data_inicio date not null,
 data_fim date not null,
 orcamento_total decimal(12,2) not null,
 ativa boolean,
 data_criacao timestamp

);

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
);