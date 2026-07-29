Feature: Búsqueda de productos en Mercado Libre
  Como comprador
  Quiero buscar productos en Mercado Libre
  Para encontrar artículos disponibles de mi interés

  Background:
    Given que el usuario abre el sitio web de Mercado Libre
    And la página principal se encuentra cargada correctamente
    And el campo de búsqueda está disponible

  Scenario Outline: Búsqueda exitosa que retorna resultados
    When el usuario ingresa "<producto>" en el campo de búsqueda
    And hace clic en el botón de búsqueda
    Then el sistema muestra una lista de productos relacionados con "<producto>"
    And la lista contiene al menos un resultado

    Examples:
      | producto   |
      | Laptop     |
      | iPhone     |
      | Audífonos  |
      | Bicicleta  |

  Scenario Outline: Búsqueda con múltiples términos y validación de relevancia
    When el usuario ingresa "<consulta>" en el campo de búsqueda
    And hace clic en el botón de búsqueda
    Then el sistema muestra resultados relacionados con "<consulta>"
    And los primeros resultados contienen las palabras clave más relevantes de la búsqueda

    Examples:
      | consulta                      |
      | laptop gamer lenovo           |
      | iphone 15 pro max             |
      | tenis nike hombre             |
      | silla ergonómica oficina      |

  Scenario Outline: Filtrado y ordenamiento de resultados
    Given que el usuario realizó la búsqueda de "<producto>"
    And se muestran resultados de búsqueda
    When el usuario ordena los resultados por "<orden>"
    And aplica el filtro de categoría "<categoria>"
    And selecciona un rango de precio entre "<precioMin>" y "<precioMax>"
    Then el sistema muestra únicamente productos de la categoría "<categoria>"
    And todos los productos tienen un precio dentro del rango seleccionado
    And los resultados están ordenados según "<orden>"

    Examples:
      | producto | orden           | categoria    | precioMin | precioMax |
      | Laptop   | Menor precio    | Computación  | 15000     | 20000     |
      | Celular  | Mayor precio    | Celulares    | 5000      | 15000     |
      | Televisor| Más relevantes  | Electrónica  | 8000      | 25000     |
      | Audífonos| Menor precio    | Audio        | 700       | 2000      |

  Scenario Outline: Búsqueda con caracteres especiales
    When el usuario ingresa "<consulta>" en el campo de búsqueda
    And hace clic en el botón de búsqueda
    Then el sistema procesa correctamente la consulta
    And muestra resultados relacionados con los términos válidos de la búsqueda
    And no presenta errores durante el procesamiento de caracteres especiales

    Examples:
      | consulta              |
      | @laptop               |
      | #iphone 15            |
      | audífonos$bluetooth   |
      | %monitor gamer        |