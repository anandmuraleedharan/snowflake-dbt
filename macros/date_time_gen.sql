{# Macro to generate DATE TIME DIMENSION standard table #}

{% macro date_time_gen() %}

  {% set query %}

    CREATE OR REPLACE TABLE DATE_TIME_DIMENSION (
      MY_DATE          DATE        NOT NULL,
      MY_MONTH_YEAR    CHAR(7)     NOT NULL
    )

    AS

    WITH MY_DATES AS (
      SELECT DATEADD(MONTH, SEQ4(), '2000-01-01') AS MY_DATE
      FROM TABLE(GENERATOR(ROWCOUNT=>300))
    )

    SELECT MY_DATE,
           substr(MY_DATE,-18,2) || '/' || YEAR(MY_DATE) AS MONTH_YEAR
    FROM MY_DATES

  {% endset %}

  {% do run_query(query) %}

{% endmacro %}
