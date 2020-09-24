#####################################
#####################################
##                                 ##
##             Author              ##
##       Akshin Mustafayev         ##
##          version v1.0           ##
##                                 ##
#####################################
#####################################

#Define tns source folder
$TnsSource = "\\your_server\server_share\tnsnames.ora"

#Get System Path Environment value
$Computer = $env:Path

#Split Path value into strings
$Paths = $Computer.Split(";")

#Loop through paths
foreach ($Path in $Paths) 
{
	#If value contains "product\"
	if ($Path -like "*product\*") 
	{
		#If value does not contain "bin"
		if ($Path -notlike "*\bin*") 
		{
			#Initiate tns paths
			$Tns1 = $Path + "\Network\tnsnames.ora"
			$Tns2 = $Path + "\Network\Admin\tnsnames.ora"
			
			#Initiate destionation paths
			$Dest1 = $Path + "\Network"
			$Dest2 = $Path + "\Network\Admin"
			
			#Backup old tns files
			if (Test-Path $Tns1) { Rename-Item -Path $Tns1 -NewName "tnsnames.ora_bak" }
			if (Test-Path $Tns2) { Rename-Item -Path $Tns2 -NewName "tnsnames.ora_bak" }
			
			#Copy new tns from files01 to user tns folder
			Copy-Item $TnsSource -Destination $Dest1
			Copy-Item $TnsSource -Destination $Dest2
			
			# For debugging purposes
			#write-output $Path
			#write-output $Tns1
			#write-output $Tns2
			#write-output $Dest1
			#write-output $Dest2
			#write-output $TnsSource
		}
	}
}

