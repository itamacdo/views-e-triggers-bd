USE company;

-- Número de empregados por departamento e localidade
CREATE VIEW vw_empregados_departamento_localidade AS
SELECT d.nome AS departamento, d.localidade, COUNT(e.id_empregado) AS total_empregados
FROM departamento d
JOIN empregado e ON d.id_departamento = e.id_departamento
GROUP BY d.nome, d.localidade;

-- Lista de departamentos e seus gerentes
CREATE VIEW vw_departamentos_gerentes AS
SELECT d.nome AS departamento, g.nome AS gerente
FROM departamento d
JOIN empregado g ON d.id_gerente = g.id_empregado;

-- Projetos com maior número de empregados
CREATE VIEW vw_projetos_maior_empregados AS
SELECT p.nome AS projeto, COUNT(ep.id_empregado) AS total_empregados
FROM projeto p
JOIN empregado_projeto ep ON p.id_projeto = ep.id_projeto
GROUP BY p.nome
ORDER BY total_empregados DESC;

-- Lista de projetos, departamentos e gerentes
CREATE VIEW vw_projetos_departamentos_gerentes AS
SELECT p.nome AS projeto, d.nome AS departamento, g.nome AS gerente
FROM projeto p
JOIN departamento d ON p.id_departamento = d.id_departamento
JOIN empregado g ON d.id_gerente = g.id_empregado;

-- Empregados que possuem dependentes e se são gerentes
CREATE VIEW vw_empregados_dependentes_gerentes AS
SELECT e.nome,
       CASE WHEN d.id_dependente IS NOT NULL THEN 'Sim' ELSE 'Não' END AS possui_dependentes,
       CASE WHEN e.id_empregado IN (SELECT id_gerente FROM departamento) THEN 'Sim' ELSE 'Não' END AS gerente
FROM empregado e
LEFT JOIN dependente d ON e.id_empregado = d.id_empregado;
