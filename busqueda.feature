Feature: Búsqueda de productos
  Como usuario de la aplicación
  Quiero buscar productos por nombre
  Para encontrar rápidamente los artículos que necesito

  Scenario: Búsqueda exitosa que retorna resultados
    Given que el usuario se encuentra en la página de búsqueda
    And existen productos registrados que contienen la palabra "Laptop"
    When el usuario ingresa "Laptop" en el campo de búsqueda
    And hace clic en el botón "Buscar"
    Then el sistema muestra una lista de productos relacionados con "Laptop"
    And la lista contiene al menos un resultado

  Scenario: Búsqueda sin resultados
    Given que el usuario se encuentra en la página de búsqueda
    When el usuario ingresa "ProductoInexistente" en el campo de búsqueda
    And hace clic en el botón "Buscar"
    Then el sistema informa que no se encontraron resultados
    And no muestra productos en la lista de resultados

  Scenario: Búsqueda con filtros aplicados
    Given que el usuario se encuentra en la página de búsqueda
    And existen productos de la categoría "Electrónica"
    And existen productos disponibles en inventario
    When el usuario busca "Audífonos"
    And selecciona la categoría "Electrónica"
    And hace clic en el botón "Buscar"
    Then el sistema muestra únicamente productos de la categoría "Electrónica"
    And todos los resultados corresponden a productos disponibles