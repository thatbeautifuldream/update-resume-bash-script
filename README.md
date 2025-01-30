# Resume Update Automation

This is a simple automation tool to update my resume on my personal website (milindmishra.com). It automatically copies my resume from the Downloads folder to my website's public directory, commits the changes, and pushes them to my repository.

## Usage

### Updating Resume

1. Save your new resume as `Milind_Mishra_Resume.pdf` in your Downloads folder
2. Run the update command:
   ```bash
   make update-resume
   ```
3. The script will:
   - Copy the resume to my website's public directory
   - Commit and push the changes
   - Clean up by removing the resume from Downloads

### Checking Resume Availability

To check if resume is available in the Downloads folder:

```bash
make check-resume
```

## File Structure

- `update-resume.sh`: Main script that handles the resume update process
- `Makefile`: Contains make commands for easy execution
- `README.md`: This documentation file
