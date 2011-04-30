<?php
require_once("THR_Core.php");
$search="";
if (isset($_GET['search'])) $search = cleanString($_GET['search']);

$THR_Table = "thr_contacts";
$THR_UpdateVars = array("surname","name","companyName","isCompany","description","tags","isAssociate","genre","addresses","privacyChecked","birthDate","fiscalID","VAT","phones","emails","internet");
$THR_SelectQuery = "SELECT *,if(isCompany=1,companyName,concat(surname, ' ', name)) as fullName, if(isCompany=1,'',companyName) as subtitleName FROM thr_contacts";
$THR_SelectQuery_WhereClause = "";
$THR_SelectQuery_SearchClause = "((name LIKE '%$search%') OR (surname LIKE '%$search%') OR (companyName LIKE '%$search%') OR (addresses LIKE '%$search%') OR (phones LIKE '%$search%') OR (emails LIKE '%$search%') OR (internet LIKE '%$search%') OR (tags LIKE '%$search%'))";
$THR_SelectQuery_GroupClause = "";
$THR_SelectQuery_OrderClause = " ORDER BY fullName LIMIT 100";
$THR_SelectQuery_Create = $THR_SelectQuery;
$THR_SelectQuery_Selection = $THR_SelectQuery.$THR_SelectQuery_WhereClause." WHERE thr_contacts.id=";
$THR_FolderKeys = array(array("name","0"),array("surname","0"),array("tags","0"));
$THR_OrderKeys = array("id","fullName","addresses");

THR_ConnectToDatabase();
THR_SelectTask();

function THR_BeforeDelete($ids)
{
    // delete google events if present
    $idsArray = explode(",",$ids);
    foreach( $idsArray as $id )
    {
        $checkquery = "SELECT id FROM thr_subscriptions WHERE creator=$id OR person=$id";
        $checkResult = mysql_query($checkquery);
        if( !$checkResult )
        {
            echo "0;Errore MySQL #".mysql_errno() . ". " . mysql_error().$checkquery;
            return false;
        }
        if( mysql_num_rows($checkResult) )
        {
            echo "0;Un contatto legato a delle iscrizioni. Impossibile eliminarlo";
            return false;
        }

        $invCheckquery = "SELECT id FROM thr_invoices WHERE person=$id";
        $invCheckqueryResult = mysql_query($invCheckquery);
        if( !$invCheckqueryResult )
        {
            echo "0;Errore MySQL #".mysql_errno() . ". " . mysql_error().$invCheckquery;
            return false;
        }
        if( mysql_num_rows($invCheckqueryResult) )
        {
            echo "0;Un contatto legato ad una fattura. Impossibile eliminarlo";
            return false;
        }
    }
    return true;
}
?>