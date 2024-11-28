# Conversor de Moedas Flutter

Este é um aplicativo simples de conversão de moedas, desenvolvido utilizando o framework Flutter. O aplicativo permite ao usuário realizar conversões de valores entre diferentes moedas, consultar taxas de câmbio e fazer as conversões com base nas taxas fornecidas pela API.

## Funcionalidades

- **Tela de Conversão**: O usuário pode inserir um valor e uma taxa de conversão, e o aplicativo calculará automaticamente o valor convertido.
- **Consulta de Taxas de Câmbio**: O usuário pode consultar as taxas de câmbio mais recentes para diversas moedas. As taxas são obtidas através de uma API externa.

## Instalação

### 1. Clonando o repositório

Para começar a usar o projeto, faça o clone deste repositório:

```bash
git clone https://github.com/seu-usuario/conversor_moedas_flutter.git
```
### 2. Instalando as dependências
Navegue até o diretório do projeto e execute o comando abaixo para instalar as dependências:

```bash
cd conversor_moedas_flutter
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
