select * from bankchurners;

-- 1. Average month on book by card category.

select card_category, avg(months_on_book) as avg_months_on_book
from bankchurners
group by Card_Category
order by avg_months_on_book;

-- 2. Average total relationship count by Education level.

select education_level, sum(total_relationship_count) as total_relationship_count
from bankchurners
group by education_level
order by total_relationship_count;

-- 3. Most highly total trans ct by card category.

select card_category, avg(total_trans_ct) avg_trans, sum(total_trans_ct) sum_trans
from bankchurners
group by Card_Category
order by avg_trans;

-- 4. Relationship between gender and card category against total trans ct.

select card_category, gender, avg(total_trans_ct) avg_trans, sum(total_trans_ct) sum_trans
from bankchurners
group by Card_Category, gender
order by Card_Category, gender;

-- 5. Average credit limit by age category.
select 
case
when customer_age < 30 then "young"
when customer_age < 50 then "adult"
else
"old"
end as age_criteria, avg(Credit_Limit) as avg_credit_limit
from bankchurners
group by age_criteria
order by avg_credit_limit;

-- 6. Average months inactive by gender and age category.

select
case
when customer_age < 30 then "young"
when customer_age < 50 then "adult"
else
"old"
end as age_category,
gender, avg(months_inactive_12_mon) as avg_inactive_12_mon
from bankchurners
group by age_category, gender
order by age_category, gender;

-- 7. Relationship dependent count with total trans amt.

select dependent_count, avg(total_trans_amt) as avg_trans_amt, 
						sum(total_trans_amt) as sum_trans_amt,
                        count(total_trans_amt) as total_trans_amt
from bankchurners
group by Dependent_count
order by Dependent_count;
