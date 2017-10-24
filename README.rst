Usage
============

    >>> ruby cron_parser.rb  "*/15 0 1,15 * 1-5 /usr/bin/find"
    >>> minute - 0 15 30 45
    ...hour - 0
    ...day of month - 1 15
    ...month - 1 2 3 4 5 6 7 8 9 10 11 12
    ....day of week - 1 2 3 4 5
    ...command - /usr/bin/find
    
    
Supported syntax
================

============= =========== ================= ============== ===========================
Field Name    Mandatory   Allowed Values    Default Value  Allowed Special Characters
============= =========== ================= ============== ===========================
Minutes       Yes         0-59              N/A            \* / , -
Hours         Yes         0-23              N/A            \* / , -
Day of month  Yes         1-31              N/A            \* / , - 
Month         Yes         1-12              N/A            \* / , -
Day of week   Yes         0-6               N/A            \* / , - 
============= =========== ================= ============== ===========================
