#!/usr/bin/env pwsh
# Mason Rich
# Lab 7 - PowerShell Search and Report
# CS 3030 - Scripting Languages

#variables
$myEnv = [System.Net.Dns]::GetHostName()
$path = $args[0]
$todaysDate = & date
$totalDir = 0
$totalFiles = 0
$totalSym = 0
$totalOld = 0
$totalBig = 0
$totalPic = 0
$totalExe = 0
$totalTmp = 0
$totalSize = 0

#exit if path is null
if($path -eq $NULL){
    echo "Usage: srpt PATH"
    exit 1
}

#look at the files in the given path
$files = get-childitem -Path $path -recurse

#count the directories
Foreach ($file in $files){
    #total directories
    if($file.GetType().Name -eq "DirectoryInfo"){
        $totalDir++
    }
    #total files
    if(($file.GetType().Name -eq "FileInfo") -and ($file.mode -notmatch 'l')){
        $totalFiles++
        #get the byte count
        $totalSize += $file.Length

    }
    #total symbolic links
    if(($file.GetType().Name -eq "FileInfo") -and ($file.mode -match 'l')){
        $totalSym++
    }
    #files older than 365 days
    if(($file.GetType().Name -eq "FileInfo") -and ($file.LastWriteTime -lt (Get-Date).AddDays(-365))){
        $totalOld++
    }
    #total large files
    if(($file.GetType().Name -eq "FileInfo") -and ($file.Length -gt 500kb)){
        $totalBig++
    }

    #graphics files
    if(($file.GetType().Name -eq "FileInfo") -and ($file.mode -notmatch 'l')){
        $extn = [IO.Path]::GetExtension($file)
	if(($extn -eq ".gif") -or ($extn -eq ".bmp") -or ($extn -eq ".jpg")){
	    $totalPic++
	}
    }
    #temporary files
    if(($file.GetType().Name -eq "FileInfo") -and ($file.mode -notmatch 'l')){
        $extn = [IO.Path]::GetExtension($file)
        if($extn -eq ".o"){
            $totalTmp++
        }
    }
    #executable files
    if(($file.GetType().Name -eq "FileInfo") -and ($file.mode -notmatch 'l') -and ($file.extension -eq ".exe")){
        $totalExe++
    }

}

#do not count current dir
#$totalDir--

#Write all of the ouput
Write-Output "SearchReport $myEnv $path $todaysDate"
Write-Host "Directories "$totalDir.ToString("N0")
Write-Host "Files"$totalFiles.ToString("N0")
Write-Host "Sym links"$totalSym.ToString("N0")
Write-Host "Old files"$totalOld.ToString("N0")
Write-Host "Large files"$totalBig.ToString("N0")
Write-Host "Graphics files"$totalPic.ToString("N0")
Write-Host "Temporary files"$totalTmp.ToString("N0")
Write-Host "Executable files"$totalExe.ToString("N0")
Write-Host "TotalFileSize"$totalSize.ToString("N0")

exit 0
