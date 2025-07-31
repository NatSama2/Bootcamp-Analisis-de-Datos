# SCRIPT DE ANÁLISIS ESTADÍSTICO EN R CON COMENTARIOS PEDAGÓGICOS
# ------------------------------------------------------------------------------
# Este script tiene como objetivo guiar al usuario a través de un flujo completo
# de análisis de datos con el dataset mtcars, usando herramientas de tidyverse.

# ============================
# 1. CARGA DE LIBRERÍAS Y DATOS
# ============================

# Instalar paquetes si no están instalados (solo necesario una vez)
if(!require(tidyverse)) install.packages("tidyverse")
if(!require(car)) install.packages("car")
if(!require(ggplot2)) install.packages("ggplot2")
if(!require(GGally)) install.packages("GGally")
if(!require(broom)) install.packages("broom")
if(!require(skimr)) install.packages("skimr")
if(!require(reshape2)) install.packages("reshape2")

# Cargar librerías
library(tidyverse)
library(ggplot2)
library(GGally)
library(car)
library(broom)
library(skimr)
library(reshape2)

# Cargar dataset mtcars y transformarlo a tibble
# Convertimos algunas variables numéricas a categóricas

cat("\n1. CARGA Y TRANSFORMACIÓN DE DATOS\n")
data(mtcars)
df <- mtcars %>%
  as_tibble() %>%
  mutate(cyl = as.factor(cyl),
         vs = as.factor(vs),
         am = as.factor(am),
         gear = as.factor(gear),
         carb = as.factor(carb))

# Visualizamos estructura y estadísticas básicas
glimpse(df)
skim(df)

# ============================
# 2. MANIPULACIÓN DE DATOS CON dplyr
# ============================

cat("\n2. MANIPULACIÓN DE DATOS\n")

# Filtrar autos con más de 100 hp y seleccionar algunas columnas
filtro <- df %>%
  filter(hp > 100) %>%
  select(mpg, wt, hp, cyl, am)

# Crear nuevas variables derivadas
transformado <- df %>%
  mutate(wt_kg = wt * 453.592,
         hp_per_cyl = hp / as.numeric(as.character(cyl)),
         efficiency = mpg / wt)

# Agrupación y resumen estadístico por grupos
resumen <- df %>%
  group_by(cyl, am) %>%
  summarise(mean_mpg = mean(mpg),
            sd_mpg = sd(mpg),
            median_hp = median(hp),
            n = n(),
            .groups = 'drop')
print(resumen)

# Uso de pivot_longer (melting) para convertir a formato largo
long_df <- df %>%
  select(mpg, hp, wt, qsec) %>%
  pivot_longer(cols = everything(),
               names_to = "variable",
               values_to = "valor")

# Podemos usar este formato para gráficas o análisis por variable
print(head(long_df))

# Uso de pivot_wider para volver al formato ancho
df_melted <- melt(mtcars, measure.vars = c("mpg", "hp", "wt"))
df_wide <- dcast(df_melted, rownames(mtcars) ~ variable, mean)
print(head(df_wide))

# ============================
# 3. ANÁLISIS EXPLORATORIO DE DATOS (EDA)
# ============================

cat("\n3. ANÁLISIS EXPLORATORIO DE DATOS\n")

# Matriz de correlación
cor(df %>% select_if(is.numeric)) %>% round(2)

# Histogramas
long_df %>%
  ggplot(aes(x = valor)) +
  geom_histogram(bins = 15, fill = "steelblue", color = "white") +
  facet_wrap(~variable, scales = "free") +
  labs(title = "Distribución de variables numéricas") +
  theme_minimal()

# Boxplots por cilindros
ggplot(df, aes(x = cyl, y = mpg, fill = cyl)) +
  geom_boxplot() +
  labs(title = "MPG por número de cilindros") +
  theme_minimal()

# Matriz de dispersión
scatter_matrix <- ggpairs(df %>% select(mpg, wt, hp, qsec),
                          lower = list(continuous = wrap("smooth", alpha = 0.3, size = 0.1)))
print(scatter_matrix)

# ============================
# 4. MODELOS ESTADÍSTICOS
# ============================

cat("\n4. MODELO DE REGRESIÓN\n")

# Modelo simple mpg ~ wt
modelo_simple <- lm(mpg ~ wt, data = df)
summary(modelo_simple)

# Modelo múltiple
modelo_multiple <- lm(mpg ~ wt + hp + cyl, data = df)
summary(modelo_multiple)
tidy(modelo_multiple, conf.int = TRUE)

# ============================
# 5. DIAGNÓSTICO DEL MODELO
# ============================

cat("\n5. DIAGNÓSTICO DE SUPUESTOS\n")
par(mfrow = c(2, 2))
plot(modelo_multiple)
par(mfrow = c(1, 1))

# Normalidad de residuos
shapiro.test(residuals(modelo_multiple))

# Homocedasticidad
car::ncvTest(modelo_multiple)

# Multicolinealidad
vif(modelo_multiple)

# ============================
# 6. VISUALIZACIÓN AVANZADA
# ============================

cat("\n6. VISUALIZACIÓN AVANZADA\n")

# Efectos parciales
ggplot(df, aes(x = wt, y = mpg, color = cyl)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Efectos parciales: Peso y cilindros en mpg") +
  theme_minimal()

# Residuos vs valores ajustados
augment(modelo_multiple) %>%
  ggplot(aes(x = .fitted, y = .resid)) +
  geom_point() +
  geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
  geom_smooth(se = FALSE, color = "blue") +
  labs(title = "Residuos vs Ajustados") +
  theme_minimal()

# ============================
# FIN DEL SCRIPT
# ============================
