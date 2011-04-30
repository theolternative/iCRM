<?php
require_once("THR_Core.php");

THR_ConnectToDatabase();
THR_SelectTask();

//getList();
function THR_GetList_Custom() 
{
	/* THR Note: BEGIN customize */
	$query = "SELECT id, name,type,smart, editable, criteria, IF((smart=1 OR editable=0),0,1) as isNormal  FROM thr_folders";

	if (isset($_GET['query']))
	{
    	$query .= " WHERE (name LIKE '%".cleanString($_GET['query'])."%')";
  	}
    else if (isset($_POST['type']))
	{
    	$query .= " WHERE (type='".cleanString($_POST['type'])."')";
  	}
	$query .= ' ORDER BY id';
	/* THR Note: END customize */
	$result = mysql_query($query);
	if( !$result )
		return false;
		
	$nbrows = mysql_num_rows($result);	
	if($nbrows>0)
	{
		while($rec = mysql_fetch_assoc($result))
		{
			$arr[] = $rec;
		}
		$jsonresult = JEncode($arr);
		echo $jsonresult;
	}
	return true;
}

function THR_Update_Custom()
{
	if( isset($_POST['id']) )
	{
	    $id = cleanString($_POST['id']);
		$firstItem = true;
		$updateVars = "";
		
		if( isset($_POST['name']) )
		{
			$firstItem = false;
			$name=cleanString($_POST['name']);
			$updateVars = "name='$name'";
		}
		if( isset($_POST['criteria']) )
		{	
			if( $firstItem )
				$firstItem = false;
			else
				$updateVars .= ", ";
			
			$criteria=cleanString($_POST['criteria']);
			echo "len=".strlen($criteria);
			if( strlen($criteria) == 0 )
				$updateVars .= "criteria='', smart=0";
			else
				$updateVars .= "criteria='$criteria', smart=1";
		}
    
    	$query = "UPDATE thr_folders SET ".$updateVars." WHERE id=$id";
    	$result = mysql_query($query);
		if( !$result )
		{
	    	echo "0;$query;Errore MySQL #".mysql_errno() . ". " . mysql_error();
			return false;
		}
    	echo '1';
		return true;
	}
	echo '0;Indice mancante';
	return false;
}

function THR_Create_Custom()
{
	$name = "Nuova cartella";
	$smart = 0;
	$editable = 1;
	$criteria = "";
	if( isset($_POST['name']) )
		$name=cleanString($_POST['name']);
	if( isset($_POST['criteria']) )
	{
		$criteria=cleanString($_POST['criteria']);
		$smart=1; 
	}
	if( isset($_POST['type']) )
	{
	    $type = cleanString($_POST['type']);
	
	    $selectMaxIDQuery = "select max(id)+1 as newId from thr_folders where type=$type";
    	$selectResult = mysql_query($selectMaxIDQuery);
		if( !$selectResult )
		{
	    	echo "0;$query;Errore MySQL #".mysql_errno() . ". " . mysql_error();
			return false;
		}
		$nbrows = mysql_num_rows($selectResult);	
		if($nbrows>0)
		{
			$rec = mysql_fetch_array($selectResult);
			$newID = $rec["newId"];
			$query = "INSERT INTO thr_folders (id,name,type,editable,smart,criteria) VALUES ($newID, '$name', $type, $editable, $smart, '$criteria')";
			$result = mysql_query($query);
			if( !$result )
			{
		    	echo "0;$query;Errore MySQL #".mysql_errno() . ". " . mysql_error();
				return false;
			}
			echo '1';
			return true;
		}
		else
		{
	    	echo "0;$query;Errore MySQL #".mysql_errno() . ". " . mysql_error();
			return false;
		}
	}
	echo '0;Tipo di cartella non indicato';
	return false;
}
?>