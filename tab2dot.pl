#!/bin/env perl

print q(digraph D {
	splines=ortho;
	ranksep=0.2;
	node [shape=box, width=3];
	edge [dir=none];
	randir = TB;
);

sub
close_cluster
{
	print ";\n\t}\n";
}

my $cluster;

while (<>) {
	m/^(\t*)(.*)\n/;
	$level = length($1);
	$name = $2;
	if ($level == 0) {
		$top = $name;
	} elsif ($level == 1) {
		close_cluster if (defined($cluster));
		$cluster++;
		print qq(
	"$top" -> "$name";
	subgraph cluster_$cluster {
		color=lightgray;
		style=filled;
		edge [style=invis];
		"$name" [shape=plaintext];
		node [shape=box, color=white, style=filled];
		"$name" );
	} elsif ($level == 2) {
		print qq( -> "$name" );
	}
}
close_cluster;
print "}\n";
