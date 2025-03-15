# jigsawDecryptor  
This PowerShell script is designed to decrypt files encrypted by the Jigsaw ransomware, automatically remove malicious directories, and clean up registry entries associated with the malware.  

🔹 Features  
✅ Batch Decryption: Decrypts all files with a specified ransomware extension in the current directory.  
✅ Malware Cleanup: Detects and deletes known Jigsaw-related malicious directories.  
✅ Registry Fix: Removes suspicious startup entries that may cause malware persistence.  

🛠 How to Use  
Follow these steps to run the Jigsaw Ransomware Decryption & Cleanup Script:  

1️⃣ Place the Encrypted Files in the Same Folder as the Script  
Ensure all encrypted files (with the ransomware extension, eg: *.fun) are in the same folder as the jigsawDecryptor.ps1 script.  

2️⃣ Enable Script Execution for This Script Only  
To allow script execution only for this script, run the following command from PowerShell (as Administrator):  

**PowerShell -Unblock-File Bypass -File "C:\path\to\your\jigsawDecrypt.ps1"**  

Replace "C:\path\to\your\jigsawDecrypt.ps1" with the full path to the script.  
This will bypass the execution policy only for this script, and it will not change the execution policy for other scripts.  

3️⃣ Run the Script as Administrator  
To ensure the script has sufficient permissions, run PowerShell as Administrator:  
Run the script with the following command:  

**PowerShell -ExecutionPolicy Bypass -File "C:\path\to\your\jigsawDecrypt.ps1"**  

4️⃣ Follow the Prompts  
The script will ask for the ransomware extension (eg: *.fun).  
The script will then process all files with the provided extension in the current directory and begin decrypting them.  
After decryption, the script will remove the ransomware extension and save the decrypted files.  

5️⃣ Cleanup  
The script will also delete malicious directories (e.g., Frfx, Drpbx, System32Work) and remove any suspicious registry entries (e.g., Firefox.exe in startup).   

📌 Disclaimer  
This tool is intended for educational and recovery purposes only. The author is not responsible for any damage or misuse.  
