# Desafio Digio

![screenshot](/Media/screenshot.png)

## Detalhes técnicos:

- UI: SwiftUI
- Arquitetura: MVVM
- Deployment Target: iOS 15+
- Libs externas: OHHTTPStubs

## Motivações:

- Inicialmente fora considerado utilizar o iOS 12 como deployment target. Todavia, o XCode 14.1 não suporta simuladores com versões inferiores à 13.7, e o macOS Ventura não suporta versões de XCode inferiores à 14. 
Uma vez que seria possível testar somente em versões do iOS a partir da 13, e que dispositivos compatíveis com o iOS 13 também o são com o iOS 15; e que a criação de interfaces com o SwiftUI (que demanda no mínimo iOS 13) é mais rápida do que com UIKit, o iOS 15 fora escolhido como target da aplicação.

- O OHHTTPStubs fora adicionado no target de testes para a interceptação e mock de respostas de rede, para um teste mais efetivo do ViewModel de produtos e sem depender de conexão.

- Componentes construídos em outros projetos foram adicionados:

    - HalfModalView: Implemenatção de modal com tamanho customizável, desenvolvido originalmente por Christopher Guirguis e aprimorado por Thalles Araújo

    - ModaHandlerView: componente de handle de modal, inspirado no bottom sheet nativo da Apple (Desenvolvido por Thalles Araújo)

    - Loading View: Componente de spinner de carregamento com view de background com vibrancy (Desenvolvido por Thalles Araújo)