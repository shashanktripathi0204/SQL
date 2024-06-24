## Strengths

1. **EXISTS** lets us check for matching records from the many side of the relationship, without resulting in duplicated data from the one side.
On the other hand, *Joining* directly to a table on the many side of the relationship :- will result in record from the one side, potentially being duplicated in the output.

2. **EXISTS** works fine in this scenario as long as you dont need any additional infromation about the match, other than it exists.

## Weakness

1. If we need to see any data points pertaining to the match, UPDATE can be a superior alternative to **EXISTS**