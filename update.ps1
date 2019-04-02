$distURI = "https://dist.ipfs.io/go-ipfs"

function global:au_GetLatest {
     # Format is newline delimited version list, with trailing newline
     $versions = Invoke-WebRequest -Uri "$distURI/versions"
     $latestVersion = $versions.Content -split '\n'| select -Last 1 -Skip 1
     $latestDir = "{0}/{1}" -f $distURI, $latestVersion
     $latest32 = "{0}/go-ipfs_{1}_windows-386.zip" -f $LatestDir, $latestVersion
     $latest64 = "{0}/go-ipfs_{1}_windows-amd64.zip" -f $LatestDir, $latestVersion
     # Format is: `<hash>  <filename>`
     $checksum32 = Invoke-WebRequest -Uri "$latest32.sha512" | Select-Object Content | % { $_.Content.Substring(0, $_.Content.IndexOf(" "))}
     $checksum64 = Invoke-WebRequest -Uri "$latest64.sha512" | Select-Object Content | % { $_.Content.Substring(0, $_.Content.IndexOf(" "))}
     return @{ Version = $latestVersion.TrimStart('v'); URL32 = $latest32; URL64 = $latest64; Checksum32 = $checksum32; Checksum64 = $checksum64}
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"

        }
    }
}

update -ChecksumFor none
