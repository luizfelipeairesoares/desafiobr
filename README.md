# desafio / challenge
iOS Esportes

**Challenge**

## O Desafio / The challenge

Você deverá criar um aplicativo, chamado de "Brasileirão", para acompanhamento de jogos de futebol.
Create an app called "Brasileirão", showing soccer games from Brazil's national championship.

Utilizei uma api mockada.
Using a mocked API
[Link](https://github.com/luizfelipeairesoares/apidesafio)

## O Aplicativo / The app

O aplicativo possui duas telas: uma listagem de jogos e o detalhe de cada jogo.
App has two screens, one with a list of games and the other with the detail of the selected game.

### Lista / List

- Lista de jogos / Games List
  - Nome dos times / Teams names
  - Escudos / Shields
  - Placar / Score
  - Data e horário / Date and time

Considere as seguintes condições:

- A lista de jogos deve estar disponível offline / Games list should be available offline

- O usuário pode querer atualizar a lista de jogos / User can update games list

- Clicar sobre um jogo leva o usuário para a tela de detalhe daquele jogo / Clicking on a game takes user to detail of the game

### Detalhe do Jogo / Detail

- Detalhe do jogo / Detail
  - Nome dos times / Teams names
  - Escudos / Shields
  - Placar / Score
  - Data e horário / Date and time
  - Local / Venue

- Lance a Lance / Play by Play
  - Lista de momentos importantes do jogo / List of important moments of the game
    - Tempo no jogo / Time it happened
    - Descrição / Description

- Atalho para voltar para a tela inicial / Back button to list

## Considerações do desenvolvedor / Developer's notes

### Decisões tomadas / Decisions
  - Arquitetura MVVM com protocolos: Acredito que seja uma forma simples de entender o código e manter no futuro. Cumpre sua função de
  segregação de responsabilidades, concentrando as regras de negócio no view model.
    MVVM architecture with protocols. I believe it's a simple way to write and maintain the code. Also, fulfills its function of segregation of responsabilities,
    concentrating the business rules in the view model.

  - Microserviços
    Microservices

  - Utilização do Moya para simplificar a API num enum. Em seu core ele utiliza o Alamofire para as requisições.
    Using [Moya](https://github.com/Moya/Moya) for API requests.

### Ideias que gostaria de implementar / Ideas I'd like to implement
  - Melhores testes para maior code coverage
    Better unit testing for higher code coverage
  - Talvez segregar as responsabilidades em mais objetos. Mas acredito que poderia acarretar numa maior complexidade para o projeto.
    Maybe segregate responsabilities in more objects. But I believe it would add a higher complexity to the project.

### Observações / Observations
  - Os dados foram retirados do globoesporte.com através de um inspect source.
    Data provided from globoesporte.com
