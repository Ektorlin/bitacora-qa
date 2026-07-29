Feature: Búsqueda de contenido en YouTube Music
  Como usuario de YouTube Music
  Quiero buscar canciones, artistas y álbumes
  Para encontrar el contenido musical que deseo escuchar

  Background:
    Given que el usuario abre el sitio web de YouTube Music
    And la página principal se encuentra cargada correctamente
    And el campo de búsqueda está disponible

  # Este archivo valida que el motor de búsqueda muestre resultados
  # relevantes para búsquedas simples y consultas con múltiples términos.

  @humo @critico
  Scenario Outline: Validación de búsqueda por nombre exacto
    When el usuario ingresa "<busqueda>" en el campo de búsqueda
    And inicia la búsqueda
    Then el sistema muestra resultados relacionados con "<busqueda>"
    And el primer resultado coincide con el nombre buscado

    Examples:
      | busqueda                  |
      | Bohemian Rhapsody         |
      | Blinding Lights           |
      | Bad Bunny                 |
      | Random Access Memories    |

  @regresion @critico
  Scenario Outline: Búsqueda con múltiples términos y validación de relevancia
    When el usuario ingresa "<busqueda>" en el campo de búsqueda
    And inicia la búsqueda
    Then el sistema muestra resultados relevantes para "<busqueda>"
    And los primeros resultados contienen las palabras clave de la búsqueda

    Examples:
      | busqueda                                 |
      | Bohemian Rhapsody Queen                  |
      | Blinding Lights The Weeknd               |
      | Bad Bunny Un Verano Sin Ti               |
      | Daft Punk Random Access Memories         |