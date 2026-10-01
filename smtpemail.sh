smtpemail() {
  echo -n "Destinataire : "
  read to

  echo -n "Sujet : "
  read subject

  echo "Saisissez votre message (appuyez sur Entrée puis Ctrl+D pour envoyer) :"
  mail -s "$subject" "$to"

  if [ $? -eq 0 ]; then
    echo -e "\033[32mE-mail envoyé avec succès !\033[m"
  else
    echo -e "\033[31mÉchec de l'envoi de l'e-mail.\033[m"
  fi
}