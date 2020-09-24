$Users = Import-Csv -Path "C:\users_emails.csv"       
foreach ($User in $Users)
{
	$email1 = $User.Email
  	Get-ADUser -Filter "mail -eq '$email1'" | 
  	% { Add-ADGroupMember -Identity "Limited external emails" -Members $_ }
}