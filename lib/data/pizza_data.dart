import '../class/pizza_model.dart';

final List<String> categories = ['Todas', 'Clásicas', 'Especiales', 'Veganas'];

final List<Pizza> pizzas = [
  Pizza(
    name: 'Margarita',
    description: 'Salsa de tomate, mozzarella y albahaca fresca',
    price: 7.99,
    image: 'assets/menu/1.png',
    category: 'Clásicas',
  ),
  Pizza(
    name: 'Pepperoni',
    description: 'Pepperoni, queso mozzarella y salsa especial',
    price: 9.99,
    image: 'assets/menu/2.png',
    category: 'Clásicas',
  ),
  Pizza(
    name: 'Veggie Delight',
    description: 'Vegetales frescos y queso vegano',
    price: 10.99,
    image: 'assets/menu/3.png',
    category: 'Veganas',
  ),
  Pizza(
    name: 'BBQ Chicken',
    description: 'Pollo BBQ, cebolla morada y queso cheddar',
    price: 11.99,
    image: 'assets/menu/4.png',
    category: 'Especiales',
  ),
  Pizza(
    name: 'Cuatro Quesos',
    description: 'Mozzarella, parmesano, gouda y queso azul',
    price: 12.49,
    image: 'assets/menu/5.png',
    category: 'Especiales',
  ),
  Pizza(
    name: 'Mediterránea',
    description: 'Aceitunas, tomate seco, queso feta y orégano',
    price: 11.49,
    image: 'assets/menu/6.png',
    category: 'Especiales',
  ),
];
