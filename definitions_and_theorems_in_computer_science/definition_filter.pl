$collect = 0;
$current = "";
while(<>) {
	if($_ =~ m/^[ \t\n]*(D|d) *(e *f *i *n *i *t *i *o *n|e *f *i *n *i *t *i *e) +[0-9]+/) {
		$line = $_;
		if($collect) {
			print MoreLaTeX($current);
		}
		$collect = 1;
		$current = $line;
	}
	elsif($collect) {
		if($_ =~ m/^[ \t\n]*$/) {
			print MoreLaTeX($current);
			$collect = 0;
			$current = "";
		}
		else {
			$current = "$current$_";
		}
	}
}
print "$current";

sub MoreLaTeX {
	$inp = $_[0];
	$inp =~ s/^•/\\item /g;
	$inp =~ s/∅/\\emptyset /g;
	$inp =~ s/⊆/\\subseteq /g;
	$inp =~ s/∈ +\//\\notin /g;
	$inp =~ s/∈/\\in /g;
	$inp =~ s/→/\\rightarrow /g;
	$inp =~ s/⇔/\\Leftrightarrow /g;
	$inp =~ s/∧/\\wedge /g;
	$inp =~ s/¬/\\neg /g;
	$inp =~ s/∪/\\cup /g;
	$inp =~ s/∩/\\cap /g;
	$inp =~ s/∔/\\dotplus /g;
	$inp =~ s/⊂/\\subseteq /g;
	$inp =~ s/≥/\\geq /g;
	$inp =~ s/⊕/\\oplus /g;
	$inp =~ s/⊖/\\ominus /g;
	$inp =~ s/⊤/\\top /g;
	
	$inp =~ s/α/\\alpha /g;
	$inp =~ s/τ/\\tau /g;
	
	$inp =~ s/···+/\\ldots /g;
	$inp =~ s/·/\\cdot /g;
	$inp =~ s/\.\.\./\\ldots /g;
	
	$inp =~ s/ +\\/\\/g;#reducing space
	$inp =~ s/(\\[A-Za-z]+) +/$1 /g;#reducing space
	$inp =~ s/ +,/,/g;#reducing space
	$inp =~ s/ +\./\./g;#reducing space
	print "\\begin{defi}\n$inp\\cite{}\n\\end{defi}\n\n";
}
