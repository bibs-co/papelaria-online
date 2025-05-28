##📄 **SoftPaper**

Projeto desenvolvido como requisito para a conclusão do 3º semestre do curso de Projeto de Software e Segurança da Informação da Universidade de Mogi das Cruzes. A SoftPaper é uma papelaria online inovadora focada na venda de cadernos personalizados. O sistema foi construído seguindo o padrão de arquitetura MVC (Model-View-Controller), buscando implementar Sistemas de Informação (SI) para otimizar o atendimento e a experiência de compra dos clientes. Ele foi projetado para ser um ambiente virtual dinâmico e confiável para a comercialização de produtos de papelaria, com foco na segurança das transações e na navegação intuitiva.

💡 **Funcionalidades:**

*   **Interface Intuitiva e Interativa:** Projetada para facilitar a navegação e encontrar produtos rapidamente.
*   **Segurança nas Transações:** Implementa sistemas de proteção avançados para garantir compras seguras e proteger dados.
*   **Sistema de Login Dinâmico:** Adapta a interface com base na sessão do usuário (logado vs. não logado). Utiliza a tag `c:if` da JSTL para controle condicional na interface.
*   **Design Responsivo com CSS Interativo:** A interface se ajusta automaticamente a diferentes tamanhos de tela. Em telas menores, o menu de navegação é substituído por um ícone que ativa um menu lateral.
*   **Armazenamento de Dados de Usuário:** Gerencia e armazena dados de login (Nome, E-mail, Senha, Endereço) no banco de dados.
*   **Armazenamento de Dados no Carrinho:** Os itens adicionados são armazenados em um array de objetos utilizando Javascript, sem necessidade de banco de dados.
*   **Verificação de Carrinho Vazio:** Impede a conclusão da compra se o carrinho estiver vazio, exibindo um alerta.
*   **Processamento Seguro de Pagamentos:** Evita o armazenamento de dados sensíveis, direcionando o usuário para uma tela de confirmação onde é informado que o link de pagamento foi enviado por e-mail.
*   **Criptografia e Segurança:** Utiliza criptografia avançada (SHA-256 para senhas) e validação (senha mínima segura) para proteger dados. O e-mail do usuário é criptografado e descriptografado de forma segura apenas na tela de confirmação de pagamento para exibição temporária.
*   **Uso de Servlets:** Componentes Java que processam requisições HTTP, gerenciando a comunicação entre a interface e o banco de dados, auxiliando na segurança e interação.

🔗 **Estrutura do Projeto**

O projeto SoftPaper adota o padrão MVC para organização do código e separação lógica. Embora não siga um modelo de desenvolvimento específico, busca manter o projeto claro e funcional.

*   **Model:** Contém os arquivos responsáveis por armazenar, processar e gerenciar informações. Gerencia operações do banco de dados, como armazenamento de usuários.
*   **View:** Contém os arquivos de interface gráfica (o que o cliente visualiza). Inclui arquivos JSP (para páginas dinâmicas com Java), CSS, imagens e Javascript, organizados em subpastas.
*   **Controller:** Atua como intermediário entre Model e View, processando requisições do usuário, gerenciando a lógica do sistema e decidindo ações a serem executadas. Recebe requisições através dos Servlets.
*   **Banco de Dados:** Utiliza o sistema de gerenciamento de banco de dados MySQL.

📌 **Instruções de criação para o banco de dados:**

O projeto utiliza um banco de dados MySQL nomeado **"softpaper"**. Dentro deste banco de dados, foi criada uma tabela nomeada **"usuarios"**.
A tabela "usuarios" armazena as seguintes informações para cada usuário:

CREATE database softpaper;

use softpaper;

CREATE TABLE usuarios (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    senha VARCHAR(70) NOT NULL,
    rua VARCHAR(100),
    num VARCHAR(20),
    cep VARCHAR(20)
);

