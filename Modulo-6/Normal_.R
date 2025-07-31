#-------------------------------------------------------------------------------
# Ejercicio 1: Media poblacional conocida, calcular cola superior
# Planteamiento:
# En una población con estatura media de 170 cm y desviación estándar de 8 cm,
# se selecciona una muestra de n = 100 personas.
# ¿Cuál es la probabilidad de que la media muestral sea superior a 172 cm?
#-------------------------------------------------------------------------------

mu <- 170
sigma <- 8
n <- 100
se <- sigma / sqrt(n)

# P(X̄ > 172)
pnorm(172, mean = mu, sd = se, lower.tail = FALSE)

#-------------------------------------------------------------------------------
# Ejercicio 2: Observación individual, cola inferior
# Planteamiento:
# El salario mensual en una empresa sigue una distribución normal con media $2500
# y desviación estándar $300. ¿Qué probabilidad hay de que un empleado gane menos de $2000?
#-------------------------------------------------------------------------------

pnorm(2000, mean = 2500, sd = 300)

#-------------------------------------------------------------------------------
# Ejercicio 3: Media muestral, entre dos valores
# Planteamiento:
# El tiempo de carga de un sitio web se distribuye normalmente con media 5 segundos
# y desviación estándar 1.2 segundos. Para una muestra de 50 visitas,
# ¿cuál es la probabilidad de que la media esté entre 4.8 y 5.2 segundos?
#-------------------------------------------------------------------------------

se <- 1.2 / sqrt(50)
p_superior <- pnorm(5.2, mean = 5, sd = se)
p_inferior <- pnorm(4.8, mean = 5, sd = se)
p_superior - p_inferior

#-------------------------------------------------------------------------------
# Ejercicio 4: Valor percentil (observación individual)
# Planteamiento:
# Las notas de un examen siguen una distribución normal con media 75 y desviación 9.
# ¿Qué nota mínima debe obtener un estudiante para estar en el top 10%?
#-------------------------------------------------------------------------------

qnorm(0.90, mean = 75, sd = 9)

#-------------------------------------------------------------------------------
# Ejercicio 5: Media muestral, cola inferior
# Planteamiento:
# La duración de bombillas sigue N(800, 100) horas. En un lote de 25 bombillas,
# ¿cuál es la probabilidad de que la duración media sea inferior a 780 horas?
#-------------------------------------------------------------------------------

se <- 100 / sqrt(25)
pnorm(780, mean = 800, sd = se)

#-------------------------------------------------------------------------------
# Ejercicio 6: Observación individual, cola superior
# Planteamiento:
# El peso de paquetes postales sigue N(500, 45) gramos.
# ¿Qué probabilidad hay de que un paquete pese más de 600 gramos?
#-------------------------------------------------------------------------------

pnorm(600, mean = 500, sd = 45, lower.tail = FALSE)

#-------------------------------------------------------------------------------
# Ejercicio 7: Media muestral, percentil
# Planteamiento:
# El coeficiente intelectual (CI) tiene distribución N(100, 15). Para grupos de 9 personas,
# ¿qué valor marca el límite inferior del 5% de las medias muestrales?
#-------------------------------------------------------------------------------

se <- 15 / sqrt(9)
qnorm(0.05, mean = 100, sd = se)

#-------------------------------------------------------------------------------
# Ejercicio 8: Observación individual, entre valores
# Planteamiento:
# La temperatura ambiente en verano sigue N(22, 3) °C.
# ¿Qué probabilidad hay de registrar entre 20°C y 25°C?
#-------------------------------------------------------------------------------

p_sup <- pnorm(25, mean = 22, sd = 3)
p_inf <- pnorm(20, mean = 22, sd = 3)
p_sup - p_inf

#-------------------------------------------------------------------------------
# Ejercicio 9: Media muestral, cola superior
# Planteamiento:
# El consumo eléctrico mensual sigue N(300, 40) kWh. Para 64 hogares,
# ¿cuál es la probabilidad de que la media muestral supere los 310 kWh?
#-------------------------------------------------------------------------------

se <- 40 / sqrt(64)
pnorm(310, mean = 300, sd = se, lower.tail = FALSE)

#-------------------------------------------------------------------------------
# Ejercicio 10: Valor percentil (media muestral)
# Planteamiento:
# La altura de pinos sigue N(15, 2.5) metros. Para muestras de 36 árboles,
# ¿qué altura media marca el percentil 85?
#-------------------------------------------------------------------------------

se <- 2.5 / sqrt(36)
qnorm(0.85, mean = 15, sd = se)

#-------------------------------------------------------------------------------
# Ejercicio 11: Observación individual, cola inferior extrema
# Planteamiento:
# Los depósitos bancarios siguen N(12000, 3000) dólares.
# ¿Probabilidad de encontrar una cuenta con menos de 5000 dólares?
#-------------------------------------------------------------------------------

pnorm(5000, mean = 12000, sd = 3000)

#-------------------------------------------------------------------------------
# Ejercicio 12: Media muestral, entre valores (tamaño grande)
# Planteamiento:
# El tiempo de procesamiento de transacciones sigue N(0.8, 0.15) segundos.
# Para 100 transacciones, ¿probabilidad de media entre 0.78 y 0.82 segundos?
#-------------------------------------------------------------------------------

se <- 0.15 / sqrt(100)
p_sup <- pnorm(0.82, mean = 0.8, sd = se)
p_inf <- pnorm(0.78, mean = 0.8, sd = se)
p_sup - p_inf

#-------------------------------------------------------------------------------
# Ejercicio 13: Comparación de probabilidades (individual vs muestral)
# Planteamiento:
# Para una población N(50, 7), calcular:
# a) P(X > 55) para observación individual
# b) P(X̄ > 55) para n=25
#-------------------------------------------------------------------------------

# a) Individual
individual <- pnorm(55, mean = 50, sd = 7, lower.tail = FALSE)

# b) Muestral
se <- 7 / sqrt(25)
muestral <- pnorm(55, mean = 50, sd = se, lower.tail = FALSE)

c(Individual = individual, Muestral = muestral)

#-------------------------------------------------------------------------------
# Ejercicio 14: Simetría de la distribución
# Planteamiento:
# Para una distribución normal con μ=100 y σ=12, calcular:
# P(88 < X < 112) para observaciones individuales
#-------------------------------------------------------------------------------

p_sup <- pnorm(112, mean = 100, sd = 12)
p_inf <- pnorm(88, mean = 100, sd = 12)
p_sup - p_inf

#-------------------------------------------------------------------------------
# Ejercicio 15: Media muestral, cola inferior extrema
# Planteamiento:
# La producción diaria sigue N(500, 80) unidades. En 40 días,
# ¿probabilidad de media muestral menor a 480 unidades?
#-------------------------------------------------------------------------------

se <- 80 / sqrt(40)
pnorm(480, mean = 500, sd = se)

#-------------------------------------------------------------------------------
# Ejercicio 16: Valor extremo superior (observación)
# Planteamiento:
# Los ingresos anuales siguen N(45000, 8000) dólares.
# ¿Qué ingreso marca el percentil 95?
#-------------------------------------------------------------------------------

qnorm(0.95, mean = 45000, sd = 8000)

#-------------------------------------------------------------------------------
# Ejercicio 17: Media muestral, rango intermedio
# Planteamiento:
# El diámetro de tornillos sigue N(5.2, 0.6) mm. Para muestras de 16 tornillos,
# ¿probabilidad de media entre 5.0 y 5.4 mm?
#-------------------------------------------------------------------------------

se <- 0.6 / sqrt(16)
p_sup <- pnorm(5.4, mean = 5.2, sd = se)
p_inf <- pnorm(5.0, mean = 5.2, sd = se)
p_sup - p_inf

#-------------------------------------------------------------------------------
# Ejercicio 18: Efecto del tamaño muestral
# Planteamiento:
# Para una población N(150, 20), calcular:
# a) P(X̄ > 160) con n=25
# b) P(X̄ > 160) con n=100
#-------------------------------------------------------------------------------

# a) n=25
se25 <- 20 / sqrt(25)
p25 <- pnorm(160, mean = 150, sd = se25, lower.tail = FALSE)

# b) n=100
se100 <- 20 / sqrt(100)
p100 <- pnorm(160, mean = 150, sd = se100, lower.tail = FALSE)

c(n25 = p25, n100 = p100)

#-------------------------------------------------------------------------------
# Ejercicio 19: Combinación de colas
# Planteamiento:
# El pH de un lago sigue N(7.5, 0.4). ¿Probabilidad de pH fuera del rango 6.8-8.2?
#-------------------------------------------------------------------------------

p_inferior <- pnorm(6.8, mean = 7.5, sd = 0.4)
p_superior <- pnorm(8.2, mean = 7.5, sd = 0.4, lower.tail = FALSE)
p_inferior + p_superior

#-------------------------------------------------------------------------------
# Ejercicio 20: Identificación de percentiles (media muestral)
# Planteamiento:
# Para una población N(80, 12), en muestras de 36 observaciones,
# ¿qué rango central contiene el 90% de las medias muestrales?
#-------------------------------------------------------------------------------

se <- 12 / sqrt(36)
lim_inf <- qnorm(0.05, mean = 80, sd = se)
lim_sup <- qnorm(0.95, mean = 80, sd = se)
c(Límite_Inferior = lim_inf, Límite_Superior = lim_sup)