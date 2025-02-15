#Date 2/14/2025
# this script was used for saving the 591 genes used in the study. 
#It helped me save the genes and the accession codes to put in my fasta file.
#I still need to rename and make sure that all the genes are correct.
# this part was just to make sure that I downloaded all the accession code with the gene names.
# Set the working directory
setwd("C:/Users/Rushe/Desktop/capstone 2025/fastafiles")

# Read the CSV file and ensure columns are read as characters
dataset <- read.csv("pnas.2012215118.sd01.csv", stringsAsFactors = FALSE)
# Function to create FASTA files for each row
create_fasta_files <- function(data) {
  for (i in 1:nrow(data)) {
    # Ensure individual name is treated as a character
    individual_name <- as.character(data[i, "Individual"]) # Use the correct column name
    
    # Extract the accession codes for the individual
    accession_codes <- as.character(data[i, -c(1, 2)]) # Excluding 'Individual' and 'collection' columns
    
    # Create the filename
    file_name <- paste0(individual_name, ".fas")
    
    # Combine the accession codes into a single string separated by newlines
    accession_codes_combined <- paste(accession_codes, collapse = "\n")
    
    # Write the individual name and accession codes to the file in FASTA format
    file_content <- paste0(">", individual_name, "\n", accession_codes_combined)
    writeLines(file_content, con = file_name)
  }
}

# Call the function
create_fasta_files(dataset)
