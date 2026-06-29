{% test test_less_than_eighteen(model, column_name) %}

with validation as 
(
    select {{column_name}} as test_column
    from {{model}}
),
validation_errors as
(
    select test_column 
    from validation
    where test_column <18
)
select * from validation_errors


{%endtest%}