#!/bin/env perl

use strict;
use warnings;
use open qw(:std :utf8);

binmode STDOUT, ':utf8';

# Maximum line length (in characters)
my $line_length = 20;

print q(digraph D {
	node [fontname="Sans"];
	splines=ortho;
	ranksep=0.2;
	node [shape=box, width=2];
	edge [dir=none];
	randir = TB;
);

# Close a dot cluster structure
sub
close_cluster
{
	print ";\n\t}\n";
}

# Fold the text on the specified width
sub
fold_text
{
	my ($text) = @_;
	my $result = '';
	while (length($text) > $line_length) {
		if (!($text =~ s/^(.{3,20}) (.*)/$2/)) {
			print STDERR "Unable to fold $text\n";
			exit 1;
		}
		$result .= "$1\\n";
	}
	$result .= $text;
	return $result;
}


my $cluster;
my $top;

while (<>) {
	# Ignore line comments
	next if (/^\s*\#/);

	# Parse input line
	m/^(\t*)([^\r\n]*)\r?\n/;
	my $level = length($1);
	my $name = fold_text($2);

	# Rules for each diagram level
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
