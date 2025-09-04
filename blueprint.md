# Blueprint do Projeto

## Visão Geral

Este documento descreve a arquitetura e o plano de desenvolvimento para o aplicativo Flutter. O objetivo é criar uma base de código escalável, manutenível e testável, utilizando uma abordagem de arquitetura limpa e focada em funcionalidades (feature-first).

## Arquitetura

A arquitetura do projeto será organizada da seguinte forma:

```
lib/
├── app/                  # Configurações globais do app (tema, rotas)
│   └── view/
│       └── app_view.dart     # Widget principal do App
├── core/                 # Código compartilhado (widgets, serviços, utils)
│   └── widgets/
├── features/             # Pasta para cada funcionalidade da aplicação
│   └── auth/             # Funcionalidade de autenticação (login, registro)
│       ├── view/
│       │   ├── screens/  # Telas da funcionalidade
│       │   └── widgets/  # Widgets específicos da funcionalidade
│       └── presenter/      # Lógica de apresentação (similar ao Presenter/ViewModel)
├── main.dart             # Ponto de entrada da aplicação
└── blueprint.md          # Documentação da arquitetura e plano
```

## Plano de Ação Atual

1.  **Estruturação de Pastas**: Criar a estrutura de diretórios `app`, `core` e `features/auth`.
2.  **Refatoração do `main.dart`**:
    *   Mover o `MyApp` e a configuração de tema para `lib/app/view/app_view.dart`.
    *   Extrair os formulários de Login e Registro do `main.dart`.
3.  **Criação das Telas de Autenticação**:
    *   Criar `lib/features/auth/view/screens/login_screen.dart` para a tela de login.
    *   Criar `lib/features/auth/view/screens/registration_screen.dart` para a tela de registro.
4.  **Limpeza**: Atualizar o `main.dart` para ser apenas o ponto de entrada da aplicação e remover arquivos/pastas antigas.
5.  **Formatação**: Executar `flutter format .` para garantir a consistência do código.

