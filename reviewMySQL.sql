CREATE SCHEMA `restaurantedalibbs` ;

use restaurantedalibbs;
CREATE TABLE `restaurantedalibbs`.`clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL,
  `email` VARCHAR(100) NULL,
  `telefone` VARCHAR(20) NULL,
  PRIMARY KEY (`id_cliente`));
  
  CREATE TABLE `restaurantedalibbs`.`categorias` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL,
  PRIMARY KEY (`id_categoria`));
  CREATE TABLE produto(
id_produto INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
preco VARCHAR(20),
categoriaId INT,
FOREIGN KEY (categoriaId) REFERENCES categorias(id_categoria)
);
  CREATE TABLE pedidos(
id_pedido INT PRIMARY KEY AUTO_INCREMENT,
data_pedido DATE,
clienteId INT,
FOREIGN KEY (clienteId) REFERENCES clientes(id_cliente)
);

 CREATE TABLE itenspedidos(
id_itenspedido INT PRIMARY KEY AUTO_INCREMENT,
quantidade INT,
preco_unitario INT,
pedidoId INT,
produtoId INT,
FOREIGN KEY (pedidoId) REFERENCES pedidos(id_pedido),
FOREIGN KEY (produtoId) REFERENCES produto(id_produto)
);
  CREATE TABLE pagamentos(
id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
metodo_pagamento VARCHAR(100),
valor_pago INT,
data_pagamento DATE,
pedidoId INT,
FOREIGN KEY (pedidoId) REFERENCES  pedidos(id_pedido)
);
INSERT INTO `restaurantedalibbs`.`clientes` (`id_cliente`, `nome`, `email`,`telefone`) VALUES ('1', 'mateus', 'mateust@gmail.com','11997544625');
INSERT INTO `restaurantedalibbs`.`clientes` (`id_cliente`, `nome`, `email`,`telefone`) VALUES ('2', 'rafa', 'rafat@gmail.com','11997544626');
INSERT INTO `restaurantedalibbs`.`categorias` (`id_categoria`, `nome`) VALUES ('1', 'carne');
INSERT INTO `restaurantedalibbs`.`categorias` (`id_categoria`, `nome`) VALUES ('2', 'frango');
INSERT INTO `restaurantedalibbs`.`produto` (`id_produto`, `nome`,`preco`,`categoriaId`) VALUES ('1', 'strogonoff de carne','50','1');
INSERT INTO `restaurantedalibbs`.`produto` (`id_produto`, `nome`,`preco`,`categoriaId`) VALUES ('2', 'strogonoff de frango','40','2');
INSERT INTO `restaurantedalibbs`.`pedidos` (`id_pedido`, `data_pedido`,`clienteId`) VALUES ('1', '2024-09-03','1');
INSERT INTO `restaurantedalibbs`.`pedidos` (`id_pedido`, `data_pedido`,`clienteId`) VALUES ('2', '2024-09-04','2');
INSERT INTO `restaurantedalibbs`.`itenspedidos` (`id_itenspedido`, `quantidade`,`preco_unitario`,`pedidoId`,`produtoId`) VALUES ('1', '2','50','1','1');
INSERT INTO `restaurantedalibbs`.`itenspedidos` (`id_itenspedido`, `quantidade`,`preco_unitario`,`pedidoId`,`produtoId`) VALUES ('2', '8','50','2','2');
INSERT INTO `restaurantedalibbs`.`pagamentos` (`id_pagamento`, `metodo_pagamento`,`valor_pago`,`data_pagamento`,`pedidoId`) VALUES ('1', 'credito','100','2024-09-03','1');
INSERT INTO `restaurantedalibbs`.`pagamentos` (`id_pagamento`, `metodo_pagamento`,`valor_pago`,`data_pagamento`,`pedidoId`) VALUES ('2', 'credito','360','2024-09-04','2');

	SELECT
		prod.nome,
        prod.preco,
        pedidos.nome
	FROM produto AS prod
    INNER JOIN categorias ON prod.categoriaId= categorias.id_categoria;
    
    SELECT
		cli.nome,
        cli.email,
        cli.telefone,
		pedidos.id_pedido
        FROM clientes AS cli
    INNER JOIN pedidos ON cli.id_cliente= pedidos.clienteId;
    