$ErrorActionPreference = "SilentlyContinue"

#===================================================================================================================#
# SECTION 1: Ransomware File Decryption
#===================================================================================================================#

# Display script name in big ASCII letters
$asciiArt = @"
     __.__                            ________                                      __                
    |__|__| ____  ___________ __  _  _\______ \   ____   ___________ ___.__._______/  |_  ___________ 
    |  |  |/ ___\/  ___/\__  \\ \/ \/ /|    |  \_/ __ \_/ ___\_  __ <   |  |\____ \   __\/  _ \_  __ \
    |  |  / /_/  >___ \  / __ \\     / |       \  ___/\  \___|  | \/\___  ||  |_> >  | (  <_> )  | \/
/\__|  |__\___  /____  >(____  /\/\_/ /_______  /\___  >\___  >__|   / ____||   __/|__|  \____/|__|   
\______| /_____/     \/      \/               \/     \/     \/       \/     |__|                      
"@
Write-Host $asciiArt

# Prompt the user for the ransomware file extension (e.g., .fun)
$fileExtension = Read-Host -Prompt "Enter the ransomware file extension (eg: *.fun)"

# Get all files with the specified ransomware extension in the current directory
$files = Get-ChildItem -Path . -Filter "*$fileExtension"

if ($files.Count -eq 0) {
    Write-Host "`nERROR: No files found with the .$fileExtension extension in the current directory."
    exit
}

# Loop through each file found with the given ransomware extension
foreach ($file in $files) {
    Write-Host "`nProcessing file: $($file.Name)"

    $EncryptionKey = [System.Convert]::FromBase64String("OoIsAwwF23cICQoLDA0ODe==")
    $AESProvider = New-Object 'System.Security.Cryptography.AesManaged'
    $AESProvider.Key = $EncryptionKey
    [Byte[]]$IV = ( 0, 1, 0, 3, 5, 3, 0, 1, 0, 0, 2, 0, 6, 7, 6, 0 )
    $AESProvider.IV = $IV

    try {
        # Read the ciphertext from the file
        $ciphertext = Get-Content $file.FullName -Encoding Byte
        $decryptor = $AESProvider.CreateDecryptor()
        $plaintxt = $decryptor.TransformFinalBlock($ciphertext, 16, $ciphertext.Length - 16)

        # Remove the ransomware extension from the filename by replacing the extension
        $outputFile = [System.IO.Path]::Combine($file.DirectoryName, [System.IO.Path]::GetFileNameWithoutExtension($file.Name))

        # Write the decrypted content to the new file
        [System.Text.Encoding]::ASCII.GetString($plaintxt[16..($plaintxt.Length-1)]) | Out-File $outputFile

        Write-Host "Decryption complete. Output saved to: $outputFile"
    }
    catch {
        Write-Host "ERROR: Decryption failed for file: $($file.Name)"
    }
}

#===================================================================================================================#
# SECTION 2: Check and Remove Suspicious Directories
#===================================================================================================================#

$directories = @(
    "$env:UserProfile\AppData\Roaming\Frfx\",
    "$env:UserProfile\AppData\Local\Drpbx\",
    "$env:UserProfile\AppData\Roaming\System32Work\"
)

foreach ($dir in $directories) {
    if (Test-Path $dir) {
        Remove-Item -Path $dir -Recurse -Force
        Write-Host "Deleted: $dir"
    }
}

#===================================================================================================================#
# SECTION 3: Check and Remove Suspicious Registry Entry
#===================================================================================================================#

$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
$regName = "Firefox.exe"

if (Test-Path $regPath) {
    $regValue = Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue
    if ($regValue) {
        Remove-ItemProperty -Path $regPath -Name $regName -Force
        Write-Host "Deleted registry entry: $regPath\$regName"
    }
}
