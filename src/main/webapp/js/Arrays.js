export let ProductsQty = [];

function prefixFileName(prefix, fileName) {
    // Ensure the prefix is a string and the fileName ends with .sql
    if (typeof prefix !== 'string' || typeof fileName !== 'string' || !fileName.endsWith('.sql')) {
        throw new Error('Invalid arguments: prefix must be a string and fileName must end with .sql');
    }

    // Concatenate the prefix to the file name
    return `${prefix}${fileName}`;
}

// Example usage
const prefix = 'C:\\Users\\ASUS\\IdeaProjects\\JSP-Project\\target\\JSP-Project-1.0-SNAPSHOT\\Image\\Categories\\clothes';
const fileName = 'database_export.sql';
const prefixedFileName = prefixFileName(prefix, fileName);

console.log(prefixedFileName); // Output: backup_database_export.sql
