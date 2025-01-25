#!/bin/bash

# Función para mostrar el menú
show_menu() {
    clear
    echo "============================="
    echo "      GIT MENU - ARIEL FERNAdNDEZ S. 61608697 uno ***más**"
    echo "============================="
    echo "1. 📋 git status               : Ver el estado del repositorio"
    echo "2. 📂 git add .                : Agregar todos los archivos al área de staging"
    echo "3. ✍️  git commit               : Crear un commit con los cambios"
    echo "4. 🚀 git push                 : Subir los cambios al repositorio remoto"
    echo "5. ⬇️  git pull                 : Traer cambios del repositorio remoto"
    echo "6. 🆕 git init                 : Iniciar un repositorio Git"
    echo "7. ❌ git reset .              : Deshacer cambios no confirmados"
    echo "8. 🔄 git checkout -- .        : Restaurar los archivos a su estado original"
    echo "9. 🕒 git log                  : Ver el historial de commits"
    echo "10. ✏️  git commit --amend       : Modificar el último commit"
    echo "11. 🌟 git checkout -b rama-heroes : Crear una nueva rama llamada 'rama-heroes' y cambiar a ella"
    echo "12. 🛠️ git checkout master     : Cambiar a la rama 'master'"
    echo "13. 🗑️  git branch -d rama-heroes : Eliminar la rama 'rama-heroes'"
    echo "14. ⚡ git commit -am          : Agregar todos los cambios y hacer un commit con mensaje automático"
    echo "15. 🔀 git merge               : Fusionar una rama en la rama actual"
    echo "0. ❎ Salir                    : Salir del menú"
    echo -n "Elige una opción (0-15): "
}

# Función para ejecutar el comando seleccionado
execute_option() {
    case $1 in
        1)
            echo "📋 Mostrando el estado del repositorio..."
            git status
            ;;
        2)
            echo "📂 Agregando todos los archivos..."
            git add .
            if [ $? -eq 0 ]; then
                echo "✅ Archivos añadidos correctamente al área de staging."
            else
                echo "❌ Ocurrió un error al intentar añadir los archivos."
            fi
            ;;
        3)
            echo "✍️  Creando un commit con los cambios..."
            echo -n "Escribe el mensaje del commit: "
            read commit_message
            git commit -m "$commit_message"
            if [ $? -eq 0 ]; then
                echo "✅ Commit creado con éxito."
            else
                echo "❌ Error al crear el commit."
            fi
            ;;
        4)
            echo "🚀 Subiendo los cambios al repositorio remoto..."
            git push
            if [ $? -eq 0 ]; then
                echo "✅ Cambios subidos exitosamente."
            else
                echo "❌ Error al subir los cambios."
            fi
            ;;
        5)
            echo "⬇️  Trayendo cambios del repositorio remoto..."
            git pull
            if [ $? -eq 0 ]; then
                echo "✅ Cambios traídos correctamente."
            else
                echo "❌ Error al traer los cambios."
            fi
            ;;
        6)
            echo "🆕 Iniciando un repositorio Git..."
            git init
            if [ $? -eq 0 ]; then
                echo "✅ Repositorio Git inicializado."
            else
                echo "❌ Error al inicializar el repositorio."
            fi
            ;;
        7)
            echo "❌ Deshaciendo cambios no confirmados..."
            git reset .
            if [ $? -eq 0 ]; then
                echo "✅ Cambios deshechos correctamente."
            else
                echo "❌ Error al intentar deshacer los cambios."
            fi
            ;;
        8)
            echo "🔄 Restaurando archivos al estado original..."
            git checkout -- .
            if [ $? -eq 0 ]; then
                echo "✅ Archivos restaurados al estado original."
            else
                echo "❌ Error al intentar restaurar los archivos."
            fi
            ;;
        9)
            echo "🕒 Mostrando el historial de commits..."
            git log
            ;;
        10)
            echo "✏️  Modificando el último commit..."
            git commit --amend
            if [ $? -eq 0 ]; then
                echo "✅ Último commit modificado correctamente."
            else
                echo "❌ Error al modificar el último commit."
            fi
            ;;
        11)
            echo "🌟 Creando y cambiando a la rama 'rama-heroes'..."
            git checkout -b rama-heroes
            if [ $? -eq 0 ]; then
                echo "✅ Rama 'rama-heroes' creada y activada."
            else
                echo "❌ Error al crear la rama."
            fi
            ;;
        12)
            echo "🛠️ Cambiando a la rama 'master'..."
            git checkout master
            if [ $? -eq 0 ]; then
                echo "✅ Rama 'master' activada."
            else
                echo "❌ Error al cambiar a la rama 'master'."
            fi
            ;;
        13)
            echo "🗑️  Eliminando la rama 'rama-heroes'..."
            git branch -d rama-heroes
            if [ $? -eq 0 ]; then
                echo "✅ Rama 'rama-heroes' eliminada."
            else
                echo "❌ Error al eliminar la rama."
            fi
            ;;
        14)
            echo "⚡ Agregando todos los cambios y creando un commit..."
            git commit -am "Modificación - $(date +'%Y-%m-%d %H:%M:%S')"
            if [ $? -eq 0 ]; then
                echo "✅ Cambios agregados y commit creado exitosamente."
            else
                echo "❌ Error al crear el commit."
            fi
            ;;
        15)
            echo "🔀 Fusionando una rama en la rama actual..."
            echo -n "Escribe el nombre de la rama que deseas fusionar: "
            read branch_name
            git merge "$branch_name"
            if [ $? -eq 0 ]; then
                echo "✅ Rama '$branch_name' fusionada correctamente."
            else
                echo "❌ Error al fusionar la rama."
            fi
            ;;
        0)
            echo "❎ Saliendo del menú. ¡Hasta luego!"
            exit 0
            ;;
        *)
            echo "❌ Opción inválida. Por favor, elige una opción entre 0 y 15."
            ;;
    esac
    echo "⏳ Mostrando el resultado por 3 segundos..."
    sleep 3
    clear
}

# Bucle principal para mostrar el menú y ejecutar las opciones0
while true; do
    show_menu
    read option
    execute_option $option
done