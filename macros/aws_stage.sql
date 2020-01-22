{% macro aws_stage() %}

  {% set query %}

    create or replace
    stage my_s3_stage
    url='s3://dbt-snowflake/training/Sales.csv'
    {# credentials= #}
    file_format=(type='CSV');

  {% endset %}

  {% do run_query(query) %}

{% endmacro %}
