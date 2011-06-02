<?php



$THR_UpdateVarsResult = ""; // accessible from custom methods



// Database setup

function THR_ConnectToDatabase()

{
	mysql_connect("localhost", "root", "") or die("Impossibile connettersi al database: " . mysql_error());
	mysql_select_db("crm");
	mysql_query("SET NAMES utf8");
}



// Select task based upon POST 'task' variable

function THR_SelectTask()

{
	if( !isset($_GET['task']))

	{

		echo "0;Richiesta invalida";

		return false;

	}

	$task = cleanString($_GET['task']);   // Get this from Ext


	switch($task) 

	{

		case "LISTING":             // Give the entire list

			THR_GetList();

			break;

		case "UPDATE":

        	THR_Update();

        	break;

 		case "CREATE":

        	THR_Create();

        	break;

 		case "DELETE":

        	THR_Delete();

        	break;

		default:

			if( function_exists('THR_CustomSelectTask') )

				THR_CustomSelectTask($task);

			break;

	}

	return true;

}

function THR_GetList()

{

	if( function_exists('THR_GetList_Custom') )

		return THR_GetList_Custom();

	global $THR_Table;

	global $THR_SelectQuery;

	global $THR_SelectQuery_WhereClause;

	global $THR_SelectQuery_SearchClause;

	global $THR_SelectQuery_GroupClause;

	global $THR_SelectQuery_OrderClause;

	global $THR_SelectQuery_Create;

	global $THR_SelectQuery_Selection;

	global $THR_FolderKeys;

	global $THR_OrderKeys;

	

	$query = $THR_SelectQuery;

	if( isset($_GET['createId']) )

	{

		$createId = cleanString($_GET['createId']);

		if( strcmp($createId,'0') )

		{

			$query = $THR_SelectQuery_Create." WHERE id=$createId";

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

		return false;

	}

	

	if( isset($_GET['selectionId']) )
	{
		$selectionId = cleanString($_GET['selectionId']);
		if( strcmp($selectionId,'0') )
		{
			$query = $THR_SelectQuery_Selection."$selectionId";
	        if (isset($_GET['search']))
	        {
	            $query .= " AND ".$THR_SelectQuery_SearchClause;
        	}

			$query .= $THR_SelectQuery_GroupClause;
			if( isset($_GET['orderby']))

			{

				$orderby = cleanString($_GET['orderby']);

				if( isset($THR_OrderKeys[$orderby]) )

					$query .= " ORDER BY ".$THR_OrderKeys[$orderby];

				else

					$query .=$THR_SelectQuery_OrderClause;

			}

			else

				$query .=$THR_SelectQuery_OrderClause;
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

		return false;

	}

	if( isset($_GET['folder']) )

	{

		$folderID = cleanString($_GET['folder']);

		

		// Check if master folder

		if( ((int)floor((int)($folderID)/100)*100)!= ((int)$folderID) )

		{

			$folderQuery = "SELECT smart, criteria FROM thr_folders WHERE id=$folderID";

			$folderQueryResult = mysql_query($folderQuery);

			if( !$folderQueryResult )

				return false;

				

			$nbrows = mysql_num_rows($folderQueryResult);	

			if($nbrows>0)

			{			

				$rec = mysql_fetch_assoc($folderQueryResult);

				$smart =(int) $rec['smart'];

				switch( $smart )

				{

					case 1:

						$criteria = $rec['criteria'];

						if( strlen($THR_SelectQuery_WhereClause) )

							$THR_SelectQuery_WhereClause .= " AND ";

						else

							$THR_SelectQuery_WhereClause .= " WHERE ";

						$THR_SelectQuery_WhereClause .= whereClauseFromCriteria($THR_FolderKeys, $criteria);

						break;

					case 2:

						$criteria = $rec['criteria'];

						if( strlen($THR_SelectQuery_WhereClause) )

							$THR_SelectQuery_WhereClause .= " AND ";

						else

							$THR_SelectQuery_WhereClause .= " WHERE ";

						$THR_SelectQuery_WhereClause .= $criteria;

						break;

					default:

						if( strlen($THR_SelectQuery_WhereClause) )

							$THR_SelectQuery_WhereClause .= " AND ";

						else

							$THR_SelectQuery_WhereClause .= " WHERE ";

						$folderContentsQuery = "SELECT * FROM thr_folderContents WHERE folder=$folderID";

						$folderContentsQueryResult = mysql_query($folderContentsQuery);

						if( !$folderContentsQueryResult )

							return false;

						$fc_rows = mysql_num_rows($folderContentsQueryResult);

						$subFolderContentsQuery = "(";

						if($fc_rows>0)

						{

							$fc_rec = mysql_fetch_assoc($folderContentsQueryResult);

							$subFolderContentsQuery .= $fc_rec['object'];

							while($fc_rec = mysql_fetch_assoc($folderContentsQueryResult))

								$subFolderContentsQuery .= ",".$fc_rec['object'];

						}

						$subFolderContentsQuery .= ")";

						$THR_SelectQuery_WhereClause .= "$THR_Table.id IN ".$subFolderContentsQuery;

						break;

					

				}

				$query .= $THR_SelectQuery_WhereClause;

			}

		}

	}

    if (isset($_GET['search']))

	{

		if( strlen($THR_SelectQuery_WhereClause) )

			$query .= " AND ";

		else

			$query .= " WHERE ";

	    $query .= $THR_SelectQuery_SearchClause;

	}

	$query .= $THR_SelectQuery_GroupClause;

	if( isset($_GET['orderby']))

	{

		$orderby = cleanString($_GET['orderby']);

		if( isset($THR_OrderKeys[$orderby]) )

			$query .= " ORDER BY ".$THR_OrderKeys[$orderby].", id";

		else

			$query .=$THR_SelectQuery_OrderClause;

	}

	else

		$query .=$THR_SelectQuery_OrderClause;

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





function THR_Delete()

{

	if( function_exists('THR_Delete_Custom') )

		return THR_Delete_Custom();



	if( isset($_POST['id']) )

	{

		global $THR_Table;

		

	    $id = cleanString($_POST['id']);

		if( function_exists('THR_BeforeDelete') )

		{

			if( !THR_BeforeDelete($id) )

				return false;

		}

		$query = "DELETE FROM $THR_Table WHERE id IN($id)";

	    $result = mysql_query($query);

		if( !$result )

		{

	    	echo "0;$query;Errore MySQL #".mysql_errno() . ". " . mysql_error();

			return false;

		}

		if( function_exists('THR_AfterDelete') )

		{

			if( !THR_AfterDelete($id) )

				return false;

		}

		echo '1';

		return true;

	}

	echo '0;Indici degli oggetti mancanti';

	return false;

}



function THR_Create()

{

	if( function_exists('THR_Create_Custom') )

		return THR_Create_Custom();



	global $THR_Table;



	$query = "INSERT INTO $THR_Table (id,creationDate, name) VALUES (NULL , NOW(),'Nuovo valore')";

	$result = mysql_query($query);

	if( !$result )

	{

	    echo "0;Errore MySQL #".mysql_errno() . ". " . mysql_error();

		return false;

	}

	$newID = mysql_insert_id();

	if( function_exists('THR_AfterCreate') )

	{

		if( !THR_AfterCreate($id) )

			return false;

	}

	echo $newID;

	return true;

}



function THR_Update()

{

	if( function_exists('THR_Update_Custom') )

		return THR_Update_Custom();



	if( isset($_POST['id']) )

	{

		global $THR_Table;

		global $THR_UpdateVars;

		global $THR_UpdateVarsResult;



	    $id = cleanString($_POST['id']);

		if( function_exists('THR_BeforeUpdate') )

		{

			if( !THR_BeforeUpdate($id) )

				return false;

		}



		$firstItem = (strlen($THR_UpdateVarsResult) ? false : true);

		foreach($THR_UpdateVars as $updateVar )

		{

			if( isset($_POST[$updateVar] ) )

			{

				if( $firstItem )

					$firstItem = false;

				else

					$THR_UpdateVarsResult .= ", ";

				$tmpVar = cleanString($_POST[$updateVar]);

				$THR_UpdateVarsResult .= "$updateVar='$tmpVar'";

			}

		}

		    

    	$query = "UPDATE $THR_Table SET ".$THR_UpdateVarsResult." WHERE id=$id";

		$result = mysql_query($query);

		if( !$result )

		{

	    	echo "0;Errore MySQL #".mysql_errno() . ". " . mysql_error();

			return false;

		}

		if( function_exists('THR_AfterUpdate') )

		{

			if( !THR_AfterUpdate($id) )

				return false;

		}

    	echo "1";

		return true;

			      

	}

	echo '0;Indici degli oggetti mancanti';

	return false;

}



// JSON Encode

function JEncode($arr)

{

    if (version_compare(PHP_VERSION,"5.2","<"))

    {    

        require_once("./JSON.php");   //if php<5.2 need JSON class

        $json = new Services_JSON();  //instantiate new json object

        $data=$json->encode($arr);    //encode the data in json format

    } else

    {

        $data = json_encode($arr);    //encode the data in json format

    }

    return $data;

}



// Format data as DD-MM-YYYY

function codeDate ($date) 

{

	$tab = explode ("-", $date);

	$r = $tab[1]."/".$tab[2]."/".$tab[0];

	return $r;

}



function codeGoogleDatetimeFromString_IT($date, $timeInterval)

{

	$dateArray = explode("-",$date);

	if( count($dateArray) != 3 )

	{

		echo "0;Data non nel formato AAAA-MM-GG";

		return null;

	}

	if( !checkdate(intval($dateArray[1]),intval($dateArray[2]),intval($dateArray[0])) )

	{

		echo "0;Data errata";

		return null;

	}

	$timerangeArray = explode("-",$timeInterval);

	if( count($timerangeArray) != 2 )

	{

		echo "0;Intervallo non nel formato HH.MM-HH.MM";

		return null;

	}

	$startTime = explode(".", $timerangeArray[0] );

	$endTime = explode(".", $timerangeArray[1] );

	if( count($startTime) <2 )

		$startTime[1]="0";

	if( count($endTime) <2 )

		$endTime[1]="0";

	

	if(!THR_checktime(intval($startTime[0]),intval($startTime[1])) || !THR_checktime(intval($endTime[0]),intval($endTime[1])) )

	{

		echo "0;Intervallo con valori sbagliati";

		return null;

	}

	

	$when = array("","");

	$when[0]=date( "Y-m-d\TH:i:00.000+02:00", mktime(intval($startTime[0]),intval($startTime[1]),0,intval($dateArray[1]),intval($dateArray[2]),intval($dateArray[0])-2000));

	$when[1]=date( "Y-m-d\TH:i:00.000+02:00", mktime(intval($endTime[0]),intval($endTime[1]),0,intval($dateArray[1]),intval($dateArray[2]),intval($dateArray[0])-2000));

	

	return $when;

}

function THR_checktime($hours, $minutes)

{

	return ($hours>=0 && $hours<=23 && $minutes>=0 && $minutes<=59 );

}

function codePhone_IT ($phone) 

{

	$phone_ok = str_replace("+39","",$phone); // strip international code

	$phone_ok = ereg_replace("[^0-9]","",$phone_ok); // strip all characters other than numbers

	$prefixlength = 3;

	if( $phone_ok[0] == '0' ) // national italian prefix

	{

		if( $phone_ok[1]=='2' || $phone_ok[1]=='6')

			$prefixlength = 2;

		else

		{

			$third = $phone_ok[2];

			if( $third != '1' && $third != '5' && $third != '9' ) // 4-digit prefix

			{

				$prefixlength = 4;

			}

		}

	}

	if( $prefixlength == 2 )

	{

		$phone_ok = substr($phone_ok,0,2)." ".substr($phone_ok,2);

	}

	else if( $prefixlength == 3 )

	{

		$phone_ok = substr($phone_ok,0,3)." ".substr($phone_ok,3);

	}

	else

	{

		$phone_ok = substr($phone_ok,0,4)." ".substr($phone_ok,4);

	}

		

	return $phone_ok;

}



function whereClauseFromCriteria( $keys, $criteria )

{

	$comparatorTypes = array(array("=","LIKE","NOT LIKE"), array(">=","<="), array("<","<=","=",">",">="));





	$result = "";

	$criteriaArray = explode(";;",$criteria );

	for( $i = count($criteriaArray)-1; $i>=0; $i-- )

	{

		$criteriaItem = $criteriaArray[$i];

		if( strcmp($criteriaItem, "" ) )

		{	

		

			list($keyIndex, $comparatorIndex,$value) = explode(";",$criteriaItem);

			

			$value = addslashes($value);

			$subResult = $keys[$keyIndex][0]." ";

			$type = $keys[$keyIndex][1];

			

			if( $comparatorIndex<count($comparatorTypes[$type]) )

			{

				$subResult .= $comparatorTypes[$type][$comparatorIndex];

				switch( $type ) // select type

				{

					case	0: 	//string

						if( $comparatorIndex )

							$subResult .= " '%".$value."%'";

						else

							$subResult .= " '".$value."'";

						break;

					default:

						$subResult .= " '".$value."'";

						break;

				}

				if( strlen($result) )

					$result .= " AND ".$subResult;

				else

					$result = $subResult;

			}

		}

	}

	return $result;

}



function firstAndLastdateFromDates( $dates )

{

	$datesArray = explode("::",$dates );

	if( count( $datesArray ) < 2 )

		return null;

	$firstDateArray = explode(";",$datesArray[0]);

	$lastDateArray = explode(";",$datesArray[count($datesArray)-2]);

	if( count($firstDateArray)<2 || count($lastDateArray)<2 )	

		return null;

	return array($firstDateArray[0],$lastDateArray[0]);

}



function codeString_Name($name)

{

	$result = ucwords(strtolower(trim(cleanString($name))));

	$result = stripslashes($result);

	$result = str_replace("a\'","à",$result);

	$result = str_replace("e\'","è",$result);

	$result = str_replace("i\'","ì",$result);

	$result = str_replace("o\'","ò",$result);

	$result = str_replace("u\'","ù",$result);

	

	$result = stripslashes($result);

	$result = str_replace("a\'","à",$result);

	$result = str_replace("e\'","è",$result);

	$result = str_replace("i\'","ì",$result);

	$result = str_replace("o\'","ò",$result);

	$result = str_replace("u\'","ù",$result);

	//Solve issues like D'amiano => D'Amiano

	$result = str_replace("\'a","\'A",$result);

	$result = str_replace("\'e","\'E",$result);

	$result = str_replace("\'i","\'I",$result);

	$result = str_replace("\'o","\'O",$result);

	$result = str_replace("\'u","\'U",$result);

	return fixEncoding($result);

}



function codeString_Name_UTF8($name)

{

	$result = ucwords(strtolower(trim(cleanString($name))));

	$result = str_replace("a\'","à",$result);

	$result = str_replace("e\'","è",$result);

	$result = str_replace("i\'","ì",$result);

	$result = str_replace("o\'","ò",$result);

	$result = str_replace("u\'","ù",$result);

	

	//Solve issues like D'amiano => D'Amiano

	$result = str_replace("\'a","\'A",$result);

	$result = str_replace("\'e","\'E",$result);

	$result = str_replace("\'i","\'I",$result);

	$result = str_replace("\'o","\'O",$result);

	$result = str_replace("\'u","\'U",$result);

	return $result;

}



function getGoogleEvent($client, $eventId)

{

  $gdataCal = new Zend_Gdata_Calendar($client);

  $query = $gdataCal->newEventQuery();

  $query->setUser('default');

  $query->setVisibility('private');

  $query->setProjection('full');

  $query->setEvent($eventId);

  try {

    $eventEntry = $gdataCal->getCalendarEventEntry($query);

    return $eventEntry;

  } catch (Zend_Gdata_App_Exception $e) {

    return null;

  }

}



function logString($string)

{

  $sanitizedString = mysql_escape_string($string);

  $query = "INSERT INTO thr_logs (id, creationDate, description) VALUES( NULL, NOW(), '$sanitizedString')";

  $result = mysql_query( $query );

  return $result;

}


function logMysqlError($string)

{
  $sanitizedString = mysql_escape_string("ERROR MySQL #".mysql_errno().":".mysql_error()." for '".$string."'");

  $query = "INSERT INTO thr_logs (id, creationDate, description) VALUES( NULL, NOW(), '$sanitizedString')";

  $result = mysql_query( $query );

  return $result;

}



// Fixes the encoding to uf8 
function fixEncoding($in_str) 
{ 
  $cur_encoding = mb_detect_encoding($in_str) ; 
  if($cur_encoding == "UTF-8" && mb_check_encoding($in_str,"UTF-8")) 
    return $in_str; 
  else 
    return utf8_encode($in_str); 
} // fixEncoding 


function cleanString($str, $encode_ent = false) {
	$str  = @trim($str);
	if($encode_ent) {
		$str = htmlentities($str);
	}
	if(version_compare(phpversion(),'4.3.0') >= 0) {
		if(get_magic_quotes_gpc()) {
			$str = stripslashes($str);
		}
		if(@mysql_ping()) {
			$str = mysql_real_escape_string($str);
		}
		else {
			$str = addslashes($str);
		}
	}
	else {
		if(!get_magic_quotes_gpc()) {
			$str = addslashes($str);
		}
	}
	return $str;
}

function updateEventsSubscriptionsStatus($eventId)
{
	// update subscriptions count
	$query = "SELECT count(*) as subCount FROM thr_subscriptions WHERE event=$eventId AND status<=2";
	$result = mysql_query($query);
    if( !$result )
	{
    	echo "0;Errore MySQL #".mysql_errno() . ". " . mysql_error();
		return false;
	}
	if(!mysql_num_rows($result) )
	{
    	echo "0;Errore MySQL #".mysql_errno() . ". " . mysql_error();
		return false;
	}
	$rec = mysql_fetch_assoc($result);
	$subCount = $rec['subCount'];
	$updateQuery = "UPDATE thr_events SET subscriptionsCount=$subCount WHERE id=$eventId";
	$updateResult = mysql_query($updateQuery);
    if( !$updateResult )
	{
    	echo "0;Errore MySQL #".mysql_errno() . ". " . mysql_error();
		return false;
	}

	// select min Subscriptions
	$query = "SELECT minSubscriptions FROM thr_events WHERE id=$eventId";
	$result = mysql_query($query);
    if( !$result )
	{
    	echo "0;Errore MySQL #".mysql_errno() . ". " . mysql_error();
		return false;
	}
	if(!mysql_num_rows($result) )
	{
    	echo "0;Errore MySQL #".mysql_errno() . ". " . mysql_error();
		return false;
	}
	$rec = mysql_fetch_assoc($result);
	$minSubscriptions = (int) $rec['minSubscriptions'];
	
	// select all valid confirmed subscriptions
	$query = "SELECT count(*) as validSubscriptions FROM thr_subscriptions WHERE event=$eventId AND status=2";
	$result = mysql_query($query);
    if( !$result )
	{
    	echo "0;Errore MySQL #".mysql_errno() . ". " . mysql_error();
		return false;
	}
	if(!mysql_num_rows($result) )
	{
    	echo "0;Errore MySQL #".mysql_errno() . ". " . mysql_error();
		return false;
	}
	$rec = mysql_fetch_assoc($result);
	$validSubscriptions = (int) $rec['validSubscriptions'];
	if( $validSubscriptions >= $minSubscriptions )
	{
		$query = "UPDATE thr_events SET subscriptionsStatus=2 WHERE id=$eventId";
		$result = mysql_query($query);
	    if( !$result )
		{
	    	echo "0;Errore MySQL #".mysql_errno() . ". " . mysql_error();
			return false;
		}
		echo '1';
		return true;
	}
	// select all valid confirmed or not yet confirmed or onqueue subscriptions
	$query = "SELECT count(*) as hopefullyValidSubscriptions FROM thr_subscriptions WHERE event=$eventId AND status<=2";
	$result = mysql_query($query);
    if( !$result )
	{
    	echo "0;Errore MySQL #".mysql_errno() . ". " . mysql_error();
		return false;
	}
	if(!mysql_num_rows($result) )
	{
    	echo "0;Errore MySQL #".mysql_errno() . ". " . mysql_error();
		return false;
	}
	$rec = mysql_fetch_assoc($result);
	$hopefullyValidSubscriptions = (int) $rec['hopefullyValidSubscriptions'];

	if( $hopefullyValidSubscriptions >= $minSubscriptions )
	{
		$query = "UPDATE thr_events SET subscriptionsStatus=1 WHERE id=$eventId";
		$result = mysql_query($query);
	    if( !$result )
		{
	    	echo "0;Errore MySQL #".mysql_errno() . ". " . mysql_error();
			return false;
		}
		echo '1';
		return true;
	}
	$query = "UPDATE thr_events SET subscriptionsStatus=3 WHERE id=$eventId";
	$result = mysql_query($query);
    if( !$result )
	{
    	echo "0;Errore MySQL #".mysql_errno() . ". " . mysql_error();
		return false;
	}
	echo '1';
	return true;
}


?>
