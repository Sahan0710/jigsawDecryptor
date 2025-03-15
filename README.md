# jigsawDecryptor
This PowerShell script is designed to decrypt files encrypted by the Jigsaw ransomware, automatically remove malicious directories, and clean up registry entries associated with the malware. 

🔹 Features
✅ Batch Decryption: Decrypts all files with a specified ransomware extension in the current directory.
✅ Automatic Extension Removal: Restores files to their original names by stripping the ransomware extension.
✅ Malware Cleanup: Detects and deletes known Jigsaw-related malicious directories.
✅ Registry Fix: Removes suspicious startup entries that may cause malware persistence.
✅ Error Handling: Provides warnings if decryption fails or if no infected files are found.

🚀 Usage
1️⃣ Run the script in the folder containing infected files.
2️⃣ Enter the ransomware extension (e.g., .fun).
3️⃣ The script will decrypt all affected files and remove the extension.
4️⃣ It will also scan for malicious folders and registry entries and remove them if found.

⚠️ Warning: Run this script only if you trust its source. Malicious scripts can cause system damage.

📌 Disclaimer
This tool is intended for educational and recovery purposes only. The author is not responsible for any damage or misuse.
