cls

# filelist pro spojeni pomoci ffmpeg

$files = @()
$files += @(Get-ChildItem -Include "*.mp4" -Name) | Sort-Object
$d_files = $files.Length
#echo $d_files

if ( $d_files -eq 0 ){
Write-Warning "nenalezen zadny soubor *.mp4"
echo "konec"
sleep 5
exit 1
}

$pole_out = @()
for ( $aa = 0; $aa -lt $d_files; $aa++ ) {
$file = $files[$aa]                                     
#echo $file
#file '1.mp4'
$zapis_polozku = "file '"
$zapis_polozku += $file
$zapis_polozku += "'"
echo $zapis_polozku
$pole_out += $zapis_polozku
}

$file_output = "filelist-9.txt"
Set-Content -Path $file_output -Encoding ASCII -Value $pole_out
sleep -Milliseconds 500

<#
   novinka vycebarevnej jeden radek :)
   pozn. vsude jinde je potreba rict treba "\n" ; <<endl; apod.
   ale v PowerShellu je to obracene, radkuje automaticky a kdyz se novej radek nechce
   tak se mu to musi rict, vlastne me to pride docela logicky a lepsi reseni 
   uvadet to ceho je mnohem mene, je uspora mista
   a taky se na "NewLine" casto zapomina
   tohle jsem dloho hledal ale napadlo by me ze to je takhle...
#>
Write-Host -ForegroundColor Yellow "tyto radky byl zapsany do souboru " -NoNewline
Write-Host -ForegroundColor Cyan $file_output
echo "editujte tento soubor"
echo ""

#$hl_1 = "ffmpeg -f concat -i $file_output spojene_videa.mp4"
#echo $hl_1

$spojene = "spojene_videa.mp4"
$pole_frag = @(
"@echo off",
"ffmpeg -y -f concat -i $file_output $spojene", # Aaaa :)
#"$hl_1"
"%mpvs% $spojene" #tady se jiz predpoklada ze byla nastavena systemova promenna %mpvs% ( viz. scrennshoty jinde )
# takze ji to zavola
"pause"
)

$file_output_2 = "spoj_fragmenty.bat"
Set-Content -Path $file_output_2 -Encoding ASCII -Value $pole_frag
sleep -Milliseconds 500

Write-Host -ForegroundColor Yellow "dale by vytvoren novy soubor " -NoNewline
Write-Host -ForegroundColor Cyan $file_output_2 -NoNewline 
# na predchozim radku je  "-NoNewline" schvalne (pak smazat) aby bylo vydet co to dela ve sleep-u
# kurzor zustane blikat na konci radku a neskoci na novej, jako to bejva obvykle
sleep 10

