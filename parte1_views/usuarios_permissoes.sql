-- Criação de usuários
CREATE USER 'gerente'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'funcionario'@'localhost' IDENTIFIED BY '1234';

-- Permissões
GRANT SELECT ON company.empregado TO 'gerente'@'localhost';
GRANT SELECT ON company.departamento TO 'gerente'@'localhost';
GRANT SELECT ON company.vw_% TO 'gerente'@'localhost';

GRANT SELECT ON company.empregado TO 'funcionario'@'localhost';

FLUSH PRIVILEGES;
