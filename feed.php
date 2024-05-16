<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Linkedin</title>
    <style>
        /* Estilos CSS para centrar el contenido */
        body {
            display: flex;
            justify-content: center;
            align-items: flex-start; /* Alinea los elementos hacia arriba */
            height: 100vh;
            margin: 0;
            background-color: #F4F2EC;
           
        }
        .loader-container {
            position: relative;
            width: 140px; /* Reducir el ancho del contenedor */
            height: 150px; /* Ajustar la altura para dejar espacio para la imagen */
            top: 180px; /* Mueve el contenedor hacia arriba */
        }
        .loader {
            position: absolute;
            bottom: 52px;
            left: 0;
            width: 100%;
            height: 2.5px; /* Altura de la barra de carga */
            background-color: #ACACAC;
            border-radius: 5px;
            overflow: hidden;
        }
        .progress {
            width: 50%;
            height: 100%;
            background-color: #3357F9;
            border-radius: 5px;
            animation: moveProgress 1.5s cubic-bezier(0.4, 0, 0.2, 1.4) infinite; /* Animación de movimiento con efecto de rebote */
        }
        @keyframes moveProgress {
            0%, 100% { transform: translateX(-50%); } /* Inicia y termina en el extremo izquierdo */
            50% { transform: translateX(100%); } /* En el punto medio, alcanza el extremo derecho */
        }
        .logo {
            position: absolute;
            top: 10px; /* Posiciona el logo encima de la barra de carga */
            left: 50%;
            transform: translateX(-50%);
            width: 195px; /* Hacer que el logo sea más grande */
            height: auto; /* Mantener la proporción de la imagen */
        }
    </style>
</head>
<body>
    <div class="loader-container">
        <div class="loader">
            <div class="progress"></div>
        </div>
        <img src="linkedin1.png" alt="Linkedin1" class="logo">
    </div>
</body>
</html>