Feature: Program output should be correct
	Scenario: return code 1 if PATH missing
		Given the default aruba exit timeout is 30 seconds
		When I run `srpt.ps1`
		Then the exit status should be 1
		Then 10 points are awarded

	Scenario: header is correct
		Given the default aruba exit timeout is 30 seconds
		Given a folder of assorted files in testfiles
		When I run `srpt.ps1 testfiles`
		And header contains SearchReport HOSTNAME PATH
		And header ends with the current date
		Then 10 points are awarded

	Scenario: directory count is correct
		Given the default aruba exit timeout is 30 seconds
		Given a folder of assorted files in testfiles
		When I run `srpt.ps1 testfiles`
		And directory count is correct
		Then 10 points are awarded

	Scenario: file count is correct
		Given the default aruba exit timeout is 30 seconds
		Given a folder of assorted files in testfiles
		When I run `srpt.ps1 testfiles`
		And file count is correct
		Then 10 points are awarded

	Scenario: symbolic link count is correct
		Given the default aruba exit timeout is 30 seconds
		Given a folder of assorted files in testfiles
		When I run `srpt.ps1 testfiles`
		And symbolic link count is correct
		Then 10 points are awarded

	Scenario: graphics file count is correct
		Given the default aruba exit timeout is 30 seconds
		Given a folder of assorted files in testfiles
		When I run `srpt.ps1 testfiles`
		And graphics file count is correct
		Then 10 points are awarded

	Scenario: count of files older than 365 days is correct
		Given the default aruba exit timeout is 30 seconds
		Given a folder of assorted files in testfiles
		When I run `srpt.ps1 testfiles`
		And count of files older than 365 days is correct
		Then 10 points are awarded

	Scenario: large file count is correct
		Given the default aruba exit timeout is 30 seconds
		Given a folder of assorted files in testfiles
		When I run `srpt.ps1 testfiles`
		And large file count is correct
		Then 10 points are awarded

	Scenario: temporary file count is correct
		Given the default aruba exit timeout is 30 seconds
		Given a folder of assorted files in testfiles
		When I run `srpt.ps1 testfiles`
		And temporary file count is correct
		Then 10 points are awarded

	Scenario: executable file count is correct
		Given the default aruba exit timeout is 30 seconds
		Given a folder of assorted files in testfiles
		When I run `srpt.ps1 testfiles`
		And executable file count is correct
		Then 10 points are awarded

	Scenario: total file count is correct
		Given the default aruba exit timeout is 30 seconds
		Given a folder of assorted files in testfiles
		When I run `srpt.ps1 testfiles`
		And total file size is correct
		Then 10 points are awarded

	Scenario: execution time is < 30 seconds
		Given the default aruba exit timeout is 0 seconds
		Given a folder of assorted files in testfiles
		When I successfully run `srpt.ps1 testfiles` for up to 30 seconds
		Then 20 points are awarded 

	Scenario: large numbers are punctuated with commas
		Given the default aruba exit timeout is 30 seconds
		Given a huge folder of assorted files in testfiles
		When I run `srpt.ps1 testfiles`
		Then 20 points are awarded 

	Scenario: exit code is zero for normal execution
		Given the default aruba exit timeout is 30 seconds
		When I run `srpt.ps1 /tmp`
		Then the exit status should be 0
		Then 10 points are awarded
		
	Scenario: exit code is 1 for abnormal execution
		Given the default aruba exit timeout is 30 seconds
		When I run `srpt.ps1`
		Then the exit status should not be 0
		Then 10 points are awarded
		
	Scenario: Usage statement should be printed for abnormal execution
		Given the default aruba exit timeout is 30 seconds
		When I run `srpt.ps1`
		Then the output should contain "Usage"
		Then 10 points are awarded
		
