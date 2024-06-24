# Indexes

1. These are database objects that can make queries against your table faster.

2. They do this by sorting the data in the field they apply to - either in the table itself or in a seperate data structure.

3. This sorting allows the database engine to locate records within a table without having to search through the table row by row.

4. There are two typs of indexes :- clustered and non-clustered.


## Clustered Index

1. The rows of a table with clustered index are physically sorted based on the field or fields the index is applied to.

2. A table with primary key is given a clustered index (based on the primary key field) by default.

3. Most tables should have a clustered index, as queries against tables with clustered index, generally tend to be faster.

4. A table may only have one clustered index, more than 1 clustered index will require the addition of non clustered index.

### Clustered Index Strategies

1. Apply clustered index to whatever field or fields are most likely to be used in a join against the table.

2. Ideally this field (or combination of fields) should also be the one that most uniquely defines a record in the table.

3. Whatever field would be a good Candidate for a primary key of the table is usually a good candidate for a clustered index.

## Non Clustered index

1. A table may have many non clustered indexes 

2. Non clustered index do not physically sort the date in a table like clustered indexes do.

3. The sorted of the field or fields non clustered indexes allpy to is stored in an external data structure, which works like a kind of phone book.

### Non Clustered Index Strategies

1. If you will be joining your table on the fields beside the one "covered" by the clustered idnex, consider non clustered indexes on those fields.

2. We can add as many non clustered index as we like but should be judicious in doing so.

3. Fields covered by non clustered index should still have a high level of uniqueness


## Indexes General Approach

1. Its how our table are utilized in joins that should drive our use and design of indexes.

2. We should generally add a clustered index first and then layer in non clustered indexes as needed to "cover" additional fields used in joins against our table.

3. Indexes take up memory in data base so only add them when they are really needed.


