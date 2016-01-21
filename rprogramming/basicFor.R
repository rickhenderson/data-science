# Demonstrating different for loops
for (i in 1:10) {
	print(i)
}


# Create a vector to work with
x <- c("a", "b", "c", "e")

print("*** Dynamic Vector Size Example ***")
# Dynamically determine the size of the vector
for (i in seq_along(x)) {
	print(x[i])
}

# Create a matrix to work with (2x3)
x <- matrix(1:6, 2, 3)
print(x)
print("*** Matrix Example ***")
for(i in seq_len(nrow(x))) {
	for (j in seq_len(ncol(x))) {
		print(x[i, j])
	}
}

