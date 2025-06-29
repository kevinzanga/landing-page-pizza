
# 🍕 Landing Page Pizza

**Landing Page moderna y responsiva para una pizzería**, desarrollada con **Flutter Web**. 

---

## 📋 Descripción del Proyecto

Este proyecto es una landing page creada con Flutter para promocionar una pizzería, incluyendo secciones clave que brindan una experiencia completa y atractiva para los visitantes:

- **Header fijo** con navegación suave entre secciones.
- **Hero Section** impactante para captar atención.
- **Promociones** para destacar ofertas especiales.
- **Menú interactivo** con pizzas filtrables por categorías.
- **Info Cards** con ventajas y beneficios.
- **Testimonios** reales de clientes satisfechos.
- **Formulario de contacto** funcional y limpio.
- **Footer** con información adicional y enlaces útiles.

---

## 🏗 Estructura del Proyecto

### 1. Header
- Barra fija en la parte superior con navegación que usa `GlobalKey` para desplazamiento suave.

### 2. Hero Section
- Imagen y texto llamativo con botón que dirige al menú.

### 3. Promo Page
- Sección dedicada a promociones especiales.

### 4. Menu Page
- Lista dinámica de pizzas con imagen, descripción y precio.
- Filtros por categorías con chips seleccionables.
- Diseño responsivo (adaptable a móvil y escritorio).
- Animaciones de hover y toque en las tarjetas de pizza.

### 5. Info Cards
- Tarjetas que resaltan los beneficios de la pizzería.
- Layout flexible para múltiples tamaños de pantalla.

### 6. Testimonials
- Opiniones de clientes en tarjetas organizadas con diseño limpio.

### 7. Contact Page
- Formulario sencillo y centrado para contacto directo.

### 8. Footer
- Pie de página con información de contacto y enlaces a redes sociales.

---

## ⚙️ Tecnologías y Herramientas

- **Flutter Web** para desarrollo multiplataforma y responsivo.
- Widgets personalizados para mantener modularidad y limpieza.
- Animaciones con `AnimationController` para mejorar experiencia.
- Manejo sencillo de estado con StatefulWidgets.
- Temas centralizados en `core/theme.dart` para coherencia visual.
- Scroll controlado con `ScrollController` y navegación por `GlobalKey`.

---

## 🚀 Cómo Ejecutar el Proyecto

```bash
git clone https://github.com/kevinzanga/landing-page-pizza.git
cd landing-page-pizza
flutter pub get
flutter run -d chrome

