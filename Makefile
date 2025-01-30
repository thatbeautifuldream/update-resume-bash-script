.PHONY: update-resume check-resume

update-resume:
	@chmod +x update-resume.sh
	@./update-resume.sh

check-resume:
	@test -f ~/Downloads/Milind_Mishra_Resume.pdf && echo "Resume found in Downloads" || echo "Resume not found" 