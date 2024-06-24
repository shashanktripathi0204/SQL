Use *CTEs*
We need single query output
Querying small to medium-seized datasets

Limitations *CTEs*

Can only be used in the current query scope, meaning they can not be referenced after the final select.
This is a problem if we need to reuse the virtual tables multiple times for different purposes.
Virtual tables can not be refernence individually, making debugging more difficult.
Certain optimization techniques are not avaliable in CETs