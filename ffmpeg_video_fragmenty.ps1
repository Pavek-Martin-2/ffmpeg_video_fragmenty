cls

# ffmpeg fragmenty videa

Set-PSDebug -Strict # jakakoliv nedeklarovana promenna pri jejim zavolani napise chybu skriptu
#echo $abcdefgh # test - Set-PSDebug -Strict

Remove-Variable video_input,vyraz -ErrorAction SilentlyContinue

# testuje jesli existuje soubor $file_jpg
$file_jpg = ("help.jpg")
$jpg_size = "281,633" # rozmer obrazku $file_jpg (z programu mediainfo )
if (-not (Test-Path $file_jpg)){
write-host -ForegroundColor Red "nenalezen soubor $file_jpg"
echo "konec"
sleep 5
Exit
}


# test jestli program nalezl utilitu "ffmpeg" aby bylo mozne vytvaret take souboru *.mp3 ( uspora mista na disku )
$prog = "ffmpeg"
#$prog = "ffmpegXXXX" # testovaci
if (-not ( Get-Command $prog -ErrorAction SilentlyContinue )){
write-host -ForegroundColor Red "nenalezen program - $prog"
echo "konec"
sleep 5
Exit
}


<#
sou dve moznosti
bud se mu zada nazev vstupniho videa jako argv[0]
a kdyz ho nedostane tak se je uvnitr jeste zapta na nazev
#>

$delka_args = $args.length
#echo "celkem args $delka_args" # int32
 
if ( $delka_args -eq 0 ) { #int32
echo "nenalezen argument 'args[0]'"
$video_input = Read-host -Prompt "Zadej nazev vstupniho video souboru" -ErrorAction SilentlyContinue
}else{
$video_input = $args[0]
}

# test jestli existuje nazev zadaneho vstupniho videa v aktualni adresari
if (-not (Test-Path $video_input)){
write-host -ForegroundColor Red "nenalezen soubor $video_input"
echo "konec"
sleep 5
Exit
}

echo "byl vybran soubor $video_input"

# urizne primonu u $video_input a necha jenom nazev
$prefix_name_output = $video_input.Substring(0,$video_input.Length -4)
$prefix_name_output += "-"
#echo $prefix_name_output


# okno jpg vyberu
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = "Moznosti"
$form.ClientSize = [System.Drawing.Size]::new(301,700)
$form.StartPosition = 'CenterScreen'

$picture = New-Object System.Windows.Forms.PictureBox
$picture.SizeMode = 'Zoom'
$picture.Location = [System.Drawing.Point]::new(10,10)
$picture.Size = [System.Drawing.Size]::new($jpg_size)
$picture.Image = [System.Drawing.Image]::FromFile($file_jpg)
$form.Controls.Add($picture)


$label = New-Object System.Windows.Forms.Label
$label.Text = "Vyber  0 - 9 "
$label.Font = New-Object System.Drawing.Font("Arial",12,[System.Drawing.FontStyle]::Bold)
$label.AutoSize = $true
$label.Location = New-Object System.Drawing.Point(28,660)
$form.Controls.Add($label)


$text = New-Object System.Windows.Forms.TextBox
$text.Location = [System.Drawing.Point]::new(130,657)
$text.Width = 50
$text.Font = New-Object System.Drawing.Font("Arial",12,[System.Drawing.FontStyle]::Bold)
$form.Controls.Add($text)


$ok = New-Object System.Windows.Forms.Button
$ok.Location = New-Object System.Drawing.Point(50,685)
$ok.Text = "OK"
$ok.Location = [System.Drawing.Point]::new(200,658)
$ok.Add_Click({ $form.Tag = $text.Text; $form.Close() })
$form.Controls.Add($ok)

$form.ShowDialog() | Out-Null
Remove-Variable vyraz -ErrorAction SilentlyContinue
$vyraz = $form.Tag

$out_1 = "bylo vybrano"


# easter egg ( velikonocni vajicko )
if ( $video_input -like "nakej kokot kterej krade napady a pak si to dava u sebe na youtube a vydava to tam pred lidma ze stim prisel von.mp4" ){
$vyraz = "9"
echo "easter egg"
sleep 3
}


# celkove pocet fragmenu je 27 ( protoze 4 fragmenty jsou spolecny, tyka se to voleb - 3,4,5 a  6,7,8 )
# maj stejne nazev a akorat jsou ve switch 2x na ruznem miste
switch ( $vyraz ) {
    "0" {
        Write-Host "$out_1 0"
        # 1/4
        & ffmpeg -i $video_input -filter:v "crop=iw/2:ih/2:0:0" $prefix_name_output"leva_horni_ctvrtina.mp4" -y
        & ffmpeg -i $video_input -filter:v "crop=iw/2:ih/2:iw/2:0" $prefix_name_output"prava_horni_ctvrtina.mp4" -y
        & ffmpeg -i $video_input -filter:v "crop=iw/2:ih/2:iw/2:ih/2" $prefix_name_output"prava_dolni_ctvrtina.mp4" -y
        & ffmpeg -i $video_input -filter:v "crop=iw/2:ih/2:0:ih/2" $prefix_name_output"leva_dolni_ctvrtina.mp4" -y
        break
    }
    "1" {
        Write-Host "$out_1 1"
        # 1/2 vertikalne
        & ffmpeg -i $video_input -filter:v "crop=iw/2:ih:0:0" $prefix_name_output"leva_pulka.mp4" -y
        & ffmpeg -i $video_input -filter:v "crop=iw/2:ih:iw/2:0" $prefix_name_output"prava_pulka.mp4" -y
        break
    }
    "2" {
        Write-Host "$out_1 2"
        # 1/2 horizontalne
        & ffmpeg -i $video_input -filter:v "crop=iw:ih/2:0:0" $prefix_name_output"horni_pulka.mp4" -y
        & ffmpeg -i $video_input -filter:v "crop=iw:ih/2:0:ih/2" $prefix_name_output"dolni_pulka.mp4" -y
        break
    }
    "3" {
        Write-Host "$out_1 3"
        # 1/3 horizontalne
        & ffmpeg -i $video_input -filter:v "crop=iw:ih/3:0:0" $prefix_name_output"horni_horizontalni_tretina.mp4" -y # spolecny 3,4,5
        & ffmpeg -i $video_input -filter:v "crop=iw:ih/3:0:ih/3" $prefix_name_output"prostredni_horizontalni_ttretina.mp4" -y
        & ffmpeg -i $video_input -filter:v "crop=iw:ih/3:0:2*ih/3" $prefix_name_output"dolni_horizontalni_tretina.mp4" -y # spolecny 3,4,5
        break
    }
    "4" {
        # 2/3 nahore a 1/3 dole
        Write-Host "$out_1 4"
        & ffmpeg -i $video_input -filter:v "crop=iw:ih*2/3:0:0" $prefix_name_output"horni_horizontalni_dve_tretiny.mp4" -y
        & ffmpeg -i $video_input -filter:v "crop=iw:ih/3:0:2*ih/3" $prefix_name_output"dolni_horizontalni_tretina.mp4" -y # spolecny 3,4,5
        break
    }
    "5" {
        Write-Host "$out_1 5"
        & ffmpeg -i $video_input -filter:v "crop=iw:ih/3:0:0" $prefix_name_output"horni_horizontalni_tretina.mp4" -y # spolecni 3,4,5
        & ffmpeg -i $video_input -filter:v "crop=iw:ih*2/3:0:ih/3" $prefix_name_output"dolni_horizontalni_dve_tretiny.mp4" -y
        break
    }
    "6" {
        Write-Host "$out_1 6"
        & ffmpeg -i $video_input -filter:v "crop=iw/3:ih:0:0" $prefix_name_output"leva_vertikalni_tretina.mp4" -y # spolecny 6,7,8
        & ffmpeg -i $video_input -filter:v "crop=iw*2/3:ih:iw/3:0" $prefix_name_output"dve_tretiny_vpravo.mp4" -y
        # & ffmpeg -i $video_input -filter:v  "crop=iw*2/2.2:ih:iw/3:0" output_right_2-3-c.mp4 -y
        # lze zadavat i desetine cislo, zde napr. 2.2  ^
        # vice ukazek v souboru desetiny_2.bat
        break
    }
    "7" {
        Write-Host "$out_1 7"
        & ffmpeg -i $video_input -filter:v "crop=iw*2/3:ih:0:0" $prefix_name_output"dve_tretiny_vlevo.mp4" -y
        & ffmpeg -i $video_input -filter:v "crop=iw/3:ih:2*iw/3:0" $prefix_name_output"prava_vertikalni_tretina.mp4" -y # spolecny 6,7,8
        break
    }
    "8" {
        Write-Host "$out_1 8"
        # 1/3 verikalne
        & ffmpeg -i $video_input -filter:v "crop=iw/3:ih:0:0" $prefix_name_output"leva_vertikalni_tretina.mp4" -y # spolecny 6,7,8
        & ffmpeg -i $video_input -filter:v "crop=iw/3:ih:iw/3:0" $prefix_name_output"prostredni_vertikalni_tretina.mp4" -y
        & ffmpeg -i $video_input -filter:v "crop=iw/3:ih:2*iw/3:0" $prefix_name_output"prava_vertikalni_tretina.mp4" -y # spolecny 6,7,8
        break
    }
    "9" {
        Write-Host "$out_1 9"
        # 1/9
        for ( $aa = 0; $aa -le 2; $aa++ ) {
    for ( $bb = 0; $bb -le 2; $bb++ ) {
        $idx = $aa * 3 + $bb + 1
        $vf = 'crop=iw/3:ih/3:iw/3*' + $bb + ':ih/3*' + $aa
        #Write-Host "Creating $idx.mp4 (filter: $vf)"
        & ffmpeg -y -i $video_input -vf $vf $prefix_name_output"$idx.mp4"
        }
        }
        echo "razeni segmentu je takto"
        #Write-Host -ForegroundColor Yellow 
        Write-Host -ForegroundColor Yellow  "1 2 3"
        Write-Host -ForegroundColor Yellow  "4 5 6"
        Write-Host -ForegroundColor Yellow  "7 8 9"
        break
    }
    default {
        write-host -ForegroundColor Red "chyba zadani, volba je 0-9"
        echo "konec"
        sleep 5
        exit 1
    }
}

echo "vse hotovo"
sleep 10

