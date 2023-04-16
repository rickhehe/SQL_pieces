SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET NOCOUNT ON
GO

create or alter function [dbo].[getLastNMonth](@monthKey int, @n int)
returns table
as


return

with x as (
select
    top (@n)
    monthKey
    -- , dimDateKey
from
    dimMonthEnd
where
    monthKey <= @monthKey
order by
    monthKey desc
)

select
    *
from
    x
cross join
    dimProject

GO