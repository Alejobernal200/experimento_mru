#!/bin/bash
# Script para calcular velocidad en MRU (Rama: calculo_velocidad)

ARCHIVO="datos_mru.txt"

echo "=== Cálculo de velocidad (MRU) ==="

# 1. Verificar si el archivo existe para evitar errores de lectura
if [ ! -f "$ARCHIVO" ]; then
    echo "Error: No encuentro el archivo $ARCHIVO en esta carpeta."
    echo "Asegúrate de que el nombre sea correcto."
    exit 1
fi

# 2. Extraer datos ignorando texto o comentarios (usamos grep para filtrar solo números)
# Esto evita que 'head' tome los títulos como valores
primer_t=$(grep -v '[a-zA-Z#]' $ARCHIVO | head -n 1 | awk '{print $1}')
primer_x=$(grep -v '[a-zA-Z#]' $ARCHIVO | head -n 1 | awk '{print $2}')
ultimo_t=$(grep -v '[a-zA-Z#]' $ARCHIVO | tail -n 1 | awk '{print $1}')
ultimo_x=$(grep -v '[a-zA-Z#]' $ARCHIVO | tail -n 1 | awk '{print $2}')

# 3. Mostrar los puntos detectados (útil para depurar si algo falla)
echo "Punto inicial detectado: t=$primer_t s, x=$primer_x m"
echo "Punto final detectado: t=$ultimo_t s, x=$ultimo_x m"

# 4. Calcular las diferencias (Deltas)
delta_t=$(echo "$ultimo_t - $primer_t" | bc)
delta_x=$(echo "$ultimo_x - $primer_x" | bc)

# 5. Validación crítica: Evitar la división por cero
# Si el tiempo final es igual al inicial, delta_t será 0
if (( $(echo "$delta_t == 0" | bc -l) )); then
    echo "¡Error Matemático!: El intervalo de tiempo es 0. No puedo dividir por cero."
else
    # 6. Calcular velocidad con 2 decimales
    velocidad=$(echo "scale=2; $delta_x / $delta_t" | bc)
    echo "-----------------------------------"
    echo "Velocidad calculada: $velocidad m/s"
    echo "-----------------------------------"

    # 7. Guardar el resultado en velocidad.txt (sobreescribe el anterior)
    echo "Velocidad del móvil: $velocidad m/s" > velocidad.txt
    echo "Fórmula: posición(t) = $primer_x + $velocidad * t" >> velocidad.txt
    echo "Resultado guardado con éxito en 'velocidad.txt'"
fi
