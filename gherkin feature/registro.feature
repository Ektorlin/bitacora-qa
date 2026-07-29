Feature: Registro de nuevos usuarios
  Como visitante de la aplicación
  Quiero crear una cuenta nueva
  Para poder acceder a las funcionalidades del sistema

  Scenario: Registro exitoso con campos válidos
    Given que el usuario se encuentra en la página de registro
    When ingresa un nombre válido "Hector Perez"
    And ingresa un correo electrónico válido "hector@example.com"
    And ingresa una contraseña válida "Password123!"
    And confirma la contraseña "Password123!"
    And hace clic en el botón "Registrarse"
    Then el sistema crea la cuenta exitosamente
    And muestra el mensaje "Registro completado con éxito"

  Scenario: Registro fallido con un correo electrónico ya existente
    Given que el usuario se encuentra en la página de registro
    And existe una cuenta registrada con el correo "hector@example.com"
    When ingresa el nombre "Hector Perez"
    And ingresa el correo electrónico "hector@example.com"
    And ingresa la contraseña "Password123!"
    And confirma la contraseña "Password123!"
    And hace clic en el botón "Registrarse"
    Then el sistema rechaza el registro
    And muestra el mensaje "El correo electrónico ya está registrado"

  Scenario: Registro fallido con campos obligatorios vacíos
    Given que el usuario se encuentra en la página de registro
    When deja vacíos los campos de nombre, correo electrónico y contraseña
    And hace clic en el botón "Registrarse"
    Then el sistema no permite completar el registro
    And muestra mensajes indicando que los campos obligatorios deben completarse