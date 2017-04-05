#!/usr/bin/perl -w

#Line 4155 in scripts/mf/sw_all is missing
#Line 5145 in scripts/mf/sw_all is missing

$infile = "data/sw_pcms/scripts/mf/sw_all";
$outdir = "data/nst_sv/txt";
$outdatafile = "data/nst_sv/txt.done.data";

$prefix = "sw_all_mf_01";

open(IN,$infile);
open(OUTDATA, ">$outdatafile");
$nr = 1;
while (<IN>) {

    <IN> if ( $nr == "4155");
    <IN> if ( $nr == "5145");
    
    chomp;
    $text = $_;
    $base = sprintf "%s_%04d", $prefix, $nr;
    print "$base\n";

    print OUTDATA "( $base \"$text\")\n";

    open(OUT, ">$outdir/$base.txt");
    print OUT "$text\n";
    close(OUT);

    $nr++;
    
}
