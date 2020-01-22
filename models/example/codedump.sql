{# SELECT *
FROM 's3://dbt-snowflake/training/Sales.csv'
credentials=(AWS_KEY_ID='AKIAJA3TRTEEJQQRPV2Q'
             AWS_SECRET_KEY='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')
FILE_FORMAT=(TYPE='CSV')
ON_ERROR='CONTINUE'; #}

{# copy into sales_aws_dbt
from @my_s3_stage
pattern='.*Sales.*.csv'
on_error='continue' #}
