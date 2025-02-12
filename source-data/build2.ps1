param (
    [string]$pythonPath = "python",
    [string]$char1 = "NA",
    [string]$char2 = "NA"
)

$ErrorActionPreference = "Stop"

$nValues = 4
$pValues = @(2.0, 2.5)

foreach ($n in $nValues) {
    foreach ($p in $pValues) {
        $wordlist = & $pythonPath "processWordlist.py" $n $p "--safe"
        $output = $wordlist | ForEach-Object {
            "$char1$_", "$_$char2"
        }
        $output | Out-File -FilePath ("../lists/words-$n-$p.txt")
    }
}