#!/usr/bin/perl
#Convert pcm files to wav:
#pcm: Signalkoding: lineær PCM, Filformat: ukodete rådata (headerless raw), Samplingsfrekvens: 44 kHz, Oppløsning: 16 bit, Format: Motorola PCM, Kanaler: 2 (stereo): tale + laryngograf
#wav: RIFF (little-endian) data, WAVE audio, Microsoft PCM, 16 bit, mono 16000 Hz

$pcmdir = "data/sw_pcms/mf";
$wavdir = "data/nst_sv/wav";

@pcmfiles = glob("$pcmdir/*.pcm");
foreach $pcmfile (@pcmfiles) {
    chomp($pcmfile);
    $pcmfile =~ /([^\/]+).pcm$/;
    $base = $1;
    $wavfile = "$wavdir/$base.wav";
    print "$pcmfile -> $wavfile\n";

    $cmd = "sox -r 44100 -b 16 -c 2 -t raw -e signed --endian big $pcmfile -r 16000 $wavfile remix 2";
    print "$cmd\n";

    `$cmd`;
}


