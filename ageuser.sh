ageuser() {
  echo -n "Quel est votre âge ? "
  read age

  if [ $age -ge 18 ]; then 
    echo "Vous êtes majeur"
  else
    echo "Vous êtes mineur"
  fi 
}