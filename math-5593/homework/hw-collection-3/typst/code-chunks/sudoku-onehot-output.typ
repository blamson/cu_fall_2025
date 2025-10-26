Here is our given problem

```
grid_data [*,*]
:   1   2   3   4   5   6   7   8   9    :=
1   0   0   0   2   6   0   7   0   1
2   6   8   0   0   7   0   0   9   0
3   1   9   0   0   0   4   5   0   0
4   8   2   0   1   0   0   0   4   0
5   0   0   4   6   0   2   9   0   0
6   0   5   0   0   0   3   0   2   8
7   0   0   9   3   0   0   0   7   4
8   0   4   0   0   5   0   0   3   6
9   7   0   3   0   1   8   0   0   0
```

Here is the solution (cleaned up with python)

```
[4, 3, 5, 2, 6, 9, 7, 8, 1]
[6, 8, 2, 5, 7, 1, 4, 9, 3]
[1, 9, 7, 8, 3, 4, 5, 6, 2]
[8, 2, 6, 1, 9, 5, 3, 4, 7]
[3, 7, 4, 6, 8, 2, 9, 1, 5]
[9, 5, 1, 7, 4, 3, 6, 2, 8]
[5, 1, 9, 3, 2, 6, 8, 7, 4]
[2, 4, 8, 9, 5, 7, 1, 3, 6]
[7, 6, 3, 4, 1, 8, 2, 5, 9]
```

And to show an example of the makeup of this solution under the hood, here is the layer for the value $1$. This will show all the locations there the cells is $1$.

```
X[i,j,1] [*,*]
:   1   2   3   4   5   6   7   8   9    :=
1   0   0   0   0   0   0   0   0   1
2   0   0   0   0   0   1   0   0   0
3   1   0   0   0   0   0   0   0   0
4   0   0   0   1   0   0   0   0   0
5   0   0   0   0   0   0   0   1   0
6   0   0   1   0   0   0   0   0   0
7   0   1   0   0   0   0   0   0   0
8   0   0   0   0   0   0   1   0   0
9   0   0   0   0   1   0   0   0   0
```