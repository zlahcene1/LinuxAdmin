# !/bin/bash

echo "\t \e \033[32m Bienvenue dans le TrashBeen"

touch fichier1 fichier2 fichier3 fichier4 fichier5 fichier6 fichier7 fichier8 fichier9
echo "Création des neufs fichiers.............\nDONE"

# Demander à l'utilisateur le nombre de valeurs à entrer
echo "Combien de fichiers voulez vous selectionez ?\n"
echo "entre 1 et 9: "
read nb_args

# Verfifier le nombres de fichiers
while ((nb_args < 1)) || ((nb_args > 9)); do
    echo "Combien de fichiers voulez vous selectionez ?\n"
    echo "entre 1 et 9: "
    read nb_args    
done

# Initialiser le tableau avec la taille spécifiée
tableau=()
for (( i=0; i<$nb_args; i++ )); do
  tableau+=("")
done

# Boucle pour demander remplir le tableau avec les fichiers
echo "Veuillez rentrer les noms des fichiers:"

for (( i=0; i<$nb_args; i++ )); do
  # Demander à l'utilisateur de saisir le nom des fichiers
  echo "nom du fichier : $((i+1)) :"
  read nom_fichier

  # Ajouter la valeur au tableau
  tableau[$i]="$nom_fichier"
done

# Deplacer le tableau dans /home/user/trash

for valeur in "${tableau[@]}"; do
    valeur="archive_$(date +"%d_%m_%Y_%H_%M").tar.gz"
    echo "${tableau[@]} a été archivé sous le nom de $valeur"
    
    #bouger les fichiers dans la trash
    cp "./${tableau[@]}" "./$valeur" #BUUGGGG!!
    mv "$valeur" "/home/user/trash"

    echo "Voulez vous supprimer ${tableau[@]} ? o/n"
    read reponse
    if [ $reponse = "o" ]; then
        rm "./${tableau[@]}"
    fi  
done

echo "Fin du script"
