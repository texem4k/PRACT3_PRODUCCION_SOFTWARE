Feature: Gestión de gastos
  Como estudiante
  Quiero registrar mis gastos
  Para controlar cuánto dinero gasto

  Scenario: Crear un gasto y comprobar cual es el total que llevo gastado
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    Then el total de dinero gastado debe ser 5 euros

  Scenario: Eliminar un gasto y comprobar cual es el total que llevo gastado
    Given un gestor con un gasto de 5 euros
    When elimino el gasto con id 1
    Then debe haber 0 gastos registrados

  Scenario: Crear y eliminar un gasto y comprobar que no he gastado dinero
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    And elimino el gasto con id 1
    Then debe haber 0 gastos registrados

  Scenario: Crear dos gastos diferentes y comprobar que el total que llevo gastado es la suma de ambos
    Given un gestor de gastos vacío
    When añado un gasto de 5 euros llamado Café
    And añado un gasto de 10 euros llamado Comida
    Then el total de dinero gastado debe ser 15 euros

  Scenario: Crear tres gastos diferentes que sumen 30 euros hace que el total sean 30 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Camiseta
    And añado un gasto de 5 euros llamado Pizza
    And añado un gasto de 15 euros llamado Suscripciones
    Then el total de dinero gastado debe ser 30 euros

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor de gastos vacío
    When añado un gasto de 10 euros llamado Comida
    And añado un gasto de 30 euros llamado Inversion
    And añado un gasto de 30 euros llamado Bizum
    And elimino el gasto con id 3
    Then el total de dinero gastado debe ser 40 euros

  Scenario: Crear tres gastos de 10, 30, 30 euros y elimino el ultimo gasto la suma son 40 euros
    Given un gestor con un gasto de 20 euros
    When elimino el gasto con id 1
    And añado un gasto de 5 euros llamado Café
    And añado un gasto de 33 euros llamado F1
    Then debe haber 2 gastos registrados

  Scenario: Eliminar un gasto y comprobar cual es el total que llevo gastado
    Given un gestor con un gasto de 5 euros
    When elimino el gasto con id 1
    Then el total de dinero gastado debe ser 0 euros

  Scenario: Añadir varios gastos de varios meses y el nº total de gastos en un mes
    Given un gestor de gastos vacío
    When añado un gasto a fecha 2025-03-01 de 10 euros llamado Primer gasto Marzo
    And añado un gasto a fecha 2025-03-02 de 10 euros llamado Segundo gasto Marzo
    And añado un gasto a fecha 2025-01-01 de 33 euros llamado Primer gasto Enero
    And añado un gasto a fecha 2025-02-01 de 100 euros llamado Primer gasto Febrero
    Then el número de gastos de 2025-03 debe ser 2

  Scenario: Añadir varios gastos de varios meses y obtener el total de un mes
    Given un gestor de gastos vacío
    When añado un gasto a fecha 2025-03-01 de 10 euros llamado Primer gasto Marzo
    And añado un gasto a fecha 2025-03-02 de 10 euros llamado Segundo gasto Marzo
    And añado un gasto a fecha 2025-01-01 de 33 euros llamado Primer gasto Enero
    And añado un gasto a fecha 2025-02-01 de 100 euros llamado Primer gasto Febrero
    Then el total de gastos del mes 2025-03 debe ser 20 euros


    Scenario: Añadir varios gastos de varios meses, eliminar uno y verificar ese mes
    Given un gestor de gastos vacío
    When añado un gasto a fecha 2025-03-01 de 10 euros llamado Primer gasto Marzo
    And añado un gasto a fecha 2025-03-02 de 10 euros llamado Segundo gasto Marzo
    And añado un gasto a fecha 2025-01-01 de 33 euros llamado Primer gasto Enero
    And añado un gasto a fecha 2025-02-01 de 100 euros llamado Primer gasto Febrero
    And elimino el gasto con id 4
    Then el total de gastos del mes 2025-02 debe ser 0 euros
