Reporte del Experimento MRU
**Datos obtenidos**
| Tiempo (s) | Posición (m) |
|------------|--------------|
| 0 | 2 |
| 1 | 5 |
| 2 | 8 |
| 3 | 11 |
| 4 | 14 |
| 5 | 17 |

**Cálculo de velocidad**
Usando la fórmula: `v = Δx / Δt = (17 - 2) / (5 - 0) = 15 / 5 = 3 m/s`

**Gráficos generados**
- `grafico_basico.png`: solo puntos experimentales
- `grafico_mejorado.png`: puntos + recta de ajuste con ecuación

**Conclusión**
El móvil se desplaza con velocidad constante de **3 m/s**, confirmando el MRU.

**Respuestas al ejercicio sin código nuevo**
**1. ¿Cuál es la velocidad calculada?**

La velocidad se calcula como la pendiente de la recta (m), usando la fórmula de la diferencia de posiciones sobre la diferencia de tiempo:
v=ΔtΔx​=tf​−ti​xf​−xi​​
Tomando los puntos extremos (0,5) y (10,35):
v=10−035−5​=1030​=3 m/s

**2. ¿Cuál es la ecuación de la recta posición(t)?**
La ecuación general del MRU es x(t)=x0​+v⋅t. Sustituyendo nuestros valores calculados:
x(t)=5+3t

**3. ¿Qué valor tiene la posición inicial?**
La posición inicial (x0​) es el valor de la posición cuando t=0.
Según los datos y la gráfica: x0​=5 metros.

**4. Resolución de conflictos en Git**
Si dos personas modifican el mismo archivo en ramas distintas, Git no podrá fusionarlas automáticamente y generará un Merge Conflict.
Para resolverlo, yo seguiría estos pasos:

1. Identificar el archivo con conflicto (marcado por Git).
2. Abrir el archivo y buscar las marcas <<<<<<<, ======= y >>>>>>>.
3. Editar el texto manualmente para dejar la versión correcta (o una combinación de ambas).
4. Guardar el archivo y ejecutar git add para marcarlo como resuelto.
5. Finalizar con git commit y subir los cambios.
