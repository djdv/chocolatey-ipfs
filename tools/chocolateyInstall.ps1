$packageName = 'ipfs'
$url32 = 'https://dist.ipfs.io/go-ipfs/v0.5.0/go-ipfs_v0.5.0_windows-386.zip'
$checksum32 = '3563da55343cb9c456df54d88cacb7a6cf981715d787b85db01afc5e0f52c2405fea3ca631e938242a2857e58f3cda2f16919fb331efce0d8b3a4f5adf28a10d'
$checksumType = 'sha512'
$url64 = 'https://dist.ipfs.io/go-ipfs/v0.5.0/go-ipfs_v0.5.0_windows-amd64.zip'
$checksum64 = 'c8a6de566002c947f3483e6af251682f2c6d225305d872ac89a37c124130d2f52270b4c5a31f017d788dc96c02f6121a6a2ec71ef655228ffec340712e5d17c7'
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
