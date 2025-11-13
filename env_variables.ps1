cls

# vypise vsechny promenne v cmd.exe


$pole_user = @()
$pole_user += [Environment]::GetEnvironmentVariables('User')
#echo $pole_user.GetType()
#echo $pole_user.Length



$pole_all = @()
$pole_all += [Environment]::GetEnvironmentVariables()
#echo $pole_all.GetType()
#echo $pole_all.Length

echo "--------------------------------------- All ---------------------------------------"
echo $pole_all
echo "--------------------------------------- User ---------------------------------------"
echo $pole_user

sleep 60





