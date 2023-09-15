

*Unterprogrammaufrufe

data: gs_scarr type scarr.
data: gt_scarr like table of gs_scarr.

select * from scarr into table gt_scarr.

*read table gt_scarr into gs_scarr with table key mandt = '100'.
read table gt_scarr into gs_scarr with key carrid = 'LH'.



gs_scarr-carrname = 'Luft'.
gs_scarr-currcode = 'USD'.
gs_scarr-url = 'http://www.luft.com'.
perform first_commit on commit.

gs_scarr-carrname = 'Hansa'.
gs_scarr-currcode = 'USD'.
gs_scarr-url = 'http://www.hansa.com'.
perform second_commit on commit.

