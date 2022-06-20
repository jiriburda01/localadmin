$explorerprocesses = @(Get-WmiObject -Query "Select * FROM Win32_Process WHERE Name='explorer.exe'" -ErrorAction SilentlyContinue)
If ($explorerprocesses.Count -eq 0)
{
    "No explorer process found / Nobody interactively logged on"
}
Else
{
    ForEach ($i in $explorerprocesses)
    {
        $Username = $i.GetOwner().User
        $Domain = $i.GetOwner().Domain
        Write-Host "$Username"
    }
}

$user = "AzureAD\$Username"
$group = 'Administrators'




#Get Current UserName

$CurrentUser = $user

#Get User’s Local Group Membership
net localgroup Administrators

$CurrentUserGroups = net localgroup Administrators

#Check if current user is a member of the Local Admins group

$CurrentUserAdmin = $CurrentUserGroups -like “$user”

#If user is an admin

if ($CurrentUserAdmin) {

write-host "user is admin"
exit 0

#Start Flow

}

#If user is not an admin

else {



#Start Flow

Write-Host "User is not admin"
exit 1618
}




