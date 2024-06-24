### What Slows down Queries most ?
Joins agains or between very large tables.

### Approaches to take to make joins less costly :- 
1. Define a filtered dataset as early as possible in our process, so we can *JOIN* additional tables to a smaller core popullation
2. Avoid several joins in a single SELECT query, espically those involving large tables.
3. Instead use UPDATE statement to populate fields in a temp table, one source field at a time.
4. Apply indexes to fields that will be used in Joins