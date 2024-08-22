--Which Gender is more active in making bike related purchased

select gender,
	count(gender) [count],
	sum(past_3_years_bike_related_purchases) as [Number of bikes purchased]
from Demography
group by gender

/* INSIGHT
This suggests that female customers are more likely to buy bikes or related products.*/

/*Age distribution of customers that purchased bike*/

with [groupping] as
(
select first_name,gender,DOB,past_3_years_bike_related_purchases,DATEDIFF(month,DOB,GETDATE())/12 as Age,
case
		when DATEDIFF(month,DOB,GETDATE())/12 <40 then 'Young Adult'
		when DATEDIFF(month,DOB,GETDATE())/12 between 40 and 59 then 'Middle Age'
		when DATEDIFF(month,DOB,GETDATE())/12 > 59 then 'Old Age'
	end as [Age Group] 
	from Demography
	)
select [Age group],sum(past_3_years_bike_related_purchases) [Number of bike purchased]
from [groupping]
group by [age group]

--INSIGHT-
/*You might find that the majority of bike purchases come from the 40-59 which are the middle age group, 
indicating that marketing efforts should be targeted toward this demographic.*/

/* WHICH INDUSTRY ARE MOST ASSOCIATED WITH BIKE RELATED PURCHASE*/

SELECT job_industry_category,SUM(past_3_years_bike_related_purchases) Number_of_bike_Purchase
FROM Demography
GROUP BY (job_industry_category)
ORDER BY Number_of_bike_Purchase DESC

--INSIGHT
--most of the bike purchases come from the Maunfacturing and finance sectors.


--which job title purchased bike the most--
SELECT job_title,SUM(past_3_years_bike_related_purchases) Number_of_bike_Purchase
FROM Demography
GROUP BY (job_title)
order by Number_of_bike_Purchase desc

