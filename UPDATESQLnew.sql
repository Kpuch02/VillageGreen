USE Village_green_final ;
go 

Select cli_prenom , cli_sexe , cli_id , emp_prenom, emp_sexe,  emp_id
FROM client 
JOIN employe on emp_id = cli_id 
/*UPDATE client
set cli_prenom = 'Robert'
where cli_id = 1 */
/*UPDATE client
set cli_sexe = 'F'
WHERE cli_id = 22*/
UPDATE client
set cli_sexe = 'H'
WHERE cli_id  in (9,14)
/* FROM client 
 JOIN commande on client.cli_id = commande.cli_id
 JOIN Livraison on liv_com_id = com_id ; */

 USE MASTER ;
 go 