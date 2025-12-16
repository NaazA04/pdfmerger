# Automated PDF Merger

A lightweight bash script utility that automatically merges PDF files from organized project directories. This tool streamlines the process of combining multiple PDF documents by batch-processing folders and generating timestamped merged outputs.

## ✨ Features

- **Automated Batch Processing**: Processes multiple project directories in a single run
- **Timestamp-Based Naming**: Generates unique output filenames with timestamps to prevent overwrites
- **Smart Folder Detection**: Automatically identifies and processes only valid project directories
- **Empty Directory Handling**: Gracefully skips folders with no PDF files
- **Organized Output**: All merged PDFs are saved in a dedicated output directory
- **Simple and Lightweight**: Pure bash script with minimal dependencies

## 🔧 Prerequisites

Before using this tool, ensure you have the following installed:

- **Bash**: Version 4.0 or higher (pre-installed on most Unix-like systems)
- **pdfunite**: PDF manipulation utility from the Poppler package

### Installing pdfunite

**On macOS (using Homebrew):**
```bash
brew install poppler
```

**On Ubuntu/Debian:**
```bash
sudo apt-get install poppler-utils
```

**On Fedora/RHEL:**
```bash
sudo dnf install poppler-utils
```

## 📦 Installation

1. Clone or download this repository:
```bash
git clone <repository-url>
cd pdfmerger
```

2. Make the script executable:
```bash
chmod +x Automated_PDF_Merger/pdf_merger.sh
```

3. Verify `pdfunite` is installed:
```bash
pdfunite --version
```

## 📁 Project Structure

```
pdfmerger/
└── Automated_PDF_Merger/
    ├── pdf_merger.sh       # Main bash script
    ├── reports/            # Input directory containing project folders
    │   ├── project1/      # First project with PDFs
    │   │   ├── a.pdf
    │   │   └── b.pdf
    │   ├── project2/      # Second project with PDFs
    │   │   └── c.pdf
    │   └── empty_project/ # Empty folders are skipped
    └── output/            # Output directory for merged PDFs
```

## 🚀 Usage

### Basic Usage

1. Place your PDF files in organized folders within the `reports/` directory
2. Navigate to the `Automated_PDF_Merger` directory:
```bash
cd Automated_PDF_Merger
```

3. Run the script:
```bash
./pdf_merger.sh
```

### Expected Output

```
Checking folder: reports/project1
Merged PDF created: output/project1_merged_20231216_143045.pdf
-----------------------------
Checking folder: reports/project2
Merged PDF created: output/project2_merged_20231216_143046.pdf
-----------------------------
Checking folder: reports/empty_project
No PDFs found. Skipping...
```

## ⚙️ How It Works

The script follows these steps:

1. **Directory Setup**: Creates the `output/` directory if it doesn't exist
2. **Folder Iteration**: Loops through all subdirectories in the `reports/` folder
3. **PDF Detection**: Checks each subdirectory for PDF files
4. **Skip Empty Folders**: If no PDFs are found, the folder is skipped
5. **Merging Process**: Uses `pdfunite` to merge all PDFs in each folder
6. **Output Generation**: Saves the merged file with a timestamped name in the `output/` directory

### File Naming Convention

Merged files follow this naming pattern:
```
{project_name}_merged_{timestamp}.pdf
```

Example: `project1_merged_20231216_143045.pdf`

---

**Note**: This script is designed for Unix-like systems (Linux, macOS). For Windows users, consider using WSL (Windows Subsystem for Linux) or Git Bash.
