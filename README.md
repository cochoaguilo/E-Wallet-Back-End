# E-Wallet – Back-End

API REST para una billetera personal, desarrollada con **Node.js, Express y Sequelize** sobre **MySQL**. Permite registrar usuarios, iniciar sesión con JWT y gestionar operaciones de ingreso y egreso.

- Front-end: [E-Wallet-Front-End](https://github.com/cochoaguilo/E-Wallet-Front-End)
- Video demo: [E-wallet-video](https://github.com/cochoaguilo/E-wallet-video)

## Tecnologías

- Node.js · Express
- Sequelize · MySQL (`mysql2`)
- JSON Web Tokens (`jsonwebtoken`) y `bcrypt` para hashear contraseñas
- CORS, nodemon

## Estructura

```
├── index.js                          # servidor Express
├── conexion.js                       # conexión a MySQL con Sequelize
├── middleware.js                     # validación del token JWT
├── routes/
│   ├── users.routes.js               # /users
│   └── operations.routes.js          # /operations
├── controllers/
│   ├── users.controllers.js
│   └── operations.controllers.js
└── dump-alkemy-202105071519.sql      # dump de la base de datos
```

## Base de datos

El archivo `dump-alkemy-202105071519.sql` crea la base `alkemy` con las tablas:

- `usuarios`: `id_usuario`, `name`, `surname`, `email`, `password`
- `operation`: `id_operation`, `concept`, `amount`, `date`, `id_usuario`, `id_tipo`
- `tipo`: `id_tipo`, `name` (tipos de operación, por ejemplo ingreso o egreso)

```bash
mysql -u root -p < dump-alkemy-202105071519.sql
```

La cadena de conexión se configura en `conexion.js`.

## Endpoints

### Usuarios

| Método | Ruta           | Descripción                                         |
| ------ | -------------- | --------------------------------------------------- |
| POST   | `/users`       | Registra un usuario (`name`, `surname`, `email`, `password`) |
| POST   | `/users/login` | Inicia sesión (`email`, `password`) y devuelve `token` e `id` |

### Operaciones

Requieren el header `Authorization: Bearer <token>`.

| Método | Ruta              | Descripción                                          |
| ------ | ----------------- | ---------------------------------------------------- |
| GET    | `/operations/:id` | Lista las operaciones del usuario `:id`              |
| POST   | `/operations/:id` | Crea una operación para el usuario `:id` (`concept`, `amount`, `date`, `tipo`) |
| PUT    | `/operations/:id` | Actualiza la operación `:id` (`concept`, `amount`, `date`) |
| DELETE | `/operations/:id` | Elimina la operación `:id`                           |

## Cómo correrlo

Requisitos: Node.js y un servidor MySQL con el dump importado.

```bash
npm install
npm start
```

El servidor queda escuchando en `http://localhost:4700`.
