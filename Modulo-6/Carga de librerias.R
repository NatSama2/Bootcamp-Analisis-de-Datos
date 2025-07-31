# Instalación de paquetes (solo necesario una vez)
install.packages(c(
  # Núcleo del tidyverse
  "tidyverse",
  
  # Visualización
  "ggplot2",        # Gramática de gráficos
  "plotly",         # Gráficos interactivos
  "ggthemes",       # Temas adicionales para ggplot2
  "patchwork",      # Combinar gráficos
  "RColorBrewer",   # Paletas de colores

  
  # Análisis de datos
  "dplyr",          # Manipulación de datos
  "tidyr",          # Datos ordenados
  "readr",          # Importar datos
  "lubridate",      # Fechas
  "stringr",        # Manipulación de strings
  
  # Limpieza de datos
  "janitor",        # Limpieza de nombres y datos
  "skimr",          # Resúmenes de datos
  "naniar",         # Manejo de valores faltantes
  "DataExplorer",   # Exploración automática
  
  # Estadística
  "broom",          # Convertir resultados a tidy
  "corrr",          # Correlaciones
  "psych",          # Estadística descriptiva
  
  # Datos espaciales
  "sf",             # Simple features
  "maps",           # Mapas base
  
  # Tablas interactivas
  "DT",             # DataTables
  
  # Machine Learning
  "caret",          # Clasificación y regresión
  "tidymodels"      # Modelado tidy
))

# Cargar librerías (ejecutar en cada sesión)
library(tidyverse)  # Incluye ggplot2, dplyr, tidyr, etc.

# Visualización
library(plotly)
library(ggthemes)
library(patchwork)
library(RColorBrewer)

# Limpieza y exploración
library(janitor)
library(skimr)
library(naniar)
library(DataExplorer)

# Manipulación de datos
library(lubridate)
library(stringr)

# Tablas interactivas
library(DT)

# Configuración inicial
options(scipen = 999)  # Desactivar notación científica
theme_set(theme_minimal())  # Tema por defecto para ggplot2