# Builds the submission folder and ZIP required by the assignment:
#   <id1_fullname1_id2_fullname2_id3_fullname3>/
#     source/          all source code + docker-compose.yml (cleaned: no node_modules, dist, .env)
#     demo.mp4         product video (recorded by the team, copied if present)
#     git/             GitHub Insights screenshots (added by the team)
#     Bonus/           bonus feature description and evidence
#     Readme.txt       how to run, accounts, bonus features
#     Rubrik.docx      self-assessment (official file from the lecturer, or the draft)
#     Report.docx/.pdf project report
# Usage (PowerShell, in the "Final" folder):  .\make-submission.ps1
$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$name = '523H0192_NguyenThanhTung_523H0040_DuongTranQuocKhanh_523H0168_NguyenNamPhong'
$out = Join-Path $root "submission\$name"

if (Test-Path $out) { Remove-Item $out -Recurse -Force }
New-Item -ItemType Directory -Force $out | Out-Null

# 1. source: copy everything except generated or secret files.
robocopy (Join-Path $root 'src') (Join-Path $out 'source') /E /XD node_modules dist .git /XF .env *.log /NFL /NDL /NJH /NJS /NP | Out-Null
# robocopy exit codes 0-7 mean success (1 = files copied); 8 and above are errors.
if ($LASTEXITCODE -ge 8) { throw "robocopy failed with code $LASTEXITCODE" }
$global:LASTEXITCODE = 0

# 2. documents and evidence
Copy-Item (Join-Path $root 'Readme.txt') $out
Copy-Item (Join-Path $root 'Bonus') (Join-Path $out 'Bonus') -Recurse
Copy-Item (Join-Path $root 'report\Report.docx') $out
Copy-Item (Join-Path $root 'report\Report.pdf') $out

# 3. git screenshots and the video, if the team has added them
New-Item -ItemType Directory -Force (Join-Path $out 'git') | Out-Null
Get-ChildItem (Join-Path $root 'submission-kit\git') -Filter *.png -ErrorAction SilentlyContinue | Copy-Item -Destination (Join-Path $out 'git')
if (Test-Path (Join-Path $root 'demo.mp4')) { Copy-Item (Join-Path $root 'demo.mp4') $out } else { Write-Warning 'demo.mp4 not found in the Final folder - add it before submitting.' }

# 4. Rubrik: the official file from the lecturer if present, else the draft
$official = Join-Path $root 'Rubrik.docx'
if (Test-Path $official) { Copy-Item $official $out } else { Copy-Item (Join-Path $root 'submission-kit\Rubrik_self-assessment.docx') (Join-Path $out 'Rubrik.docx') }

if (-not (Get-ChildItem (Join-Path $out 'git') -Filter *.png)) { Write-Warning 'The git folder has no GitHub Insights screenshots yet.' }

# 5. ZIP with the same name
$zip = Join-Path $root "submission\$name.zip"
if (Test-Path $zip) { Remove-Item $zip -Force }
Compress-Archive -Path $out -DestinationPath $zip
$size = [math]::Round((Get-Item $zip).Length / 1MB, 1)
Write-Output "Created $zip ($size MB)"
