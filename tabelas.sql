-- Modelagem simples: clientes e pedidos

CREATE TABLE clientes (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY,
    cliente_id INTEGER NOT NULL,
    data_pedido DATE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes (id)
);

-- Dados de exemplo
INSERT INTO clientes (id, nome, email) VALUES
    (1, 'Ana Souza', 'ana@email.com'),
    (2, 'Carlos Lima', 'carlos@email.com');

INSERT INTO pedidos (id, cliente_id, data_pedido, valor) VALUES
    (1, 1, '2026-11-01', 150.00),
    (2, 1, '2026-11-10', 89.90),
    (3, 2, '2026-11-12', 45.50);

-- Consulta: total gasto por cliente
SELECT c.nome, SUM(p.valor) AS total
FROM clientes c
JOIN pedidos p ON p.cliente_id = c.id
GROUP BY c.nome;
