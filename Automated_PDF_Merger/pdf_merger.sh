#!/bin/bash

list_pdfs() {
    dir=$1
    ls "$dir"/*.pdf 2>/dev/null
}

merge_pdfs() {
    pdf_list=$1
    output_file=$2
    pdfunite $pdf_list "$output_file"
}

main() {
    BASE_DIR="reports"
    OUTPUT_DIR="output"

    mkdir -p "$OUTPUT_DIR"

    for project in "$BASE_DIR"/*; do
        if [ -d "$project" ]; then
            echo "Checking folder: $project"

            pdfs=$(list_pdfs "$project")

            if [ -z "$pdfs" ]; then
                echo "No PDFs found. Skipping..."
                continue
            fi

            timestamp=$(date +"%Y%m%d_%H%M%S")
            project_name=$(basename "$project")
            output_file="$OUTPUT_DIR/${project_name}_merged_$timestamp.pdf"

            merge_pdfs "$pdfs" "$output_file"
            echo "Merged PDF created: $output_file"
            echo "-----------------------------"
        fi
    done
}

main
