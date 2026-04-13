# 1. Configuración de salida
set terminal png size 900,600 enhanced font "Arial,14"
set output "grafico_mejorado.png"

# 2. Etiquetas y estética
set xlabel "Tiempo (s)"
set ylabel "Posición (m)"
set title "MRU - Posición vs Tiempo con Recta de Ajuste"
set grid
set key top left

# 3. Lógica del Ajuste Lineal
# Es vital definir las variables ANTES de la función para evitar errores de inicio
m = 1.0
b = 1.0
f(x) = m*x + b

# Realizamos el ajuste (Fit)
# Gnuplot calculará los valores óptimos de m (velocidad) y b (posición inicial)
fit f(x) 'datos_mru.txt' via m, b

# 4. Generación del gráfico
# Usamos 'using 1:2' para asegurar que lea Columna 1 (X) y Columna 2 (Y)
plot 'datos_mru.txt' using 1:2 with points pt 7 ps 1.5 lc rgb "blue" title 'Datos Experimentales', \
     f(x) with lines lw 3 lc rgb "red" title 'Ajuste Lineal (Regresión)'
