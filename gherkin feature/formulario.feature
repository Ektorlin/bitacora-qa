Feature: Validación del formulario de registro en Mercado Libre
  Como visitante
  Quiero completar el formulario de registro
  Para crear una cuenta en Mercado Libre

  Background:
    Given que el usuario abre el sitio web de Mercado Libre
    And accede a la página de registro
    And el formulario de registro se encuentra disponible

  Scenario Outline: Validación de campos obligatorios y formato de correo electrónico
    When el usuario ingresa el nombre "<nombre>"
    And ingresa el correo electrónico "<email>"
    And ingresa la contraseña "<password>"
    And hace clic en el botón "Continuar"
    Then el sistema muestra el resultado "<resultado>"

    Examples:
      | nombre         | email                  | password      | resultado                                             |
      |                |                        |               | Se muestran mensajes de campos obligatorios           |
      | Juan Pérez     | juancorreo.com         | Password123!  | Se muestra un mensaje de correo electrónico inválido  |
      | Juan Pérez     | juan@example.com       | Password123!  | El sistema permite continuar con el registro          |