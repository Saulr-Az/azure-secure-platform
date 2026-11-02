resource "azurerm_monitor_data_collection_rule" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
  #Aqui indicamos el sistema operativo de la maquina que monitorizaremos
  kind = "Windows"

  #Aqui indicaremos de donde cojera la informacion
  data_sources {

    windows_event_log {
      #El nombre del origen donde se recompilaran los eventos de windows
      name = "windows-event-logs"
      #Le indicamos que coja la informacion de los eventos de windows
      streams = ["Microsoft-Event"]

      #Le indicaremos que revise los eventos de sistema y apps. Con nivel 1 critica, nivel 2 error, nivel 3 advertencia
      x_path_queries = [
        "System!*[System[(Level=1 or Level=2 or Level=3)]]",
        "Application!*[System[(Level=1 or Level=2 or Level=3)]]"
      ]
    }
  }

  # Destino donde almacenaremos los eventos
  destinations {
    log_analytics {
      name                  = "log-analytics-destination"
      workspace_resource_id = var.log_analytics_workspace_id
    }
  }

  # Relacionamos el origen de datos con el destino
  data_flow {
    streams      = ["Microsoft-Event"]
    destinations = ["log-analytics-destination"]
  }

}


