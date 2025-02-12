param (
    [string]$pythonPath = "python"
)

$ErrorActionPreference = "Stop"

$nValues = 4
$pValues = @(2.0, 2.5)

foreach ($n in $nValues) {
    foreach ($p in $pValues) {
        & $pythonPath "processWordlist.py" $n $p "--safe" | Out-File -FilePath ("../lists/words-$n-$p.txt")
    }
}