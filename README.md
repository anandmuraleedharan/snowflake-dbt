### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/overview)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](http://slack.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

### Directions
1. Always remember to remove credential details before pushing projects to git
2. Create a role 'loader' in snowflake and use it in dbt to load files.
3. Create a role 'transformer' in snowflake and use it in dbt to transform models.
4. Create a database 'raw' and use it for source tables.
5. Create a database 'analytics' and use it for transformed models.
6. Role 'loader' uses the 'raw' db and the role 'transformer' uses the 'analytics' db.
7. Always run Microsoft powershell in admin mode.

### Exercises
1. Load file from /data using dbt --seed command and create a view on top of the loaded file;
2. Load a file to AWS S3 and replicate the file as a table in Snowflake using DBT macro;
3. Use variable in DBT to filter a raw table in snowflake and materialize it as a table
4. Load a Price Change table to snowflake and transform to a Monthly Price table;

### Tips
1. Exercise 1
    a. Install Python + Git + Atom + Github
    b. Remember to set Path variable during Python installation
    c. pip install dbt
    d. dbt init <project>
    e. Configure snowflake in profile.yml
    f. Configure project in dbt_project.yml
    e. dbt seed --show
2. Exercise 2
    a. Set Up AWS S3 and load a file
    b. Set up aws secret key access
    c. Write a DBT macro to set up an external stage from AWS to SF
    d. dbt run-operation <macro>
    e. Write a DBT model to create a table querying the created SF stage.
3. Exercise 3
    a. Load a file to SF using dbt seed --show
    b. Set up a variable in dbt_project.yml
    c. Use the variable in model and write a query materializing the result as a table/view
4. Exercise 4
    a. Create a price change marker file and load it to SF by seeding
    b. Write a dbt macro to generate date time table in snowflake and execute it through run-operation
    c. Write a model in dbt that uses joins to convert price change table to monthly price table.
