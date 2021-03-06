<?php
include "config.php";

if(isset($_GET['id']))
{
 $id = $_GET['id'];
 $db = Db::getInstance();
 if($results = Db::getDeleteFromCategory($id))
 {
  echo '<div class="alert alert-success" role="alert">Kategoria "'.$id.'" została pomyślnie usunięta.</div>';   		
 } else 
 {
  echo '<div class="alert alert-danger" role="alert">Błąd przy usuwaniu kategorii o identyfikatorze "'.$nazwa.'".</div>';
 }
}
?>

<div class="row">
 <div class="col-md-12">
  <table class="table">
   <thead>
    <tr>
     <th>ID</th>
     <th>Nazwa kategorii</th>
     <th>Opcje</th>
    </tr>
   </thead>
  <tbody>
<?php
 $db = Db::getInstance();
 $results = Db::getCategoryList();
 foreach ($results as $row)
 {
  echo '<tr>';
  echo '<td>'.$row['id'].'</td><td>'.$row['nazwa'].'</td>'; 
  echo '<td><a href="removeCategory.php?id='.$row['id'].'" type="button" class="btn btn-xs btn-danger">Usuń kategorię</a></td>';
  echo '</tr>';
 }
?>
  </tbody>
 </table>
</div>
</div>