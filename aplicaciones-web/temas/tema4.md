# Resumen Unidad 4: CSS3 y Diseño Responsivo

## Sesión 5: CSS3

### Selectores
- **Función:** Señalar qué elementos estilizar.
- **Tipos:**
  - Por **etiqueta** (`p`, `h1`, `a`)
  - Por **clase** (`.boton`)
  - Por **id** (`#principal`)
- **Combinadores:**
  - Descendiente (`div p`)
  - Hijo directo (`ul > li`)
  - Hermano adyacente (`h2 + p`)
  - Atributo (`input[type="email"]`)
- **Pseudo-clases:** `:hover`, `:focus`
- **Pseudo-elementos:** `::before`, `::first-line`

### Modelo de Caja
- Todo elemento se representa como una **caja** con 4 capas:
  1. **Contenido**
  2. **Padding** (espacio interno)
  3. **Border** (borde)
  4. **Margin** (espacio externo)
- **`box-sizing: border-box`:** Hace que el `width` y `height` incluyan el padding y el border.

### Tipografía Web
- Elementos clave: **familia tipográfica**, **jerarquía** (tamaños, pesos), **interlineado** (`line-height`), **contraste**.
- **Google Fonts:** Fuentes web optimizadas y de código abierto.
- **Fallbacks:** Especificar fuentes alternativas (ej: `'Inter', Arial, sans-serif`).

### Variables CSS
- **Función:** Valores reutilizables para mantener consistencia.
- **Declaración:** `--nombre-variable: valor;` en `:root`.
- **Uso:** `var(--nombre-variable)`.
- **Ventajas:** Mantenibilidad y consistencia.

---

## Sesión 6: Diseño Responsive

### Media Queries
- Aplican reglas CSS condicionalmente según características del dispositivo (ancho, orientación, resolución).
- **Ejemplo:** `@media (max-width: 600px) { ... }`
- **Enfoque Mobile First:** Diseñar primero para móviles y usar `@media (min-width: ...)` para pantallas más grandes.

### Flexbox (Flexible Box Layout)
- Diseño en **una dimensión** (fila o columna).
- **Propiedades clave:**
  - `display: flex`
  - `flex-direction`
  - `justify-content` (alineación horizontal)
  - `align-items` (alineación vertical)
  - `flex-wrap`

### CSS Grid
- Diseño en **dos dimensiones** (filas y columnas).
- **Propiedades clave:**
  - `display: grid`
  - `grid-template-columns` / `grid-template-rows`
  - `gap` (espacio entre elementos)
  - `grid-column` / `grid-row`

---

## Sesión 7: Frameworks CSS Modernos

### Frameworks Basados en Componentes (Bootstrap)
- Ofrecen **componentes preconstruidos** (botones, tarjetas, menús).
- **Ventaja:** Prototipado rápido y consistencia visual.
- **Ejemplo de clase:** `.btn`, `.card`

### Frameworks Utility-First (Tailwind CSS)
- Ofrecen **clases atómicas** para construir diseños personalizados.
- **Ventaja:** Control total y flexibilidad sin escribir CSS personalizado.
- **Ejemplo de clase:** `.p-4`, `.bg-blue-500`, `.text-center`

### Mitos y Realidades
- **Mito:** "Bootstrap hace que todas las webs se vean igual."
  - **Realidad:** Es totalmente personalizable.
- **Mito:** "Tailwind ensucia el HTML."
  - **Realidad:** Las clases representan decisiones de diseño explícitas y el código se purga en producción.