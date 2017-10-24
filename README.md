#### Instructions to run code

  - cd into project folder
  - ruby cron_parser.rb '*/15 0 1,15 * 1-5 /usr/bin/find'


  Supported cron fields
  =====================

  ============= =========== ================= ============== ===========================
  Field Name    Mandatory   Allowed Values    Default Value  Allowed Special Characters
  ============= =========== ================= ============== ===========================
  Minutes       Yes         0-59              N/A            \* / , -
  Hours         Yes         0-23              N/A            \* / , -
  Day of month  Yes         1-31              N/A            \* / , - 
  Month         Yes         1-12              N/A            \* / , -
  Day of week   Yes         0-6               N/A            \* / , - 
  ============= =========== ================= ============== ===========================
