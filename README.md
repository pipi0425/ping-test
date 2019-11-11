# ping-test
tool created when working as helpdesk technician at Bulk Barn Foods Limited

This is a batch script to ping a list of ips - used to check online status of the firewall of each store.  
It takes input from a txt file, reads the first number from each line to ping the corresponding ip.  
Output file is `ping-mm-dd-yyyy-time.log`.

## Notice
Anything related to how IPs are allocated in the company has been hidden or deleted for security reasons.

## Change History
11/06/2019  
- ping test.bat created  
- read store list from txt instead of hard coding  
- output log name from ping-date.log to ping-date-time.log  
- now automatically open log file after program finishes  

11/07/2019  
- fix bug (unable to generate log file in the morning)  
- can display "Request timed out" in log file as well  

11/11/2019
- fix bug (case TTL expired in transit was not included)  

## Todo List
- [ ] Rewrite in VBA? to interact with excel files
