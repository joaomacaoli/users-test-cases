
# Automação de Testes de Login com Robot Framework, Python e Selenium

Este repositório contém testes automatizados para a funcionalidade de login em sistemas Web e API, utilizando Robot Framework, Selenium, Python e arquivos de dados em JSON.

## Estrutura do Projeto

```
├── src/
│   ├── login/
│   │   ├── login-web.resource        # Keywords e funções para os testes de login via Web
│   │   ├── login-api.resource        # Keywords e funções para os testes de login via API
│   ├── shared/
│   │   ├── data/
│   │   │   └── login_data.json       # Arquivo JSON contendo credenciais para Web e API
│   │   ├── handler/
│   │   │   └── login_data_handler.py # Script Python para leitura do JSON de login
├── test/
│   ├── login-web.robot               # Casos de testes para login via Web
│   ├── login-api.robot               # Casos de testes para login via API
```

## Pré-requisitos

- **Python** (Versão 3.7+)
- **Robot Framework**
- **SeleniumLibrary**
- **WebDriver** (para o navegador de sua escolha, ex: ChromeDriver para Chrome)
- **RequestsLibrary** (para testes de API)
- **JSONLibrary**

### Instalar Dependências

1. Instale as dependências do Python:
   ```bash
   pip install robotframework robotframework-seleniumlibrary robotframework-requests robotframework-jsonlibrary
   ```

2. Baixe e configure o WebDriver do navegador (ex: [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/)) e adicione ao PATH do sistema.

## Como Executar os Testes

### 1. **Executar Testes Web**

- No diretório raiz do projeto, execute o seguinte comando:
   ```bash
   robot -d /reports test/login-web.robot
   ```
   Isso executará os testes de login baseados na web e salvará os relatórios na pasta `/reports`.

### 2. **Executar Testes de API**

- No diretório raiz do projeto, execute o seguinte comando:
   ```bash
   robot -d /reports test/login-api.robot
   ```
   Isso executará os testes de login via API e salvará os relatórios na pasta `/reports`.

## Dados de Teste

- As credenciais de login para ambos os testes (Web e API) estão armazenadas no arquivo `login_data.json` localizado em `src/shared/data/`. Esse arquivo JSON contém diferentes conjuntos de dados de teste, como credenciais válidas, inválidas, e-mails não registrados e campos vazios.

### Estrutura do JSON (para referência):
```json
{
  "valid_credentials": {
    "email": "user@example.com",
    "password": "validpassword"
  },
  "invalid_credentials": {
    "email": "user@example.com",
    "password": "wrongpassword"
  },
  "non_registered_email": {
    "email": "nonuser@example.com",
    "password": "validpassword"
  },
  "empty_fields": {
    "email": "",
    "password": ""
  }
}
```

## Visão Geral das Pastas

### 1. **login_data.json**:
Este arquivo armazena os diferentes conjuntos de credenciais usados durante os testes de login (válidas, inválidas, e-mail não registrado, campos vazios).

### 2. **login_data_handler.py**:
Um arquivo Python auxiliar que lê o `login_data.json` e fornece acesso aos dados de teste durante a execução dos testes.

### 3. **login.resource**:
Este arquivo contém as keywords reutilizáveis do Robot Framework para login, manipulação de respostas e verificações de asserções.

### 4. **login.robot**:
O arquivo onde os casos de teste estão definidos. Este arquivo apenas chama as keywords de `login.resource` e passa os diferentes parâmetros.

## Contribuições

Caso encontre algum problema ou tenha sugestões de melhoria, sinta-se à vontade para abrir uma issue ou enviar um pull request.

## Licença

Este projeto está licenciado sob a licença MIT.
