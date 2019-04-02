$packageName = 'ipfs'
$url32 = 'https://dist.ipfs.io/go-ipfs/v0.4.19/go-ipfs_v0.4.19_windows-386.zip'
$checksum32 = 'bcd6a50f9bebb8aacb92fd5a2f30b7c534742283fe9357cc9b253a83e4b42645a855a2e302556ff644f9c17dfb30301abe70cdb438d2fc06b51511077155582a'
$checksumType = 'sha512'
$url64 = 'https://dist.ipfs.io/go-ipfs/v0.4.19/go-ipfs_v0.4.19_windows-amd64.zip'
$checksum64 = 'e3aca9276dc0b71e351447f1c129cd26b76a7a13334fa47ba84966efdc9b2bb75d154e7df31a57f8ddad9f548e49373340efe93ad0123b2ae3ae92b64193b91a'
$checksumType64 = 'sha512'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

Install-ChocolateyZipPackage -PackageName $packageName `
                             -Url $url32 `
                             -UnzipLocation $toolsDir `
                             -Url64bit $url64 `
                             -Checksum $checksum `
                             -ChecksumType $checksumType `
                             -Checksum64 $checksum64 `
                             -ChecksumType64 $checksumType64
