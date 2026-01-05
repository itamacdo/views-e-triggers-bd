USE ecommerce;

DELIMITER $$

-- Trigger para atualização de salário
CREATE TRIGGER trg_atualiza_salario
BEFORE UPDATE ON colaborador
FOR EACH ROW
BEGIN
    IF NEW.salario <> OLD.salario THEN
        SET NEW.data_atualizacao = CURRENT_DATE;
    END IF;
END $$

DELIMITER ;
