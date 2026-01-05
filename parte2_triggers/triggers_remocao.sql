USE ecommerce;

-- Tabela de backup de usuários
CREATE TABLE usuario_backup (
    id_usuario INT,
    nome VARCHAR(100),
    email VARCHAR(100),
    data_remocao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger BEFORE DELETE
DELIMITER $$

CREATE TRIGGER trg_backup_usuario
BEFORE DELETE ON usuario
FOR EACH ROW
BEGIN
    INSERT INTO usuario_backup (id_usuario, nome, email)
    VALUES (OLD.id_usuario, OLD.nome, OLD.email);
END $$

DELIMITER ;
