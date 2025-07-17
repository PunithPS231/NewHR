# NewHR

**Go to File → Import → Maven → Existing Maven Projects**
Then:
-> Select the root folder [NewHR]
-> Eclipse will detect the pom.xml
-> Click Finish

# Working on Eclipse
**By default eclipse show error once you add the file because by default, Maven adds J2SE-1.5 lib.**
Hence,
-> Right click on project
-> Go to properties -> Java build path -> Libraries -> Choose JRE System Library [J2SE - 1.5]
-> Click on edit, add the JRE System Library [JavaSE-1.7]
-> Click on apply and close

# Adding .sql file to MySQL
**Open MySQL Workbench. Login to Local Instance 80**
Go to Server -> Data Import -> Import from self contained file -> Choose the file path (.sql file path) -> Start Import
