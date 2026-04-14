-- =============================================
-- ESFUMA — Base de Dados (versão atual)
-- =============================================

-- ---------------------------------------------
-- ESCALÕES
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS escaloes (
    id        INT AUTO_INCREMENT PRIMARY KEY,
    nome      VARCHAR(50)  NOT NULL,
    idade_max INT          NOT NULL,
    ativo     TINYINT(1)   NOT NULL DEFAULT 1
);

-- ---------------------------------------------
-- TREINADORES
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS treinadores (
    id   INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- ---------------------------------------------
-- RELAÇÃO ESCALÃO ↔ TREINADOR (many-to-many)
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS escalao_treinador (
    escalao_id   INT NOT NULL,
    treinador_id INT NOT NULL,
    PRIMARY KEY (escalao_id, treinador_id),
    FOREIGN KEY (escalao_id)   REFERENCES escaloes(id)   ON DELETE CASCADE,
    FOREIGN KEY (treinador_id) REFERENCES treinadores(id) ON DELETE CASCADE
);

-- ---------------------------------------------
-- TREINOS (horários)
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS treinos (
    id         INT AUTO_INCREMENT PRIMARY KEY,
    escalao_id INT          NOT NULL,
    dia        VARCHAR(20)  NOT NULL,
    hora       VARCHAR(25)  NOT NULL,
    local      VARCHAR(100) NOT NULL,
    FOREIGN KEY (escalao_id) REFERENCES escaloes(id) ON DELETE CASCADE
);

-- ---------------------------------------------
-- UTILIZADORES ADMIN
-- ---------------------------------------------
CREATE TABLE IF NOT EXISTS admin_users (
    id       INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50)  NOT NULL UNIQUE,
    password VARCHAR(64)  NOT NULL
);

-- =============================================
-- DADOS INICIAIS
-- =============================================

INSERT INTO escaloes (nome, idade_max) VALUES
    ('Sub-6',     6),
    ('Sub-7',     7),
    ('Sub-8',     8),
    ('Sub-9',     9),
    ('Sub-10',   10),
    ('Sub-11',   11),
    ('Sub-12',   12),
    ('Sub-13',   13),
    ('Iniciados',15),
    ('Juvenis',  17),
    ('Juniores', 19);

INSERT INTO treinadores (nome) VALUES
    ('Afonso Azevedo'),
    ('Francisco Sombreireiro'),
    ('João Pedro Ramos');

-- Afonso Azevedo (id=1) e Francisco Sombreireiro (id=2) → Sub-6 (id=1)
INSERT INTO escalao_treinador (escalao_id, treinador_id) VALUES (1, 1), (1, 2);

-- João Pedro Ramos (id=3) → Sub-11 (id=6)
INSERT INTO escalao_treinador (escalao_id, treinador_id) VALUES (6, 3);

-- Horários Sub-6
INSERT INTO treinos (escalao_id, dia, hora, local) VALUES
    (1, 'Segunda', '19h00 - 20h00', 'Campo ESFUMA'),
    (1, 'Quarta',  '19h00 - 20h00', 'Campo ESFUMA');

-- Horários Sub-11
INSERT INTO treinos (escalao_id, dia, hora, local) VALUES
    (6, 'Segunda', '19h00 - 20h15', 'Liceu Jaime Moniz'),
    (6, 'Quinta',  '18h40 - 19h50', 'Escola da Ajuda');

-- Admin: admin / admin123
INSERT INTO admin_users (username, password) VALUES
    ('admin', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9');
