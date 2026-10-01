authenticate() {
  local user_correct="nathan"
  local pass_correct="12345"
  local max_attempts=3
  local attempt=1

  while [ $attempt -le $max_attempts ]; do
    echo -n "Utilisateur : "
    read username

    echo -n "Mot de passe : "
    read -s password
    echo ""

    if [ "$username" = "$user_correct" ] && [ "$password" = "$pass_correct" ]; then
      echo -e "\033[32mConnexion réussie !\033[m"
      return 0
    else
      echo -e "\033[31mIdentifiants incorrects ($attempt/$max_attempts)\033[m"
      attempt=$((attempt + 1))
    fi
  done

  echo "Nombre de tentatives dépassé."
  return 1
}