Automate Integration Testing on your APIs with
----- Postman and Jenkins -----



1. Install a full version of Postman.
https://www.getpostman.com/

2. Create your unit tests in Postman with Javascript

3. Install Node.js, Node Package Manager (NPM), and Newman
 - $ npm install -g newman
 
4. Test Collection with Newman

5. Install Node.js and Newman on the Jenkins server
	- https://nodejs.org/en/
	- https://www.npmjs.com/package/newman
	- https://jenkins.io/

6. Create build item and add a build Step in Jenkins
	- PowerShell/Bash command to run Newman
	
- Run job


----------------------------

Why do this?

- automate your "spot-checking" that everything looks good 
- have continuous integration (CI) testing on every check in
- ensure existing functionality doesn't break


What type of tests?

- authentication tokens and security
- health checks HTTP 200
- write / read / THEN delete!
- any business logic
- use the environment file for dev-stage-prod

What is this not used for?

- Not used for performance and load testing. 
- Not used for UI testing