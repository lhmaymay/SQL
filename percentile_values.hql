select b1.new2
from
(
select percentile_approx(final_pscore, array(0.995,0.99,0.985,0.98,0.984,0.983,0.982,0.981,0.98,0.975,0.97,0.965,0.96,0.955,0.95)) as new
from test
where event_date between '2021-04-29' and '2021-05-03'
) as a
LATERAL VIEW EXPLODE(a.new) b1 as new2;
