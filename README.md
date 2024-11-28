# Conversor de Moedas Flutter

Este é um aplicativo simples de conversão de moedas, desenvolvido utilizando o framework Flutter. O aplicativo permite ao usuário realizar conversões de valores entre diferentes moedas, consultar taxas de câmbio e fazer as conversões com base nas taxas fornecidas pela API.

## Funcionalidades

- **Tela de Conversão**: O usuário pode inserir um valor e uma taxa de conversão, e o aplicativo calculará automaticamente o valor convertido.
- **Consulta de Taxas de Câmbio**: O usuário pode consultar as taxas de câmbio mais recentes para diversas moedas. As taxas são obtidas através de uma API externa.

## Instalação

### 1. Clonando o repositório

Para começar a usar o projeto, faça o clone deste repositório:

```bash
git clone https://github.com/andrielystarosky/conversor.git
```
### 2. Instalando as dependências
Navegue até o diretório do projeto e execute o comando abaixo para instalar as dependências:

```bash
cd conversor
flutter pub get
```
### 3. Executando o aplicativo
Execute o aplicativo no emulador ou dispositivo conectado:

```bash
flutter run
```
O aplicativo estará disponível no dispositivo ou emulador escolhido.

--- 
## Estrutura do Projeto
lib/main.dart: Arquivo principal que contém a inicialização do aplicativo e o direcionamento para a tela de conversão.
lib/tela_conversao.dart: Tela onde o usuário insere o valor a ser convertido e a taxa de conversão.
lib/tela_taxas.dart: Tela para consultar as taxas de câmbio, exibindo-as em formato de tabela.
lib/model/taxa.dart: Arquivo de modelo que define a estrutura dos dados de taxa de câmbio.

## Dependências
> Este aplicativo utiliza as seguintes dependências do Flutter:

http: Para realizar requisições HTTP e consumir a API de taxas de câmbio.
flutter: Framework principal para construção do aplicativo.
provider: Para gerenciar o estado do aplicativo, caso necessário em futuras implementações.

## API Utilizada
O aplicativo faz uso da API Exchangeratesapi para obter as taxas de câmbio. Você deve configurar uma chave de acesso válida para que as requisições funcionem corretamente.

Registre-se no Exchangeratesapi para obter a chave de acesso.
Substitua a chave de acesso no código, onde necessário.

--- 

# Requisitos solicitados

1. O aplicativo contém duas telas:

- Tela de Conversão.
- Tela de Consulta de Taxas de Câmbio.

2. Uso de textos, botões, listas, recursos de ao menos 4 widgets diferentes

- Uso de textos: o aplicativo exibe vários textos, como títulos, instruções e resultados, em diversas partes da interface (telas de conversão e consulta de taxas).
    - Exemplo: O título "Conversão de Moedas" na tela inicial, e a exibição do valor convertido.
- Uso de botões: o aplicativo utiliza botões para ações como:
    - Realizar a conversão de moedas.
    - Navegar entre as telas de conversão e consulta de taxas.
    - O botão que direciona para a consulta de taxas de câmbio.
- Uso de listas: a tela de consulta de taxas utiliza uma lista para exibir as taxas de câmbio para diferentes moedas.
    - Exemplo: O uso do widget ListView para listar as taxas de câmbio.
- Recursos de ao menos 4 widgets diferentes:
    - Text: Para exibir títulos e mensagens.
    - ElevatedButton: Para ações de clique (realizar conversão, navegar).
    - TextField: Para permitir que o usuário insira o valor a ser convertido e selecione as moedas.
    - ListView: Para exibir a lista de taxas de câmbio.
    - CircularProgressIndicator: Para mostrar o carregamento de dados da API.
    - DropdownButton: Para a seleção de moedas.


3. Usar algum dos Recursos (LocalStorage, Câmera, API, Sensores)

- O projeto usa uma API externa para realizar a conversão de moedas e consultar as taxas de câmbio.

--- 
Andriely Starosky