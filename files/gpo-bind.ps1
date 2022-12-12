function link-gpos {

    [Parameter(Mandatory=$true)][String]$GPOs
    [Parameter(Mandatory=$true)][String]$target
    
    $GPOs | ForEach-Object {
        New-GPLink -Name $_ -Domain training.democloud.local -Target $target -LinkEnabled Yes
    }
}

$target = "DC=training,DC=democloud,DC=local"
$GPOs = "GPO_C_Disable_LLMNR","GPO_C_IPv6","GPO_C_PowerSettings","GPO_U_Optics_Wallpaper"
link-gpos -target $target -GPOs $GPOs

$target = "OU=Computer,OU=Objects,DC=training,DC=democloud,DC=local"
$GPOs = "GPO_C_DisableServerManagerOnStartup","GPO_C_LoopbackProcessing","GPO_C_NewsAndInterests","GPO_C_RDSH","GPO_C_deviceTRUST_Basic","GPO_C_deviceTRUST_Geolocation_Google"
link-gpos -target $target -GPOs $GPOs