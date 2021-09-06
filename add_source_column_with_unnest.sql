with t  as (
select 'S000001' value_from_source_a
       , 'sale' source_a
       , 'T000002' value_from_source_b
       , 'trial' source_b
)

 

-- select * from t
select split_part(
            unnest(array[
                concat_ws(',', value_from_source_a, source_a)
                , concat_ws(',', value_from_source_b, source_b)
            ])
            , ','
            , 1
          ) order_name
        , split_part(
            unnest(array[
                concat_ws(',', value_from_source_a, source_a)
                , concat_ws(',', value_from_source_b, source_b)
            ])
            , ','
            , 2
          ) source_module          
  from t
