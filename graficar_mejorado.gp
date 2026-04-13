# Configuración del gráfico
set terminal png size 900,600 enhanced font "Arial,14"
set output "grafico_mejorado.png"
# Etiquetas y título
set xlabel "Tiempo (s)"
set ylabel "Posición (m)"
set title "MRU - Posición vs Tiempo con Recta de Ajuste"
# Cuadrícula y leyenda
set grid
set key top left
# Calcular pendiente (velocidad) usando los puntos extremos
# En Gnuplot se puede hacer un ajuste lineal simple
# Primero, definimos una función lineal: f(t) = m*t + b
# Realizar ajuste lineal (mínimos cuadrados)
# Esto lo hace Gnuplot automáticamente
f(t) = m*t + b
fit f(t) "datos_mru.txt" using 1:2 via m, b
# Graficar puntos y recta
plot "datos_mru.txt" using 1:2 with points pt 7 ps 1.5 title "Datos experimentales", \
f(t) with lines lw 3 title sprintf("Ajuste: posición = %.2f·t + %.2f (v=%.2f m/s)", m, b, m)
