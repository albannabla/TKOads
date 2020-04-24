<?php 
$con = mysqli_connect("localhost", "root", "", "tkoads");

//SCRAPER FUNCTION

//definizione array of urls
$url = ['https://www.property.hk/eng/property_search.php?bldg=TSEUNG+KWAN+O+PLAZA&size1=&size2=&price1=&price2=&rent1=&rent2=&prop=&isphoto=&greenform=&page=&e=&y=1&pt=A&dt=&saleType=1&sizeType=1'];

//definizione variabili
$numpage = 1;
$transactions = array(
'date' =>
array(
),
'ref' =>
array(
),
'area' =>
array(
),
'price' =>
array(
),
);
$tempdate = array();
$tempref = array();
$temparea = array();
$tempprice = array();
$curl = curl_init();

//fetching data from Property.hk
for ($x = 0; $x <$numpage; $x++) {

curl_setopt($curl, CURLOPT_URL, $url[$x]);
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
$results = curl_exec($curl);

//match all transactions' date
preg_match_all('!checknum.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*Date:(.*)\<!',$results, $match);
array_push($tempdate, $match[1]);

//match ref
preg_match_all('!.*value=(.*) onclick.*checknum!',$results, $match);
array_push($tempref, $match[1]);

//match area
preg_match_all('!checknum.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*center>(.*)\<!',$results, $match);
array_push($temparea, $match[1]);

//match price
preg_match_all('!checknum.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*\n.*center>(.*)M!',$results, $match);
array_push($tempprice, $match[1]);
}

//provision in case there is only 1 page in the year
$pagelines = 20;

//create array
for ($x = 0; $x <$numpage; $x++) {
for ($y = 0; $y <$pagelines; $y++) {
  array_push($transactions['date'],$tempdate[$x][$y]);  
  array_push($transactions['ref'],$tempref[$x][$y]);  
  array_push($transactions['area'],$temparea[$x][$y]);  
  array_push($transactions['price'],$tempprice[$x][$y]);   
}
}

$totallines = 20;

for ($x = 0; $x <$totallines; $x++) {
$date = print_r($transactions['date'][$x],true);
$ref = print_r($transactions['ref'][$x],true);
$area = print_r($transactions['area'][$x], true);
$price = print_r($transactions['price'][$x], true);
if ($area > 0) {
  $pricepersft = (int)$price*1000000/(int)$area;
}
  else{
    $pricepersft = 0; 
  }

$sql5 = "INSERT INTO Propertyhk (Date, Ref, Area, Price, Pricepersft) VALUES ('$date','$ref','$area','$price','$pricepersft')";
$con -> query($sql5);

}

$sql4 = "DELETE t1 FROM Propertyhk t1 INNER JOIN Propertyhk t2 WHERE t1.id < t2.id AND t1.Date = t2.Date AND t1.Area = t2.Area AND t1.Price = t2.Price";
$con -> query($sql4);
  


$sql3 = "DELETE FROM Propertyhk WHERE Price IS NULL OR Area IS NULL OR Pricepersft < 8000";
$con -> query($sql3);

  ?>