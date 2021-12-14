Use Village_green_final
Select * from produit where pro_prix <= 100;  /* Afficher produit / afficher les produits egal ou inferieure a 100 */
Select * from produit where pro_stock_alerte <= pro_stock_alerte; /* Afficher les produits dont le stock est inférieur au stock d'alerte */
Select * from client where cli_coeff <= (75) ; /* Affichier les clients avec un quotient superieur a 75 */
Select * from client join pays on cli_type like ' professionnel ' where pay_libelle = 'canada'  ; /* Selectionner les clients professionnel residant au canada*/
