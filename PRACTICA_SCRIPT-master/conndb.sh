#!/bin/bash
 https://github.com/Miquel-IB/PRACTICA_SCRIPT.git
nomscript=$0   # $0 es el nom del programa
 
function usage () {
   cat <<EOF
Usage: nomscript [-u usuari] [-h hostname] [-t]
   -u   usuario de la base da datos (obligatorio)
   -h   hostname donde se conectara (obligatori)
   -p   puerto 
   -t   no se conecta,  solo comproba conexión
EOF
exit 1
}

 
while getopts ":u:h:p:t:" opt; do
    case "${opt}" in
        u)
			u=${OPTARG}
			;;
        h)
            h=${OPTARG}
            ;;
        p)
            p=${OPTARG}
            puerto=3306
            if
            [ ${OPTARG} -le "1024" || ${OPTARG} -gt "65535" ]; then
				echo "No esta en el rango de puertos"
			fi
            ;;
        t)
            t=${OPTARG}
            ;;
        *)
            usage
            ;;
    esac
done
shift $((OPTIND-1))
 
# Check required switches exist
if [ -z "${u}" ] || [ -z "${h}" ]; then
	usage
fi
