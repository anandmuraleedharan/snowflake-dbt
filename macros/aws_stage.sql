{# Macro to create a stage in the target db from AWS S3 #}

{% macro aws_stage() %}

  {% set query %}

    create or replace
    stage aws_sales_stage
    url='s3://dbt-snowflake/training/Sales.csv'
    {# credentials=() #}
    file_format=(type='CSV');

  {% endset %}

  {% do run_query(query) %}

{% endmacro %}
