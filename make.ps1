[CmdletBinding()]
param (
    [Parameter()] [Switch] $Ci,
    [Parameter()] [String] $Tags
)

if ($PSBoundParameters.count -eq 0) {
    $Ci = $True
}

if ($Tags -eq "") {
    $tags = "nodes containers vms"
}

if ($Ci) {
    golangci-lint run
    go test -tags "$Tags"
}