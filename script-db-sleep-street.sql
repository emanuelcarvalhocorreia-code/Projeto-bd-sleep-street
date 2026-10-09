CREATE TABLE viagem (
 id_viagem SERIAL PRIMARY KEY,
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

CREATE TABLE estabelecimento_favorito(
 id_favorito SERIAL PRIMARY KEY,
 id_usuario int not null,
 id_estabelecimento int not null,
 data_adicao timestamp
);

CREATE TABLE estabelecimento(
  id_estabelecimento SERIAL PRIMARY KEY,
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
  id_despesa SERIAL PRIMARY KEY,
  id_viagem int not null,
  categoria_despesa_enum varchar not null,
  descricao varchar(150) not null,
  valor_despesa decimal(10,2) not null,
  data_despesa timestamp
);

CREATE TABLE historico_status_reembolso(
  id_historico SERIAL PRIMARY KEY,
  id_reembolso int not null,
  status_reembolso varchar(255),
   status_reembolso_enum varchar not null,
  observacao_moderador text,
  id_modificador int not null,
  data_modificacao timestamp
);

CREATE TABLE bagagem (
  id_checklist_item SERIAL PRIMARY KEY,
  id_viagem int not null,
  nome_item varchar(100) not null,
  item_checado boolean,
  incluso_manualmente boolean
);

CREATE TABLE  item_bagagem_catalogo(
 id_item_bagagem_catalogo SERIAL PRIMARY KEY ,
 nome_item varchar(100) not null ,
 perfil_viagem  varchar(255),
 tipo_viagem varchar(255),
 clima_indicado varchar(30)
);

 CREATE TABLE solicitacao_reembolso(
 id_reembolso SERIAL PRIMARY KEY ,
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
id_avaliacao SERIAL PRIMARY KEY  ,
id_usuarío INT NOT NULL,
id_viagem        int not null,
nome                int not null,
comentario           text,
data_avaliacao timestamp
);