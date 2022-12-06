##############################
## Azure App Service - Main ##
##############################


# Create the App Service Plan
resource "azurerm_service_plan" "service-plan" {
  name                = "sp_${var.rg.name}"
  resource_group_name = var.rg.name
  location            = var.rg.location
  sku_name            = "S1"
  os_type             = "Windows"

  tags = {
    description = var.tags.description
    environment = var.tags.environment
    owner       = var.tags.owner
  }
}

# Create the App Service
resource "azurerm_windows_web_app" "app-service" {
  name                = "as${var.rg.name}"
  location            = var.rg.location
  resource_group_name = var.rg.name
  service_plan_id = azurerm_service_plan.service-plan.id

  site_config {

  }

  tags = {
    description = var.tags.description
    environment = var.tags.environment
    owner       = var.tags.owner
  }
}
