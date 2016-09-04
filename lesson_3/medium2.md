1. Please see: munsters_male_age.rb

2. Please see: munsters_name_age_gender_print_out.rb

3. Please see: tricky_method.rb

4. Please see: word_reverse.rb

5. 34 because the method is not changing the variable 'answer'

6. I got this one wrong here is what the book said:

In Ruby, what gets passed in the parameter list is not what it appears. Under the hood, ruby passes the object id of each item rather than the value of the parameter. The method internally stores these object id's in locally scoped (private to the method) variables (named per the method definition's parameter list).

So Spot's demo_hash starts off pointing to the munsters hash. His program could wind up replacing that with some other object id and then the family's data would be safe.

In this case, the program does not reassign demo_hash -- it just uses it as-is. So the actual hash object that is being messed with inside of the method IS the munsters hash.
