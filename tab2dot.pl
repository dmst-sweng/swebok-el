print q(digraph D {
	randir = TB;
);
while (<>) {
	m/^(\t*)(.*)\n/;
	$this_level = length($1);
	$this_name = $2;
	$name[$this_level] = $this_name;
	my $parent_name;
	if ($this_level > 0) {
		$parent_name = $name[$this_level - 1];
		print qq{\t"$parent_name" -> "$this_name";\n};
	}
}
print "}\n";
