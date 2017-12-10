$sysinfo = ''
$sysinfoheader = ''


# config and output filnames
$configFile = 'wmicutil.cfg'
$outputFile = 'wmicutil.csv'

# enable/disable coment by comenting/uncomenting those next two lines
$sysinfo = ((read-host "Input Coment ") + ';')
$sysinfoheader = 'Coment;'


foreach ($line in Get-Content ($PSScriptRoot + '/' + $configFile)) {
  # If line is a coment or empty, skip
  if (-not ($line -match '.')) {
    continue
  }
  if ($line.StartsWith('#')) {
    continue
  }
  $item = $line.Split(' ')[0].trim()
  $spec = $line.Split(' ')[1].trim()

  $sysinfoheader = ($sysinfoheader + $item.toUpper() + ' ' + $spec + ';')

  # Get Value
  $val = (WMIC.exe $item get $spec)
  # Remove Headers
  $val = $val | Select-String -NotMatch -Pattern $spec
  # Remove empty lines
  $val = $val | Select-String -Pattern '.'

  $val = ($val -replace '\r', ' | ')
  $val = ($val -replace '\s+', ' ')
  
  $sysinfo = ($sysinfo + $val + ';')
}
# File created if it does not exist
if (-not (Test-Path ($PSScriptRoot + '/' + $outputFile))) {
  $sysinfoheader | out-file -encoding utf8 ($PSScriptRoot + '/' + $outputFile)
}

$sysinfo | out-file -append -encoding utf8 ($PSScriptRoot + '/' + $outputFile)

Write-Host 'Done!'
Read-Host -Prompt "Press Enter to continue"
