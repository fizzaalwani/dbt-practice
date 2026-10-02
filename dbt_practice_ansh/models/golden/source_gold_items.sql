with duplication as (
    select *, row_number() over(partition by id order by updateDate desc) as rnk
    from {{ source('source','items')}}
)

select * from duplication where rnk=1