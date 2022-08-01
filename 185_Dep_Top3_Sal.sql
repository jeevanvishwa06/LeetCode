--185. Department Top Three Salaries

/* https://leetcode.com/problems/department-top-three-salaries/     */


select d.name as Department,e1.name as Employee,e1.salary as Salary
from
(
select name, departmentId,salary,dense_rank() over(partition by departmentId order by salary desc) as rnk
from employee   
) e1
inner join department d
on e1.departmentId=d.id
where rnk<=3
